#include "tpccclient.h"

#include <cstdio>
#include <vector>

#include "assert.h"
#include "clock.h"
#include "randomgenerator.h"
#include "tpccdb.h"
#include <iostream>
#include <iomanip>
using std::vector;

TPCCClient::TPCCClient(Clock *clock, tpcc::RandomGenerator *generator, TPCCDB *db, int num_items,
                       int num_warehouses, int districts_per_warehouse, int customers_per_district) : clock_(clock),
                                                                                                      generator_(generator),
                                                                                                      db_(db),
                                                                                                      num_items_(num_items),
                                                                                                      num_warehouses_(num_warehouses),
                                                                                                      districts_per_warehouse_(districts_per_warehouse),
                                                                                                      customers_per_district_(customers_per_district),
                                                                                                      remote_item_milli_p_(OrderLine::REMOTE_PROBABILITY_MILLIS),
                                                                                                      bound_warehouse_(0),
                                                                                                      bound_district_(0)
{
    assert(clock_ != NULL);
    assert(generator_ != NULL);
    assert(db_ != NULL);
    assert(1 <= num_items_ && num_items_ <= Item::NUM_ITEMS);
    assert(1 <= num_warehouses_ && num_warehouses_ <= Warehouse::MAX_WAREHOUSE_ID);
    assert(1 <= districts_per_warehouse_ &&
           districts_per_warehouse_ <= District::NUM_PER_WAREHOUSE);
    assert(1 <= customers_per_district_ && customers_per_district_ <= Customer::NUM_PER_DISTRICT);
}

TPCCClient::~TPCCClient()
{
    delete clock_;
    delete generator_;
    delete db_;
}

void TPCCClient::doStockLevel()
{
    int32_t threshold = generator_->number(MIN_STOCK_LEVEL_THRESHOLD, MAX_STOCK_LEVEL_THRESHOLD);
    int result = db_->stockLevel(generateWarehouse(), generateDistrict(), threshold);
    assert(result >= 0);
}

void TPCCClient::doOrderStatus()
{
    OrderStatusOutput output;
    int y = generator_->number(1, 100);
    if (y <= 60)
    {
        // 60%: order status by last name
        char c_last[Customer::MAX_LAST + 1];
        generator_->lastName(c_last, customers_per_district_);
        db_->orderStatus(generateWarehouse(), generateDistrict(), c_last, &output);
    }
    else
    {
        // 40%: order status by id
        assert(y > 60);
        db_->orderStatus(generateWarehouse(), generateDistrict(), generateCID(), &output);
    }
}

void TPCCClient::doDelivery()
{
    int carrier = generator_->number(Order::MIN_CARRIER_ID, Order::MAX_CARRIER_ID);
    char now[Clock::DATETIME_SIZE + 1];
    clock_->getDateTimestamp(now);

    vector<DeliveryOrderInfo> orders;
    db_->delivery(generateWarehouse(), carrier, now, &orders, NULL);
    if (orders.size() != District::NUM_PER_WAREHOUSE)
    {
        printf("Only delivered from %zd districts\n", orders.size());
    }
}

void TPCCClient::doPayment()
{
    PaymentOutput output;
    int x = generator_->number(1, 100);
    int y = generator_->number(1, 100);

    int32_t w_id = generateWarehouse();
    int32_t d_id = generateDistrict();

    int32_t c_w_id;
    int32_t c_d_id;
    if (num_warehouses_ == 1 || x <= 85)
    {
        // 85%: paying through own warehouse (or there is only 1 warehouse)
        c_w_id = w_id;
        c_d_id = d_id;
    }
    else
    {
        // 15%: paying through another warehouse:
        // select in range [1, num_warehouses] excluding w_id
        c_w_id = generator_->numberExcluding(1, num_warehouses_, w_id);
        assert(c_w_id != w_id);
        c_d_id = generateDistrict();
    }
    float h_amount = generator_->fixedPoint(2, MIN_PAYMENT_AMOUNT, MAX_PAYMENT_AMOUNT);

    char now[Clock::DATETIME_SIZE + 1];
    clock_->getDateTimestamp(now);
    if (y <= 60)
    {
        // 60%: payment by last name
        char c_last[Customer::MAX_LAST + 1];
        generator_->lastName(c_last, customers_per_district_);
        db_->payment(w_id, d_id, c_w_id, c_d_id, c_last, h_amount, now, &output, NULL);
    }
    else
    {
        // 40%: payment by id
        assert(y > 60);
        db_->payment(w_id, d_id, c_w_id, c_d_id, generateCID(), h_amount, now, &output, NULL);
    }
}

bool TPCCClient::doNewOrder()
{
    // get a random warehouse id
    int32_t w_id = generateWarehouse();
    // get a number of items between 5 and 15
    int ol_cnt = generator_->number(Order::MIN_OL_CNT, Order::MAX_OL_CNT);

    // 1% of transactions roll back
    bool rollback = generator_->number(1, 100) == 1;

    vector<NewOrderItem> items(ol_cnt);
    for (int i = 0; i < ol_cnt; ++i)
    {
        if (rollback && i + 1 == ol_cnt)
        {
            items[i].i_id = Item::NUM_ITEMS + 1;
        }
        else
        {
            items[i].i_id = generateItemID();
        }

        // TPC-C suggests generating a number in range (1, 100) and selecting remote on 1
        // This provides more variation, and lets us tune the fraction of "remote" transactions.
        bool remote = generator_->number(1, 1000) <= remote_item_milli_p_;
        if (num_warehouses_ > 1 && remote)
        {
            items[i].ol_supply_w_id = generator_->numberExcluding(1, num_warehouses_, w_id);
        }
        else
        {
            items[i].ol_supply_w_id = w_id;
        }
        items[i].ol_quantity = generator_->number(1, MAX_OL_QUANTITY);
    }

    char now[Clock::DATETIME_SIZE + 1];
    clock_->getDateTimestamp(now);
    NewOrderOutput output;
    // pick a random district served by this warehouse and random customer
    bool result = db_->newOrder(
        w_id, generateDistrict(), generateCID(), items, now, &output, NULL);
    assert(result == !rollback);
    return result;
}

void TPCCClient::doOne()
{
    // This is not strictly accurate: The requirement is for certain *minimum* percentages to be
    // maintained. This is close to the right thing, but not precisely correct.
    // See TPC-C 5.2.4 (page 68).
    int x = generator_->number(1, 100);
    if (x <= 4)
    { // 4%
        nStockLevel++;
        doStockLevel();
    }
    else if (x <= 8)
    { // 4%
        nDelivery++;
        doDelivery();
    }
    else if (x <= 12)
    { // 4%
        nOrderStatus++;
        doOrderStatus();
    }
    else if (x <= 12 + 43)
    { // 43%
        nPayment++;
        doPayment();
    }
    else
    { // 45%
        assert(x > 100 - 45);
        nNewOrder++;
        doNewOrder();
    }
}

void TPCCClient::remote_item_milli_p(int remote_item_milli_p)
{
    assert(0 <= remote_item_milli_p && remote_item_milli_p <= 1000);
    remote_item_milli_p_ = remote_item_milli_p;
}

void TPCCClient::bindWarehouseDistrict(int warehouse_id, int district_id)
{
    assert(0 <= warehouse_id && warehouse_id <= num_warehouses_);
    assert(0 <= district_id && district_id <= districts_per_warehouse_);
    bound_warehouse_ = warehouse_id;
    bound_district_ = district_id;
}

int32_t TPCCClient::generateWarehouse()
{
    if (bound_warehouse_ == 0)
    {
        return generator_->number(1, num_warehouses_);
    }
    else
    {
        return bound_warehouse_;
    }
}

int32_t TPCCClient::generateDistrict()
{
    if (bound_district_ == 0)
    {
        return generator_->number(1, districts_per_warehouse_);
    }
    else
    {
        return bound_district_;
    }
}

int32_t TPCCClient::generateCID()
{
    return generator_->NURand(1023, 1, customers_per_district_);
}

int32_t TPCCClient::generateItemID()
{
    return generator_->NURand(8191, 1, num_items_);
}

void TPCCClient::printStats()
{
    std::setprecision(2);
    int total = nNewOrder + nPayment + nStockLevel + nDelivery + nOrderStatus;
    std::cout << "NewOrder: " << nNewOrder << " (" << nNewOrder * 100.0 / total << " %)" << std::endl;
    std::cout << "Payment: " << nPayment << " (" << nPayment * 100.0 / total << " %)" << std::endl;
    std::cout << "StockLevel: " << nStockLevel << " (" << nStockLevel * 100.0 / total << " %)" << std::endl;
    std::cout << "Delivery: " << nDelivery << " (" << nDelivery * 100.0 / total << " %)" << std::endl;
    std::cout << "OrderStatus: " << nOrderStatus << " (" << nOrderStatus * 100.0 / total << " %) " << std::endl;
}

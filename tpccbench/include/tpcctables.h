#ifndef TPCCTABLES_H__
#define TPCCTABLES_H__

#include <map>
#include <set>
#include <vector>
#include <assert.h>

// #include "btree.h"
#include "tpccdb.h"
#include "tree_api.h"

class CustomerByNameOrdering
{
public:
        bool operator()(const Customer *a, const Customer *b) const;
};

// would be good to make it a template too, specifying the key type (now its int32_t)
// Stores all the tables in TPC-C
class TPCCTables : public TPCCDB
{
public:
        virtual ~TPCCTables();

        virtual int32_t stockLevel(int32_t warehouse_id, int32_t district_id, int32_t threshold);
        virtual void orderStatus(int32_t warehouse_id, int32_t district_id, int32_t customer_id,
                                 OrderStatusOutput *output);
        virtual void orderStatus(int32_t warehouse_id, int32_t district_id, const char *c_last,
                                 OrderStatusOutput *output);
        virtual bool newOrder(int32_t warehouse_id, int32_t district_id, int32_t customer_id,
                              const std::vector<NewOrderItem> &items, const char *now,
                              NewOrderOutput *output, TPCCUndo **undo);
        virtual bool newOrderHome(int32_t warehouse_id, int32_t district_id, int32_t customer_id,
                                  const std::vector<NewOrderItem> &items, const char *now,
                                  NewOrderOutput *output, TPCCUndo **undo);
        virtual bool newOrderRemote(int32_t home_warehouse, int32_t remote_warehouse,
                                    const std::vector<NewOrderItem> &items, std::vector<int32_t> *out_quantities,
                                    TPCCUndo **undo);
        virtual void payment(int32_t warehouse_id, int32_t district_id, int32_t c_warehouse_id,
                             int32_t c_district_id, int32_t customer_id, float h_amount, const char *now,
                             PaymentOutput *output, TPCCUndo **undo);
        virtual void payment(int32_t warehouse_id, int32_t district_id, int32_t c_warehouse_id,
                             int32_t c_district_id, const char *c_last, float h_amount, const char *now,
                             PaymentOutput *output, TPCCUndo **undo);
        virtual void paymentHome(int32_t warehouse_id, int32_t district_id, int32_t c_warehouse_id,
                                 int32_t c_district_id, int32_t c_id, float h_amount, const char *now,
                                 PaymentOutput *output, TPCCUndo **undo);
        virtual void paymentRemote(int32_t warehouse_id, int32_t district_id, int32_t c_warehouse_id,
                                   int32_t c_district_id, int32_t c_id, float h_amount, PaymentOutput *output,
                                   TPCCUndo **undo);
        virtual void paymentRemote(int32_t warehouse_id, int32_t district_id, int32_t c_warehouse_id,
                                   int32_t c_district_id, const char *c_last, float h_amount, PaymentOutput *output,
                                   TPCCUndo **undo);
        virtual void delivery(int32_t warehouse_id, int32_t carrier_id, const char *now,
                              std::vector<DeliveryOrderInfo> *orders, TPCCUndo **undo);
        virtual bool hasWarehouse(int32_t warehouse_id) { return findWarehouse(warehouse_id) != NULL; }
        virtual void applyUndo(TPCCUndo *undo);
        virtual void freeUndo(TPCCUndo *undo)
        {
                assert(undo != NULL);
                delete undo;
        }

        void reserveItems(int size) { items_.reserve(size); }
        // Copies item into the item table.
        void insertItem(const Item &item);
        Item *findItem(int32_t i_id);

        void insertWarehouse(const Warehouse &warehouse);
        Warehouse *findWarehouse(int32_t w_id);

        void insertStock(const Stock &stock);
        Stock *findStock(int32_t w_id, int32_t s_id);

        void insertDistrict(const District &district);
        District *findDistrict(int32_t w_id, int32_t d_id);

        void insertCustomer(const Customer &customer);
        Customer *findCustomer(int32_t w_id, int32_t d_id, int32_t c_id);
        // Finds all customers that match (w_id, d_id, *, c_last), taking the n/2th one (rounded up).
        Customer *findCustomerByName(int32_t w_id, int32_t d_id, const char *c_last);

        // Stores order in the database. Returns a pointer to the database's tuple.
        Order *insertOrder(const Order &order);
        Order *findOrder(int32_t w_id, int32_t d_id, int32_t o_id);
        Order *findLastOrderByCustomer(int32_t w_id, int32_t d_id, int32_t c_id);

        // Stores orderline in the database. Returns a pointer to the database's tuple.
        OrderLine *insertOrderLine(const OrderLine &orderline);
        OrderLine *findOrderLine(int32_t w_id, int32_t d_id, int32_t o_id, int32_t number);

        // Creates a new order in the database. Returns a pointer to the database's tuple.
        NewOrder *insertNewOrder(int32_t w_id, int32_t d_id, int32_t o_id);
        NewOrder *findNewOrder(int32_t w_id, int32_t d_id, int32_t o_id);

        const std::vector<const History *> &history() const { return history_; }
        // Stores order in the database. Returns a pointer to the database's tuple.
        History *insertHistory(const History &history);

        static const int KEYS_PER_INTERNAL = 8;
        static const int KEYS_PER_LEAF = 8;

        // bad thing, I know, to have these public, but it works..?
        TreeApi *warehouses_;
        TreeApi *stock_;
        TreeApi *districts_;
        TreeApi *customers_;
        TreeApi *orders_;
        // TODO: Tune the size of this tree for the bigger keys?
        TreeApi *orders_by_customer_;
        TreeApi *orderlines_;

private:
        static const int STOCK_LEVEL_ORDERS = 20;

        // Loads each item from the items table. Returns true if they are all found.
        bool findAndValidateItems(const std::vector<NewOrderItem> &items,
                                  std::vector<Item *> *item_tuples);

        // Implements order status transaction after the customer tuple has been located.
        void internalOrderStatus(Customer *customer, OrderStatusOutput *output);

        // Implements payment transaction after the customer tuple has been located.
        void internalPaymentRemote(int32_t warehouse_id, int32_t district_id, Customer *c,
                                   float h_amount, PaymentOutput *output, TPCCUndo **undo);

        // Erases order from the database. NOTE: This is only for undoing transactions.
        void eraseOrder(const Order *order);
        // Erases order_line from the database. NOTE: This is only for undoing transactions.
        void eraseOrderLine(const OrderLine *order_line);
        // Erases new_order from the database. NOTE: This is only for undoing transactions.
        void eraseNewOrder(const NewOrder *new_order);
        // Erases history from the database. NOTE: This is only for undoing transactions.
        void eraseHistory(const History *history);

        // Allocates an undo buffer if needed, storing the pointer in *undo.
        void allocateUndo(TPCCUndo **undo)
        {
                if (undo != NULL && *undo == NULL)
                {
                        *undo = new TPCCUndo();
                }
        }

        /* all these will have to be pointers if we want them to be extensions of TreeApi */
        //     std::vector<Item> items_;

        //     TreeApi<int32_t, Warehouse*> *warehouses_ = new BPlusTree<int32_t, Warehouse*, KEYS_PER_INTERNAL, KEYS_PER_LEAF>();
        //     TreeApi<int32_t, Stock*> *stock_ = new BPlusTree<int32_t, Stock*, KEYS_PER_INTERNAL, KEYS_PER_LEAF>();
        //     TreeApi<int32_t, District*> *districts_ = new BPlusTree<int32_t, District*, KEYS_PER_INTERNAL, KEYS_PER_LEAF>();
        //     TreeApi<int32_t, Customer*> *customers_ = new BPlusTree<int32_t, Customer*, KEYS_PER_INTERNAL, KEYS_PER_LEAF>();
        //     typedef std::set<Customer*, CustomerByNameOrdering> CustomerByNameSet;
        //     CustomerByNameSet customers_by_name_;
        //     TreeApi<int32_t, Order*> *orders_ = new BPlusTree<int32_t, Order*, KEYS_PER_INTERNAL, KEYS_PER_LEAF>();
        //     // TODO: Tune the size of this tree for the bigger keys?
        //     TreeApi<int64_t, Order*> *orders_by_customer_ = new BPlusTree<int64_t, Order*, KEYS_PER_INTERNAL, KEYS_PER_LEAF>();
        //     TreeApi<int32_t, OrderLine*> *orderlines_ = new BPlusTree<int32_t, OrderLine*, KEYS_PER_INTERNAL, KEYS_PER_LEAF>();
        //     // TODO: Implement btree lower_bound?
        //     // why are history, neworders and items vectors mr evanj? use one backend for tpcc
        //     typedef std::map<int64_t, NewOrder*> NewOrderMap;
        //     NewOrderMap neworders_;
        //     std::vector<const History*> history_;

        std::vector<Item> items_;

        typedef std::set<Customer *, CustomerByNameOrdering> CustomerByNameSet;
        CustomerByNameSet customers_by_name_;
        // TODO: Implement btree lower_bound?
        // why are history, neworders and items vectors mr evanj? use one backend for tpcc
        typedef std::map<int64_t, NewOrder *> NewOrderMap;
        NewOrderMap neworders_;
        std::vector<const History *> history_;
};

#endif

// Copyright 2008,2009,2010 Massachusetts Institute of Technology.
// All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

#define __STDC_FORMAT_MACROS
#include <climits>
#include <cstdio>
#include <inttypes.h>
#include <dlfcn.h>

#include "clock.h"
#include "randomgenerator.h"
#include "tpccclient.h"
#include "tpccgenerator.h"
#include "tpcctables.h"
#include "library_loader.hpp"
#include "tree_api.h"

// static const int NUM_TRANSACTIONS = 200000;

int main(int argc, const char *argv[])
{
    int NUM_TRANSACTIONS = 200000;
    if (argc < 4)
    {
        fprintf(stderr, "tpcc [num warehouses] [num transactions] [path_to_lib_wrapper.so]\n");
        exit(1);
    }

    if (argc > 4)
    {
        fprintf(stderr, "tpcc [num warehouses] [num transactions] [path_to_lib_wrapper.so]\n");
        exit(1);
    }

    if (argc == 4)
    {
        NUM_TRANSACTIONS = atoi(argv[2]);
        // NUM_TRANSACTIONS *= 1000;
    }

    long num_warehouses = strtol(argv[1], NULL, 10);
    if (num_warehouses == LONG_MIN || num_warehouses == LONG_MAX)
    {
        fprintf(stderr, "Bad warehouse number (%s)\n", argv[1]);
        exit(1);
    }
    if (num_warehouses <= 0)
    {
        fprintf(stderr, "Number of warehouses must be > 0 (was %ld)\n", num_warehouses);
        exit(1);
    }
    if (num_warehouses > Warehouse::MAX_WAREHOUSE_ID)
    {
        fprintf(stderr, "Number of warehouses must be <= %d (was %ld)\n", Warehouse::MAX_WAREHOUSE_ID, num_warehouses);
        exit(1);
    }

    tree_options_t opt;
    opt.key_size = 4;
    opt.value_size = 8;
    opt.table = WAREHOUSES;
    auto path = argv[3];
    std::string str(path);
    // open library that defines the tree type to use
    library_loader_t lib(str);

    // just the default constructor then
    TPCCTables *tables = new TPCCTables();
    // now change the orders_, stock_ etc to the appropriate tree type
    // the following are ok with int32_t size
    tables->warehouses_ = lib.create_tree(&opt);
    opt.table = STOCK;
    tables->stock_ = lib.create_tree(&opt);
    opt.table = DISTRICTS;
    tables->districts_ = lib.create_tree(&opt);
    opt.table = CUSTOMERS;
    tables->customers_ = lib.create_tree(&opt);
    opt.table = ORDERS;
    tables->orders_ = lib.create_tree(&opt);
    opt.table = ORDERLINES;
    tables->orderlines_ = lib.create_tree(&opt);
    // TODO: Tune the size of this tree for the bigger keys?
    // need int64 for orders_by_customer
    opt.key_size = 8;
    opt.table = ORDERS_BY_CUSTOMER;
    tables->orders_by_customer_ = lib.create_tree(&opt);
    SystemClock *clock = new SystemClock();

    // Create a generator for filling the database.
    tpcc::RealRandomGenerator *random = new tpcc::RealRandomGenerator();
    tpcc::NURandC cLoad = tpcc::NURandC::makeRandom(random);
    random->setC(cLoad);

    // Generate the data
    printf("Loading %ld warehouses... ", num_warehouses);
    fflush(stdout);
    char now[Clock::DATETIME_SIZE + 1];
    clock->getDateTimestamp(now);
    TPCCGenerator generator(random, now, Item::NUM_ITEMS, District::NUM_PER_WAREHOUSE,
                            Customer::NUM_PER_DISTRICT, NewOrder::INITIAL_NUM_PER_DISTRICT);
    int64_t begin = clock->getMicroseconds();
    /*
     * TPC-C specs loading order :
     * LoadItems() - this implementation is ok (except it puts them in a vector)
     * LoadWare() - 
     * LoadCust() - Customer(d_id, w_id)
     * LoadOrd() - loads the orders and order line tables - Orders(d_id, w_id)
     */
    generator.makeItemsTable(tables);
    for (int i = 0; i < num_warehouses; ++i)
    {
        // LoadWare() routine calls Stock(w_id) and District(w_id) for every w_id generated
        generator.makeWarehouse(tables, i + 1);
    }
    int64_t end = clock->getMicroseconds();
    printf("%" PRId64 " ms\n", (end - begin + 500) / 1000);

    // Change the constants for run
    random = new tpcc::RealRandomGenerator();
    random->setC(tpcc::NURandC::makeRandomForRun(random, cLoad));

    // Client owns all the parameters
    TPCCClient client(clock, random, tables, Item::NUM_ITEMS, static_cast<int>(num_warehouses),
                      District::NUM_PER_WAREHOUSE, Customer::NUM_PER_DISTRICT);
    printf("Running... ");
    fflush(stdout);
    begin = clock->getMicroseconds();
    for (int i = 0; i < NUM_TRANSACTIONS; ++i)
    {
        client.doOne();
    }
    end = clock->getMicroseconds();
    int64_t microseconds = end - begin;
    printf("%d transactions in %" PRId64 " ms = %f txns/s\n", NUM_TRANSACTIONS,
           (microseconds + 500) / 1000, NUM_TRANSACTIONS / (double)microseconds * 1000000.0);
    // also do a check of the transaction mix
    client.printStats();

    return 0;
}

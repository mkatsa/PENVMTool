#include "pbwtree_wrapper.hpp"
#include "../../include/tree_api.h"
#include "../../include/tpccdb.h"
#include "P-BwTree/src/bwtree.h"

extern "C" TreeApi* create_tree(tree_options_t *opt) {
    if (opt->key_size == 4)
    {
        switch(opt->table)
        {
            case WAREHOUSES:
                return new bwtree_wrapper<int32_t, Warehouse *>();
                break;
            case STOCK:
                return new bwtree_wrapper<int32_t, Stock *>();
                break;
            case DISTRICTS:
                return new bwtree_wrapper<int32_t, District *>();
                break;
            case CUSTOMERS:
                return new bwtree_wrapper<int32_t, Customer *>();
                break;
            case ORDERS:
                return new bwtree_wrapper<int32_t, Order *>();
                break;
            case ORDERS_BY_CUSTOMER: 
                return new bwtree_wrapper<int64_t, Order *>();
                break;
            case ORDERLINES:
                return new bwtree_wrapper<int32_t, OrderLine *>();
                break;
            default:
                // error
                return nullptr;
        }
    }
    else 
        return new bwtree_wrapper<int64_t, Order *>();
}
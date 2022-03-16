#include "wbtree_wrapper.hpp"
#include "../../include/tree_api.h"
#include "../../include/tpccdb.h"

extern "C" TreeApi* create_tree(tree_options_t *opt) {
    if (opt->key_size == 4)
    {
        switch(opt->table)
        {
            case WAREHOUSES:
                return new wbtree_wrapper<int32_t, Warehouse *>();
                break;
            case STOCK:
                return new wbtree_wrapper<int32_t, Stock *>();
                break;
            case DISTRICTS:
                return new wbtree_wrapper<int32_t, District *>();
                break;
            case CUSTOMERS:
                return new wbtree_wrapper<int32_t, Customer *>();
                break;
            case ORDERS:
                return new wbtree_wrapper<int32_t, Order *>();
                break;
            case ORDERS_BY_CUSTOMER: 
                return new wbtree_wrapper<int64_t, Order *>();
                break;
            case ORDERLINES:
                return new wbtree_wrapper<int32_t, OrderLine *>();
                break;
            default:
                // error
                return nullptr;
        }
    }
    else 
        return new wbtree_wrapper<int64_t, Order *>();
}
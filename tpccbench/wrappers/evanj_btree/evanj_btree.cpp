#include "evanj_btree.hpp"
#include "tree_api.h"
#include "tpccdb.h"

#define KEYS_PER_LEAF 8
#define KEYS_PER_INTERNAL 8

// I also need tpccdb for the Warehouse*, Order * etc types
extern "C" TreeApi* create_tree(tree_options_t *opt)
{
    if (opt->key_size == 4)
    {
        switch(opt->table)
        {
            case WAREHOUSES:
                return new BPlusTree<int32_t, Warehouse *, KEYS_PER_INTERNAL, KEYS_PER_LEAF>();
                break;
            case STOCK:
                return new BPlusTree<int32_t, Stock *, KEYS_PER_INTERNAL, KEYS_PER_LEAF>();
                break;
            case DISTRICTS:
                return new BPlusTree<int32_t, District *, KEYS_PER_INTERNAL, KEYS_PER_LEAF>();
                break;
            case CUSTOMERS:
                return new BPlusTree<int32_t, Customer *, KEYS_PER_INTERNAL, KEYS_PER_LEAF>();
                break;
            case ORDERS:
                return new BPlusTree<int32_t, Order *, KEYS_PER_INTERNAL, KEYS_PER_LEAF>();
                break;
            case ORDERS_BY_CUSTOMER: 
                return new BPlusTree<int64_t, Order *, KEYS_PER_INTERNAL, KEYS_PER_LEAF>();
                break;
            case ORDERLINES:
                return new BPlusTree<int32_t, OrderLine *, KEYS_PER_INTERNAL, KEYS_PER_LEAF>();
                break;
            default:
                // error
                return nullptr;
        }
    }
    else 
        return new BPlusTree<int64_t, Order *, KEYS_PER_INTERNAL, KEYS_PER_LEAF>();
}
#ifndef __TREE_API_HPP__
#define __TREE_API_HPP__

#include <cassert>
#include <cstddef>
#include <string>
#include <iostream>

/* 
 * an abstract class or interface that supports methods 
 * insert, remove, find (sql select?)
 * piBench has methods find, insert, update, remove, scan
*/

/* let's keep the naming convention of piBench
 * This class is the wrapper class that other indexes
 * must extend, providing definitions for the methods
 * insert, remove, find
 */

// the following tables use the custom index
typedef enum
{
    WAREHOUSES,
    STOCK,
    DISTRICTS,
    CUSTOMERS,
    ORDERS,
    ORDERS_BY_CUSTOMER,
    ORDERLINES,
} table_type;

struct tree_options_t
{
    size_t key_size = 4;
    size_t value_size = 8;
    table_type table = WAREHOUSES;
};

class TreeApi;
extern "C" TreeApi *create_tree(tree_options_t *opt);

class TreeApi
{
public:
    virtual ~TreeApi(){};
    // key is an int (for bplustree), value is a pointer like Order *
    virtual void insert(const void *Nkey, const void *Nvalue) {};
    // example: tree->find(key, &output) where output: Order *, key: int32_t
    virtual bool find(const void *key, void *value = nullptr) const { return 0; };
    virtual bool remove(const void *key) {return 0;};
    virtual bool findLastLessThan(const void *key, void *value = nullptr, void *out_key = nullptr) const {return 0;};
    // i'm a bad person, don't think I will provide this one :)
    virtual void cleanup(){};
};

#endif
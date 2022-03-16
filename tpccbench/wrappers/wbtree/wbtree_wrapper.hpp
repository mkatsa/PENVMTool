#include "wbtree/wbtree.h"
#include "../../include/tree_api.h"

using namespace wbtree;
template <typename KEY, typename VALUE>
class wbtree_wrapper : public TreeApi
{
public:
    virtual ~wbtree_wrapper() {};
    wbtree_wrapper();
    void insert(const void *Nkey, const void *Nvalue) override;
    bool find(const void *Nkey, void *Nvalue = nullptr) const override;
    bool remove(const void *Nkey) override;
    bool findLastLessThan(const void *Nkey, void *Nvalue = nullptr, void *Nout_key = nullptr) const override;

    wbtree::tree *tree;
};

template <typename KEY, typename VALUE>
wbtree_wrapper<KEY, VALUE>::wbtree_wrapper()
{
    tree = wbtree::initTree();
}

// done
template<typename KEY, typename VALUE>
void wbtree_wrapper<KEY, VALUE>::insert(const void *Nkey, const void *Nvalue)
{
    KEY key = *const_cast<KEY*>(reinterpret_cast<const KEY *>(Nkey));
    VALUE value = *const_cast<VALUE*>(reinterpret_cast<const VALUE *>(Nvalue));
    // value is a pointer, e.g Order *, so we can pass it as is
    wbtree::Insert(tree, (uint64_t)key, value);
}

// done
template<typename KEY, typename VALUE>
bool wbtree_wrapper<KEY, VALUE>::find(const void *Nkey, void *Nvalue) const
{
    KEY key = *const_cast<KEY*>(reinterpret_cast<const KEY *>(Nkey));
    // VALUE is e.g. Order *
    VALUE *value = reinterpret_cast<VALUE *>(Nvalue);

    VALUE retptr = reinterpret_cast<VALUE> (wbtree::Lookup(tree, (uint64_t)key));
    if (retptr != 0)
    {
        if (value != 0)
        {
            *value = retptr;
        }
    }
    return (retptr != 0);
}


template<typename KEY, typename VALUE>
bool wbtree_wrapper<KEY, VALUE>::remove(const void *Nkey)
{
    KEY key = *const_cast<KEY*>(reinterpret_cast<const KEY *>(Nkey));
    
    int errval = wbtree::Delete(tree, (uint64_t)key);

    return (errval >= 0);
}

template<typename KEY, typename VALUE>
bool wbtree_wrapper<KEY, VALUE>::findLastLessThan(const void *Nkey, void *Nvalue, void *Nout_key)
const
{
    VALUE *value = reinterpret_cast<VALUE *>(Nvalue);
    KEY *out_key = reinterpret_cast<KEY *>(Nout_key);
    int64_t key = *const_cast<int64_t*>(reinterpret_cast<const int64_t *>(Nkey));

    int64_t prev_key = key - ( ((int64_t)1) << 32);
    unsigned long retkey, retval; 
    wbtree::tpccBenchScan(tree, (uint64_t)prev_key, (uint64_t)key, retkey, retval);

    if (retkey == 0 || retval == 0)
    {
        return false;
    }
    // must cast the value to a pointer from uint64_t
    if (value != NULL)
    {
        *value = reinterpret_cast<VALUE>(retval);
    }
    if (out_key != NULL)
    {
        *out_key = static_cast<KEY>(retkey);
    }
    return true;
}
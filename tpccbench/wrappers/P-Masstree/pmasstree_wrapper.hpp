#include "P-Masstree/masstree.h" /* TODO: the include file for PBwTree, is this the correct name? */
#include "../../include/tree_api.h"
#include <assert.h>
#include <unordered_map> /* need to have a class member map to store the keys it seems */

template <typename KEY, typename VALUE>
class masstree_wrapper : public TreeApi
{
public:
    virtual ~masstree_wrapper() {};
    masstree_wrapper();
    void insert(const void *Nkey, const void *Nvalue) override;
    bool find(const void *Nkey, void *Nvalue = nullptr) const override;
    bool remove(const void *Nkey) override;
    bool findLastLessThan(const void *Nkey, void *Nvalue = nullptr, void *Nout_key = nullptr) const override;

    masstree::masstree *tree;
    // std::unordered_map<uint64_t, Key *> keymap;
};

template<typename KEY, typename VALUE> masstree_wrapper<KEY, VALUE>::masstree_wrapper()
{
    tree = new masstree::masstree();
}

template<typename KEY, typename VALUE>
void masstree_wrapper<KEY, VALUE>::insert(const void *Nkey, const void *Nvalue)
{
    KEY key = *const_cast<KEY*>(reinterpret_cast<const KEY *>(Nkey));
    VALUE value = *const_cast<VALUE*>(reinterpret_cast<const VALUE *>(Nvalue));

    auto t = tree->getThreadInfo();
    // put(uint64_t key, void *value, ThreadInfo &tinfo)
    // must pass for example &Order *, which is 
    tree->put((uint64_t)key, value, t);
}

template<typename KEY, typename VALUE>
bool masstree_wrapper<KEY, VALUE>::find(const void *Nkey, void *Nvalue) const
{
    KEY key = *const_cast<KEY*>(reinterpret_cast<const KEY *>(Nkey));
    // VALUE is e.g. Order *
    VALUE *value = reinterpret_cast<VALUE *>(Nvalue);

    auto t = tree->getThreadInfo();
    VALUE ret = reinterpret_cast<VALUE> (tree->get((uint64_t)key, t));

    if (ret != NULL)
    {
        // copy the found value into the pointer
        if (value != 0)
        {
            *value = ret; // reinterpret_cast<VALUE>(ret);
        }
        return true;
    }
    return false; // value not found
}

template<typename KEY, typename VALUE>
bool masstree_wrapper<KEY, VALUE>::remove(const void *Nkey)
{
    KEY key = *const_cast<KEY*>(reinterpret_cast<const KEY *>(Nkey));
    VALUE value;
    // again, because the del function does not return true/false, we
    // employ this stupid 3-step way
    // would be good to tweak the del code to return true/false
    auto t = tree->getThreadInfo();
    if (tree->get((uint64_t)key, t) != NULL)
    {
        // search key exists, proceed to remove
        tree->del((uint64_t)key, t);
    }
    else
    {
        // search key did not exist, remove would have failed
        return false;
    }
    // if the key still exists then the remove failed?
    if (tree->get((uint64_t)key, t) != NULL)
    {
        return false;
    }
    else 
        return true;
}

// boohoo, masstree doesn't have iterators. What to do 
template<typename KEY, typename VALUE>
bool masstree_wrapper<KEY, VALUE>::findLastLessThan(const void *Nkey, void *Nvalue, void *Nout_key)
const
{
    // start at the previous pair of customer - key
    // for a normal tree that implements iterators, I just need to start at the first customer - order pair
    // so key here will be that smallest customer - order

    // VALUE is e.g. Order *
    // if KEY type is not int64_t this will fail
    assert((std::is_same<KEY, int64_t>::value));
    auto t = tree->getThreadInfo();
    VALUE *value = reinterpret_cast<VALUE *>(Nvalue);
    KEY *out_key = reinterpret_cast<KEY *>(Nout_key);
    int64_t key = *const_cast<int64_t*>(reinterpret_cast<const int64_t *>(Nkey));
    // std::bitset<64> bs(key);
    // since we have iterators here our life is simpler, take the previous key and go forward
    int64_t prev_key = key - ( ((int64_t)1) << 32);

    VALUE retval = reinterpret_cast<VALUE>(tree->tpccBenchScan((uint64_t)prev_key, (uint64_t)key, t));
    
    if (retval != NULL)
    {
        *value = retval;
        return true;
    }
    return false;
}
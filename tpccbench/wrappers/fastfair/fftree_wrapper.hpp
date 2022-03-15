#include "btree.h"
#include "../../include/tree_api.h"

template <typename KEY, typename VALUE>
class fftree_wrapper : public TreeApi
{
public:
    virtual ~fftree_wrapper() {};
    fftree_wrapper();
    void insert(const void *Nkey, const void *Nvalue) override;
    bool find(const void *Nkey, void *Nvalue = nullptr) const override;
    bool remove(const void *Nkey) override;
    bool findLastLessThan(const void *Nkey, void *Nvalue = nullptr, void *Nout_key = nullptr) const override;

    fastfair::btree *tree;
};

template<typename KEY, typename VALUE> fftree_wrapper<KEY, VALUE>::fftree_wrapper()
{
    tree = new fastfair::btree();
}

template<typename KEY, typename VALUE> bool fftree_wrapper<KEY, VALUE>::find(const void *Nkey, void *Nvalue) const
{
    // For now only support 8 bytes key and value (uint64_t)
    KEY key = *const_cast<KEY*>(reinterpret_cast<const KEY *>(Nkey));
    // key is either int64_t or int32_t therefore a cast to uint64 will be ok 
    // in either case

    uint64_t uint_key = (uint64_t)key;
    // now value is a pointer to a struct, therefore 8 bytes size, and can also be cast 
    // to a uint64_t without problems
    VALUE *value = reinterpret_cast<VALUE *>(Nvalue);

    char *retptr = tree->btree_search(uint_key);
    if (retptr != 0)
    {
        if (value != 0)
        {

            *value = reinterpret_cast<VALUE>(retptr); 
        }
    }

    return (retptr != 0);
}


template<typename KEY, typename VALUE> void fftree_wrapper<KEY,VALUE>::insert(const void *Nkey, const void *Nvalue)
{
    KEY key = *const_cast<KEY*>(reinterpret_cast<const KEY *>(Nkey));
    VALUE value = *const_cast<VALUE*>(reinterpret_cast<const VALUE *>(Nvalue));
    // supports both string and uint keys, obviously we care about the uint
    // value is, for example, Order *, so this might work
    tree->btree_insert((uint64_t)key, (char *) (value));
}


template<typename KEY, typename VALUE> bool fftree_wrapper<KEY, VALUE>::remove(const void *Nkey)
{
    KEY key = *const_cast<KEY*>(reinterpret_cast<const KEY *>(Nkey));
    // this originally wasnt a bool but a void, so we modified the original
    return tree->btree_delete((uint64_t)key);
}

template<typename KEY, typename VALUE> 
bool fftree_wrapper<KEY, VALUE>::findLastLessThan(const void *Nkey, void *Nvalue, void *Nout_key) const
{
    VALUE *value = reinterpret_cast<VALUE *>(Nvalue);
    KEY *out_key = reinterpret_cast<KEY *>(Nout_key);
    int64_t key = *const_cast<int64_t*>(reinterpret_cast<const int64_t *>(Nkey));

    int64_t prev_key = key - ( ((int64_t)1) << 32);
    // does fptree have iterators?

    auto kv = tree->tpccBenchScan<VALUE>((uint64_t)prev_key, (uint64_t)key);
    if (kv.first == 0 || kv.second == 0)
    {
        return false;
    }
    // must cast the value to a pointer from uint64_t
    if (value != NULL)
    {
        // What is val_addr? It should be the uint representation of, 
        // for example, an Order *
        // auto val_addr = (* (reinterpret_cast<uint64_t*>(kv.second)) );

        *value = kv.second;
    }
    if (out_key != NULL)
    {
        *out_key = static_cast<KEY>(kv.first);
    }

    return true;
}
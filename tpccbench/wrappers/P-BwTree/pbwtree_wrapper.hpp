#include "P-BwTree/src/bwtree.h" /* TODO: the include file for PBwTree, is this the correct name? */
#include "../../include/tree_api.h"
#include <assert.h>

class KeyComparator {
 public:
  inline bool operator()(const int32_t k1, const int32_t k2) const {
    return k1 < k2;
  }

  inline bool operator()(const int64_t k1, const int64_t k2) const {
      return k1 < k2;
  }

  inline bool operator()(const char *k1, const char *k2) const {
      return memcmp(k1, k2, strlen(k1) > strlen(k2) ? strlen(k1) : strlen(k2)) < 0;
  }

  KeyComparator(int dummy) {
    (void)dummy;

    return;
  }

  KeyComparator() = delete;
  //KeyComparator(const KeyComparator &p_key_cmp_obj) = delete;
};

/*
 * class KeyEqualityChecker - Tests context sensitive key equality
 *                            checker inside BwTree
 *
 * NOTE: This class is only used in KeyEqual() function, and is not
 * used as STL template argument, it is not necessary to provide
 * the object everytime a container is initialized
 */
class KeyEqualityChecker {
 public:
  inline bool operator()(const int32_t k1, const int32_t k2) const {
    return k1 == k2;
  }

  inline bool operator()(const int64_t k1, const int64_t k2) const {
      return k1 == k2;
  }

  inline bool operator()(const char *k1, const char *k2) const {
      if (strlen(k1) != strlen(k2))
          return false;
      else
          return memcmp(k1, k2, strlen(k1)) == 0;
  }

  KeyEqualityChecker(int dummy) {
    (void)dummy;

    return;
  }

  KeyEqualityChecker() = delete;
  //KeyEqualityChecker(const KeyEqualityChecker &p_key_eq_obj) = delete;
};

using namespace wangziqi2013::bwtree;

template <typename KEY, typename VALUE>
class bwtree_wrapper : public TreeApi
{
public:
    virtual ~bwtree_wrapper() {};
    bwtree_wrapper();
    void insert(const void *Nkey, const void *Nvalue) override;
    bool find(const void *Nkey, void *Nvalue = nullptr) const override;
    bool remove(const void *Nkey) override;
    bool findLastLessThan(const void *Nkey, void *Nvalue = nullptr, void *Nout_key = nullptr) const override;

// private:
// maybe you also need the key comparators for this
    // BwTree<KEY, VALUE, KeyComparator, KeyEqualityChecker> tree;
    // mutable because iterator methods are not const
    mutable BwTree<KEY, VALUE> tree;
};

template<typename KEY, typename VALUE> bwtree_wrapper<KEY, VALUE>::bwtree_wrapper()
{
    tree.UpdateThreadLocal(1);
    tree.AssignGCID(0);
}

template<typename KEY, typename VALUE>
void bwtree_wrapper<KEY, VALUE>::insert(const void *Nkey, const void *Nvalue)
{
    KEY key = *const_cast<KEY*>(reinterpret_cast<const KEY *>(Nkey));
    VALUE value = *const_cast<VALUE*>(reinterpret_cast<const VALUE *>(Nvalue));

    tree.Insert(key, value);
}

template<typename KEY, typename VALUE>
bool bwtree_wrapper<KEY, VALUE>::find(const void *Nkey, void *Nvalue) const
{
    KEY key = *const_cast<KEY*>(reinterpret_cast<const KEY *>(Nkey));
    // VALUE is e.g. Order *
    VALUE *value = reinterpret_cast<VALUE *>(Nvalue);
    std::vector<VALUE> v;
    tree.GetValue(key, v);
    if (!v.empty())
    {
        // copy the found value into the pointer
        if (value != 0)
        {
            *value = v[0];
        }
    }
    return !(v.empty()); // value not found
}

template<typename KEY, typename VALUE>
bool bwtree_wrapper<KEY, VALUE>::remove(const void *Nkey)
{
    KEY key = *const_cast<KEY*>(reinterpret_cast<const KEY *>(Nkey));
    VALUE value;
    // don't care about value but compiler would complain otherwise
    return tree.Delete(key, value);
}

template<typename KEY, typename VALUE>
bool bwtree_wrapper<KEY, VALUE>::findLastLessThan(const void *Nkey, void *Nvalue, void *Nout_key)
const
{
    // start at the previous pair of customer - key
    // for a normal tree that implements iterators, I just need to start at the first customer - order pair
    // so key here will be that smallest customer - order

    // VALUE is e.g. Order *
    // if KEY type is not int64_t this will fail
    assert((std::is_same<KEY, int64_t>::value));
    VALUE *value = reinterpret_cast<VALUE *>(Nvalue);
    KEY *out_key = reinterpret_cast<KEY *>(Nout_key);
    int64_t key = *const_cast<int64_t*>(reinterpret_cast<const int64_t *>(Nkey));
    // std::bitset<64> bs(key);
    // since we have iterators here our life is simpler, take the previous key and go forward
    int64_t prev_key = key - ( ((int64_t)1) << 32);
    auto it = tree.Begin(prev_key);
    while (it.IsEnd() != true && it->first < key)
    {
        if (value != NULL)
        {
            // keep this
            *value = it->second;
        }
            
        if (out_key != NULL)
        {
            *out_key = it->first;
        }
        it++;
    }
    if (!it.IsEnd())
    {
        return true;
    }
    else
    {
        return false;
    }
}
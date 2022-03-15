#include "bwtree.h"
#include "tree_api.h"

template <typename KEY, typename VALUE>
class bwtree_wrapper : public TreeApi
{
public:
    virtual ~bwtree_wrapper();

    virtual void insert(const void *key, const void *value) override;
    virtual bool find(const void *key, void *value = nullptr) const override;
    virtual bool remove(const void *key) override;
    virtual bool findLastLessThan(const char *key, void *value = nullptr, void *out_key = nullptr) const override;

private:
    
}
#include "tree_api.h"
#include <string>

class library_loader_t
{
public:
    library_loader_t(const std::string &path);
    ~library_loader_t();
    TreeApi *create_tree(const tree_options_t *tree_opt);

private:
    // handle for the dynamic library loaded
    void *handle_;
    // function return type is TreeApi* and we also need a function pointer *create_fn_
    TreeApi *(*create_fn_)(const tree_options_t *);
};
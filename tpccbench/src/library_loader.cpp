#include "library_loader.hpp"
#include <dlfcn.h>
#include <iostream>

library_loader_t::library_loader_t(const std::string &path)
{
    // lazy or now? makes no difference
    handle_ = dlopen(path.c_str(), RTLD_LAZY | RTLD_GLOBAL);
    if (handle_ == nullptr)
    {
        std::cout << "Error in dlopen(): " << dlerror() << std::endl;
        exit(1);
    }

    // Search function 'create_tree'
    dlerror();
    create_fn_ = (TreeApi * (*)(const tree_options_t *)) dlsym(handle_, "create_tree");
    auto err = dlerror();
    if (err != nullptr)
    {
        std::cout << "Error in dlsym(): " << err << std::endl;
        exit(1);
    }
    else if (create_fn_ == nullptr)
    {
        std::cout << "Could not find 'create()'" << std::endl;
        exit(1);
    }
}

library_loader_t::~library_loader_t()
{
    if (dlclose(handle_) != 0)
    {
        std::cout << "Error in dlclose()" << std::endl;
        return;
    }
}

TreeApi *library_loader_t::create_tree(const tree_options_t *opt)
{
    return create_fn_(opt);
}

//===----------------------------------------------------------------------===//
//
//                         Peloton
//
// bwtree.cpp
//
// Identification: src/index/bwtree.cpp
//
// Copyright (c) 2015-16, Carnegie Mellon University Database Group
//
//===----------------------------------------------------------------------===//


#include "bwtree.h"
/*void *operator new(size_t size) {
            void *ret;
            posix_memalign(&ret,64,size);
            return ret;
        }
        */
//pthread_mutex_t debug_stop_mutex;

#ifdef BWTREE_PELOTON
namespace peloton {
namespace index {
#else
namespace wangziqi2013 {
namespace bwtree {
#endif
//tbb::speculative_spin_mutex mutex;

bool print_flag = true;



// This will be initialized when thread is initialized and in a per-thread
// basis, i.e. each thread will get the same initialization image and then
// is free to change them
thread_local int BwTreeBase::gc_id = -1;

std::atomic<size_t> BwTreeBase::total_thread_num{0UL};

}  // End index/bwtree namespace
}  // End peloton/wangziqi2013 namespace


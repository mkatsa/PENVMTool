# tpccbench

Stand-alone in-memory TPC-C implementation. This is based on the prototype
used for the following VLDB 2007 paper:

http://www.vldb.org/conf/2007/papers/industrial/p1150-stonebraker.pdf

However it was rewritten and follows the spec more closely.

Evan Jones
ej@evanjones.ca


The benchmark program is "tpcc". This loads the TPC-C database with the
specified number of warehouses, then executes a number of transactions
(currently 200000). This benchmark is, I believe, a complete and correct TPC-C
implementation. There are a few noted discrepancies noted in "CHEATS". If there
are bugs, problems, fixes, or questions, please let me know.

I have another implementation that supports "locking." If you are interested
in this, talk to me.


## Overview of the code:

Everything that ends in _test is a unit test to verify that the code is correct.

tpccgenerate.cc: Code for loading the database.
tpccclient.cc: Code for generating client requests.
tpccdb.h: Definitions of the tuple types and constant
tpcctables.cc: Actual implementation of the in-memory data structures and
    TPC-C stored procedures.


Type "make", then you can run ./tpcc. I get output like:

Loading 2 warehouses... 4504 ms
Running... 200000 transactions in 6630 ms = 30167.577878 txns/s


## Licensing

This was written during my PhD at MIT. However, I did go through MIT's open
source office to release it under a BSD license. See the LICENSE file.

# Comments on Konstantina's changes

## Building

## Debugging

1. `cmake -DCMAKE_BUILD_TYPE=Debug ..`
2. In the directory build/src do:  
    1. file tpcc
    2. add-symbol-file \<relative path to shared lib of interest\> e.g add-symbol-file ../libbtree_wrapper.so
    3. add any benchmarks
    3. run \<number warehouses\> \<number transactions\> \<path-to-libfile.so\>
3. Save breakpoints with `save breakpoints \<filename\> and load breakpoints with source \<filename\>

## Building & Debugging the P-BwTree 
Here's what I did  

1. Copy the directory RECIPE/P-BwTree into wrappers/P-BwTree
2. In tpccbench/build, run `cmake -DCMAKE_BUILD_TYPE=Debug -DTPCC_BUILD_PBWTREE=TRUE ..`
3. To make debugging faster, go to `tpccbench/wrappers/P-BwTree/P-BwTree/bwtree.h:129` and do this:     
```c++
// #define bwt_printf(fmt, ...)                              \
//   do {                                                    \
//     if(print_flag == false) break;                        \
//     fprintf(stderr, "%-24s(%8lX): " fmt, __FUNCTION__, std::hash<std::thread::id>()(std::this_thread::get_id()), ##__VA_ARGS__); \
//     fflush(stdout);                                       \
//   } while (0);
#define bwt_printf(fmt, ...)   \
  do {                         \
    dummy(fmt, ##__VA_ARGS__); \
  } while (0);

# else
```
4. Currently stuck on this:  
Out of the 5 transactions, it is doOrderStatus that segfaults. But when debugging, I get the segfault   
when trying to access the iterator: print it->first, it->second lead to sigsegv :)
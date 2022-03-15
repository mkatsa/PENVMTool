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


Type "make", then you can run ./tpcc. Get output like:

Loading 2 warehouses... 4504 ms
Running... 200000 transactions in 6630 ms = 30167.577878 txns/s


## Licensing

This was written during my PhD at MIT. However, I did go through MIT's open
source office to release it under a BSD license. See the LICENSE file.

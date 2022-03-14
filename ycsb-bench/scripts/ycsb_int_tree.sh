#!/bin/bash

cd ./P-CLHT
bash compile.sh lb
cd ..
mkdir ./build
cd ./build
rm -rf *
cmake ..
make -j
cd ..

export VMMALLOC_POOL_SIZE=$((64*1024*1024*1024))
export VMMALLOC_POOL_DIR="/mnt/pmem1"

for idx_type in bwtree masstree
do
    for workload in a b c e
    do
        for nthreads in 16
        do
            LD_PRELOAD="/usr/local/lib/libvmmalloc.so.1" ./build/ycsb ${idx_type} ${workload} randint uniform ${nthreads} &>> ./results/ycsb_int_tree.csv
            sleep 3
        done
        printf "\n\n" &>> ./results/ycsb_int_tree.csv
    done
done

cd ./build
rm -rf *
cmake -DCMAKE_CXX_FLAGS_RELEASE="-O0" ..
make -j
cd ..

for idx_type in fastfair
do
    for workload in a b c e
    do
        for nthreads in 16
        do
            LD_PRELOAD="/usr/local/lib/libvmmalloc.so.1" ./build/ycsb ${idx_type} ${workload} randint uniform ${nthreads} &>> ./results/ycsb_int_tree.csv
            sleep 3
        done
        printf "\n\n" &>> ./results/ycsb_int_tree.csv
    done
done

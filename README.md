# PENVMTool : Performance and Energy Evaluation Tool for Persistent-Memory Indexes
This tool was implemented for performance, energy and memory bandwidth evaluation of database indexes designed for persistent memory.
This repository includes implementations of index structures derived from [RECIPE](https://github.com/utsaslab/RECIPE) and the microbenchmarks for index structures evaluation based on Yahoo! Cloud Serving Benchmark(YCSB) and TPC-C benchmark. 

# Contents

# Building & Running indexes on DRAM and on Intel Optane DC Persistent Memory

## Dependencies

### Package Installation

```
$ sudo apt-get install build-essential cmake libboost-all-dev libpapi-dev default-jdk
```
```
$ sudo apt-get install libtbb-dev libjemalloc-dev
```

## Intel Optane DC configurations and libraries

Intel Optane DC must be configured in App Direct mode. Documentation about the setup and the usage of Intel Optane in App Direct mode can be found [here](https://www.intel.com/content/dam/support/us/en/documents/memory-and-storage/data-center-persistent-mem/Intel-Optane-DC-Persistent-Memory-Quick-Start-Guide.pdf). In our experiments we configured Intel Optane namespace in _fsdax_ mode, which allows the direct access programming model. 
The execution of PENVMTool on Intel Optane DC Persistent Memory is based on [libvmmalloc](https://pmem.io/pmdk/manpages/linux/v1.3/libvmmalloc.3/), which is a general purpose volatile memory allocation library that transparently converts all the dynamic memory allocations into Persistent Memory allocations, mapped by pmem.

### Mount Ext4-DAX File System

Next, we create and mount an ext4-dax file to the device _/dev/pmem1_, which corresponds to our persistent memory. If you have specified a different device path, please modify the following commands to indicate the correct device.

```
$ sudo mkfs.ext4 -b 4096 -E stride=512 -F /dev/pmem1
$ sudo mount -o dax /dev/pmem1 /mnt/pmem1
```

### [PMDK](https://github.com/pmem/pmdk) Installation

```
git clone https://github.com/pmem/pmdk.git
cd pmdk
make -j
cd ..
```

### [libvmmalloc](https://pmem.io/pmdk/manpages/linux/v1.3/libvmmalloc.3/) configuration

* LD_PRELOAD=/path/to/libvmmalloc.so.1
Specify the path to libvmmalloc.so.1

* export VMMALLOC_POOL_DIR=/path/to/mounted/filesystem
Specify the directory where the persistent memory pool file should be created, which is the mounted file system created in **Mount Ext4-DAX File System** section. The user must have read and write permissions to this directory.

* export VMMALLOC_POOL_SIZE=size
Specify the desired size(bytes) to be allocated in the memory pool file

```
Please modify the configurations on the below to fit your environment
export VMMALLOC_POOL_SIZE=$((64*1024*1024*1024))
export VMMALLOC_POOL_DIR="/mnt/pmem"
```


## YCSB workload and benchmark build

### Download YCSB source code
```
$ cd ./ycsb-bench/index-microbench
$ curl -O --location https://github.com/brianfrankcooper/YCSB/releases/download/0.11.0/ycsb-0.11.0.tar.gz
$ tar xfvz ycsb-0.11.0.tar.gz
$ mv ycsb-0.11.0 YCSB
$ cd ..
```

### Workload Configuration

Modify the workload specs. In our experiments we modified and utilized the workloads a,b,c and e beacuse all indexes support their operations.

```
$ vim ./index-microbench/workload_spec/<workloada or workloadb or workloadc or workloadd or workloade or workloadf>
```

Next, select the preffered workloads to be generated. Default configuration will generate all workloads (a, b, c, e). Change the code line "_**for WORKLOAD_TYPE in a b c e; do**_" depending on which workloads you want to generate:

```
$ vim ./index-microbench/generate_all_workloads.sh
```

Generate the workloads. This will generate both random integer keys and string ycsb keys with the specified key distribution.

```
$ cd ./index-microbench/
$ mkdir workloads
$ bash generate_all_workloads.sh
$ cd ..
```
### YCSB Application build

* For integer keys:
```
$ mkdir build
$ cd build
$ cmake ..
$ make -j
```

* For string keys:
```
$ mkdir build
$ cd build
$ cmake -DENABLE_STRING_TYPE=YES ..
$ make -j
```

YCSB is now successfully built.

## TPC-C benchmark build

* Add how to build tree libs
* Add how to build TPC-C

## Build and Integrate your Benchmark

## Energy Consumption Monitoring and Application-Level Performance

## Memory Bandwidth Monitoring

# References

# License

# Contact

# PENVMTool : Performance and Energy Evaluation Tool for Persistent-Memory Indexes
This tool was implemented for performance, energy and memory bandwidth evaluation of database indexes designed for persistent memory. We provide an automated tool for energy consumption and the memory bandwidth run-time monitoring of Intel Optane DC DIMMs.
This repository includes implementations of index structures derived from [RECIPE](https://github.com/utsaslab/RECIPE) and the microbenchmarks for index structures evaluation based on Yahoo! Cloud Serving Benchmark(YCSB) and TPC-C benchmark. 

# Clone this repository

```
git clone --recursive https://github.com/mkatsa/PENVMTool.git
```

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

## PCM tool Build

PENVMTool relies on [Processor Counter Monitor(PCM)](https://github.com/opcm/pcm) tool, which is an application programmind interface(API) and a set of tools based on the API to monitor performance and energy metrics for Intel® Core™, Xeon®, Atom™ and Xeon Phi™ processors. PCM works on Linux, Windows, Mac OS X, FreeBSD, DragonFlyBSD and ChromeOS operating systems.

Build PCM:

```
$ cd ./pcm
$ mkdir build
$ cd build
$ cmake ..
$ cmake --build .
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
export VMMALLOC_POOL_DIR="/mnt/pmem1"
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
$ cmake -DENABLE_STRING_TYPE=NO ..
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

## Energy Consumption Monitoring and Application-Level Performance

* Add how to energy consumption operates
* Add how to integrate your own benchmark

## Memory Bandwidth Monitoring Tool
This tool is implemented for run-time monitoring of memory bandwidth of the Intel Optane DC throughout the execution of the input application. 

First, adjust the **lines 29-31** of the **monitor_bandwidth.sh** script in order to fit your environment:

```
export VMMALLOC_POOL_SIZE=$((64*1024*1024*1024))
export VMMALLOC_POOL_DIR="/mnt/pmem1"
libvmmalloc_path="/usr/local/lib/libvmmalloc.so.1"
```
Next, execute the **monitor_bandwidth.sh** script with the sampling rate for PCM and the input application to execute. Then follow the instructions of the script. It requires **sudo** privileges. Sampling rate is suggested to be set to 0.01. 

```
$ sudo ./monitor_bandwidth.sh <sampling_rate> <application(ycsb|tpcc)>
```
The final output will be reported on **./results/bandwidth/** directory.

### Integrate your Benchmark for Memory Bandwidth Profiling

You can easily integrate your own benchmark for memory bandwidhth monitoring by simply replacing and uncommenting the following commented lines in the **monitor_bandwidth.sh** script. If your benchmark does not utilize the _libvmmalloc_ library, you can remove the LD_PRELOAD and just execute your benchmark that utilizes Intel Optane DC. 

```
#elif [ $benchmark = "my_own_benchmark" ]; then
	
#	cd /path/to/my/benchmark

#	${home_dir}/pcm/build/bin/pcm-memory $sampling -csv=${home_dir}/results/bandwidth/memory_bandwidth.csv &
#	LD_PRELOAD=${libvmmalloc_path} ./my_own_benchmark [arguments]

#	pkill -9 -f pcm-memory
#	wait

#	echo "My own benchmark terminated"
#	echo ""
```

# Known Issues

* There exist some workspaces, where TPC-C cannot be executed for multiple thread and throws the following error: **dlopen() fail: 'cannot allocate memory in static TLS block'**. This is a _jemalloc_ issue, which is utilized by _libvmmalloc_. In order to resolove this issue, you need to install a new version of _jemalloc_ in your system and configure it with the _--disable-initial-exec-tls_ enabled. You need to then LD_PRELOAD also the new version of _jemalloc_ in addition to _libvmmaloc_. In order to maintain the funcitonality of both YCSB and TPC-C, the best option is to have installed in your system two versions of _jemalloc_ and indicate each time to use either the one with _--disable-initial-exec-tls_ enabled or not. In this case you need to modify the corresponding lines, where the benchmarks are executed in monitor_bandwidth.sh script to LD_PRELOAD the corresponding _jemalloc_ library.

# References

# License

# Contact

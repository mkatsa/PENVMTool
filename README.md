# PENVMTool : Performance and Energy Evaluation Tool for Persistent-Memory Indexes
This tool was implemented for performance, energy and memory bandwidth evaluation of database indexes designed for persistent memory. We provide an automated tool for energy consumption and the memory bandwidth run-time monitoring of Intel Optane DC DIMMs.
This repository includes implementations of index structures derived from [RECIPE](https://github.com/utsaslab/RECIPE) and the microbenchmarks for index structures evaluation based on [Yahoo! Cloud Serving Benchmark(YCSB)](https://github.com/brianfrankcooper/YCSB) and TPC-C benchmark. 

# Clone this repository

```
$ git clone --recursive https://github.com/mkatsa/PENVMTool.git
```

# Contents

This repository contains the following:
* An energy consumption monitoring tool for applications deployed ons Intel Optane DC Persistent Memory
* A run-time memory bandwidth tool for applications deployed on Intel Optane DC Persistent Memory
* Integrated implementations of alternative B+-tree indexes in YCSB and TPC-C benchmarks. All the index implementations are derived from [RECIPE](https://github.com/utsaslab/RECIPE). More specifically, we utilize the following B+-tree implementations:
	* [Masstree](https://github.com/utsaslab/RECIPE/tree/master/P-Masstree) : Integrated both on YCSB and TPC-C benchmarks
	* [P-BWTree](https://github.com/utsaslab/RECIPE/tree/master/P-BwTree) : Integrated both on YCSB and TPC-C benchmarks
	* [Fast&Fair](https://github.com/utsaslab/RECIPE/tree/master/third-party/FAST_FAIR) : Integrated both on YCSB and TPC-C benchmarks
	* [FPTree](https://github.com/utsaslab/RECIPE/tree/master/third-party/CrashTest/fptree) : Integrated only on YCSB benchmark
	* [WBTree](https://github.com/utsaslab/RECIPE/tree/master/third-party/CrashTest/wbtree) : Integrated both on YCSB and TPC-C benchmarks


# Building & Running indexes on Intel Optane DC Persistent Memory

## Dependencies

### Package Installation

```
$ sudo apt-get install build-essential cmake libboost-all-dev libpapi-dev default-jdk
```

```
$ sudo apt-get install libtbb-dev libjemalloc-dev
```

The execution requires also Python3 and GCC.

## PCM Tool Build

PENVMTool relies on [Processor Counter Monitor(PCM)](https://github.com/opcm/pcm) tool, which is an application programmind interface(API) and a set of tools based on the API to monitor performance and energy metrics for Intel® Core™, Xeon®, Atom™ and Xeon Phi™ processors. PCM works on Linux, Windows, Mac OS X, FreeBSD, DragonFlyBSD and ChromeOS operating systems.

Build PCM:

```
$ cd ./pcm
$ mkdir build
$ cd build
$ cmake ..
$ cmake --build .
```

All the utilitis of PCM will be built in _build/bin_ directory. If you want to accelerate the building phase you can use the _--parallel_ flag:

```
cmake --build . --parallel
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

Thit tool is implemented for run-time monitoring of the energy consumed on the Intel Optane DC DIMMs throughout the execution of the input application. The tool automatically detects the NVM banks in your system.

First, find and adjust the following lines of the **monitor_energy.sh** script in order to fit your environment:

```
export VMMALLOC_POOL_SIZE=$((64*1024*1024*1024))
export VMMALLOC_POOL_DIR="/mnt/pmem1"
libvmmalloc_path="/usr/local/lib/libvmmalloc.so.1"
```

Next, execute the **monitor_energy.sh** script with the sampling rate for PCM and the input application to execute. Then follow the instructions of the script. It requires **sudo** privileges. Sampling rate is suggested to be set to 0.01. 

```
$ sudo ./monitor_energy.sh <sampling_rate> <application(ycsb|tpcc)>
```

The final output will be reported on **./results/energy/** directory.



## Memory Bandwidth Monitoring Tool
This tool is implemented for run-time monitoring of memory bandwidth of the Intel Optane DC throughout the execution of the input application. 

First, find and adjust the following lines of the **monitor_bandwidth.sh** script in order to fit your environment:

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

* There exist some workspaces, where the benchmarks cannot be executed for multiple threads and throw the following error: **dlopen() fail: 'cannot allocate memory in static TLS block'**. This is a _jemalloc_ issue, which is utilized by _libvmmalloc_. In order to resolove this issue, you need to install a new version of _jemalloc_ in your system and configure it with the _--disable-initial-exec-tls_ enabled. You can find more information about this [here](https://github.com/jemalloc/jemalloc/blob/dev/INSTALL.md). Then ,you need to then LD_PRELOAD also the new version of _jemalloc_ in addition to _libvmmaloc_. In order to maintain the functionality of both YCSB and TPC-C, the best option is to have installed in your system two versions of _jemalloc_ and indicate each time to use either the one with _--disable-initial-exec-tls_ enabled or not. In this case you need to modify the corresponding lines, where the benchmarks are executed in monitor_bandwidth.sh script to LD_PRELOAD the corresponding _jemalloc_ library.

# License

The licences for most the persistent indexes are [Apache2.0 License](https://www.apache.org/licenses/LICENSE-2.0), [MIT](https://opensource.org/licenses/MIT) and [ISC](https://opensource.org/licenses/ISC). The [RECIPE](https://github.com/utsaslab/RECIPE) also utilizes [Apache2.0 License](https://www.apache.org/licenses/LICENSE-2.0). This work was conducted in [Microprocessors and Digital Systems Laboratory(MicroLAB)](https://microlab.ntua.gr/) of Electrical and Computer Engineering School in the National and Technical University of Athens(NTUA). Scripts and code implemented by our group utilize [Apache2.0 License](https://www.apache.org/licenses/LICENSE-2.0). PENVMTool is publicly available. For more information please refer to the [LICENSE](https://github.com/mkatsa/PENVMTool/blob/main/LICENSE) file or out repository.


# Contact

For more information and/or questions on this work you can create an issue or contact us at mkatsaragakis@microlab.ntua.gr lpapadop@microlab.ntua.gr christosbaloukas@microlab.ntua.gr

#!/bin/bash

usage="$(basename "$0") <Sampling Rate> <Behchmark(ycsb|tpcc)>"

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

if [ "$#" -ne 2 ]; then
	echo $usage >&2
	exit 1
fi

while test $# -gt 0; do
	case "$1" in
		-h|--help)					#-h flag for help
			echo $usage >&2
			exit 1
			;;
		*)
			sampling=$1
			if [[ $sampling =~ ^[+-]?[0-9]+$ ]]; then
				echo "Sampling rate is set to ${sampling} sec"
			elif [[ $sampling =~ ^[+-]?[0-9]+\.?[0-9]*$ ]]; then
				echo "Sampling rate is set to ${sampling} sec"
			else
				echo "Sampling rate must be a number"
				echo $usage >&2
				exit 1
			fi

			benchmark=$2
			break
			;;
	esac
done

modprobe msr
home_dir=$(pwd)


lshw -class memory > memory_system.out

echo 'Searching for Intel Optane DIMMs'
declare -A banks_optane
counter=0
for line in $(lshw -class memory | grep -n 'Non-volatile' | cut -d : -f 1)
do
	bank_line=$((${line}-1))
	banks_optane+=([${counter}]=$(sed -n ${bank_line}p memory_system.out | cut -d : -f 2))
	counter=$(($counter+1))
done
echo 'Found Intel Optane DIMMs on banks ' ${banks_optane[@]} 



#====================================================================================================================================================

export VMMALLOC_POOL_SIZE=$((64*1024*1024*1024))
export VMMALLOC_POOL_DIR="/mnt/pmem1"
libvmmalloc_path="/usr/local/lib/libvmmalloc.so.1"


if [ -f "${home_dir}/results/bank_*.csv" ];
then
	rm -f ${home_dir}/results/bank*.csv
fi


mkdir -p ${home_dir}/results/
mkdir -p ${home_dir}/results/energy/
if [ -f "${home_dir}/results/bandwidth/memory_bandwidth.csv" ]; then
	rm -f ${home_dir}/results/bandwidth/memory_bandwidth.csv
fi


if [ $benchmark = "ycsb" ]; then

	cd ${home_dir}/ycsb-bench/
	read -p "Please enter the input workload for YCSB --> a(default), b ,c, e: " workload
	if [ "$workload" = "" ]; then
		workload="a"
	fi

	read -p "Please enter the target index for YCSB --> fastfair(default), wbtree, bwtree, fptree, masstree): " index
	if [ "$index" = "" ]; then
		index="fastfair"
	fi

	read -p "Please enter the number of threads: " threads
	if [ "$threads" = "" ]; then
		threads=1
	fi

	read -p "Please specify the type of keys --> randint(default), string: " type
	if [ "$type" = "" ]; then
		type="randint"
	fi

	echo "\n"
	echo "Executing YCSB Benchmark on Intel Optane DC. This may take a while..."
	echo "Index: ${index}"
	echo "Workload: ${workload}"
	echo "Threads: ${threads}"
	echo "Type: ${type}"


	for bank in ${banks_optane[@]}
	do
		echo $bank
		${home_dir}/pcm/build/bin/pcm-power $sampling -m 0 -csv=${home_dir}/results/energy/bank_${bank}.csv &
	done
	LD_PRELOAD=${libvmmalloc_path} ${home_dir}/ycsb-bench/build/ycsb ${index} ${workload} ${type} uniform ${threads}
	
	pkill -9 -f pcm-power
	wait

	echo "YCSB terminated"
	echo ""

elif [ $benchmark = "tpcc" ]; then


	cd ${home_dir}/tpccbench/build/src

	read -p "Please enter the number of warehouses(default=10): " warehouses
	if [ "$warehouses" = "" ]; then
		warehouses=10
	fi

	read -p "Please enter the number of transactions(default=100000): " transactions
	if [ "$transactions" = "" ]; then
		transactions=10
	fi

	read -p "Please enter the target index --> fftree(default), pbwtree, wbtree, pmasstree: " index
	if [ "$index" = "" ]; then
		index="fftree"
	fi
	lib_index="lib${index}_wrapper.so"

	echo "\n"
	echo "Executing TPC-C Benchmark on Intel Optane DC. This may take a while..."
	echo "Warehouses: ${warehouses}"
	echo "Transactions: ${transactions}"
	echo "Index: ${index}"


	for bank in ${banks_optane[@]}
	do
		echo $bank
		${home_dir}/pcm/build/bin/pcm-power $sampling -m 0 -csv=${home_dir}/results/energy/bank${bank}.csv &
	done
	
	LD_PRELOAD=${libvmmalloc_path} ./tpcc ${warehouses} ${transactions} ../${lib_index}
	
	#LD_PRELOAD="/usr/lib/x86_64-linux-gnu/libjemalloc.so.2 /usr/local/lib/libvmmalloc.so.1" ./tpcc ${warehouses} ${transactions} ../${lib_index}

	pkill -9 -f pcm-power
	wait

	echo "TPC-C terminated"
	echo ""

#elif [ $benchmark = "my_own_benchmark" ]; then
	
#	cd /path/to/my/benchmark

#	for bank in ${banks_optane[@]}
#	do
#		echo $bank
#		${home_dir}/pcm/build/bin/pcm-power $sampling -m 0 -csv=${home_dir}/results/energy/bank${bank}.csv &
#	done
#	#LD_PRELOAD=${libvmmalloc_path} ./my_own_benchmark [arguments]

#	pkill -9 -f pcm-memory
#	wait

#	echo "My own benchmark terminated"
#	echo ""


else
	echo "Unknown Benchmark ${benchmark}"
	echo $usage >&2
	exit 1
fi


unset VMMALLOC_POOL_SIZE
unset VMMALLOC_POOL_DIR

#python3 ${home_dir}/process_energy_dram_ycsb.py ${benchmark} ${home_dir}
python3 ${home_dir}/process_energy_optane_ycsb.py ${benchmark} ${home_dir}



cd ${home_dir}
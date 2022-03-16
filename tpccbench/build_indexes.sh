#!/bin/sh
#
# A dumb script for running all the unit tests.
# TODO: Add unit test support to stupidbuild.

home_dir=$(pwd)
cd ${home_dir}

mkdir -p ${home_dir}/indexes

for index in P-BwTree fastfair P-Masstree wbtree
do
	cd ${home_dir}/wrappers/${index}

	if [ -d "${home_dir}/wrappers/${index}/build" ];
	then
		rm -rf ${home_dir}/wrappers/${index}/build
	fi
	mkdir -p ${home_dir}/wrappers/${index}/build

	cd ${home_dir}/wrappers/${index}/build

	cmake ..
	make -j

	cp ${home_dir}/wrappers/${index}/build/*.so ${home_dir}/indexes/
done

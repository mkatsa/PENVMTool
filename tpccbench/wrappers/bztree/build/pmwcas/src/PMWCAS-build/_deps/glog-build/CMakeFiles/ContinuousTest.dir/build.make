# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS-build

# Utility rule file for ContinuousTest.

# Include the progress variables for this target.
include _deps/glog-build/CMakeFiles/ContinuousTest.dir/progress.make

_deps/glog-build/CMakeFiles/ContinuousTest:
	cd /home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS-build/_deps/glog-build && /usr/bin/ctest -D ContinuousTest

ContinuousTest: _deps/glog-build/CMakeFiles/ContinuousTest
ContinuousTest: _deps/glog-build/CMakeFiles/ContinuousTest.dir/build.make

.PHONY : ContinuousTest

# Rule to build all files generated by this target.
_deps/glog-build/CMakeFiles/ContinuousTest.dir/build: ContinuousTest

.PHONY : _deps/glog-build/CMakeFiles/ContinuousTest.dir/build

_deps/glog-build/CMakeFiles/ContinuousTest.dir/clean:
	cd /home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS-build/_deps/glog-build && $(CMAKE_COMMAND) -P CMakeFiles/ContinuousTest.dir/cmake_clean.cmake
.PHONY : _deps/glog-build/CMakeFiles/ContinuousTest.dir/clean

_deps/glog-build/CMakeFiles/ContinuousTest.dir/depend:
	cd /home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS-build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS /home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS-build/_deps/glog-src /home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS-build /home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS-build/_deps/glog-build /home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS-build/_deps/glog-build/CMakeFiles/ContinuousTest.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : _deps/glog-build/CMakeFiles/ContinuousTest.dir/depend

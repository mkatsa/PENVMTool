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

# Include any dependencies generated for this target.
include _deps/glog-build/CMakeFiles/signalhandler_unittest.dir/depend.make

# Include the progress variables for this target.
include _deps/glog-build/CMakeFiles/signalhandler_unittest.dir/progress.make

# Include the compile flags for this target's objects.
include _deps/glog-build/CMakeFiles/signalhandler_unittest.dir/flags.make

_deps/glog-build/CMakeFiles/signalhandler_unittest.dir/src/signalhandler_unittest.cc.o: _deps/glog-build/CMakeFiles/signalhandler_unittest.dir/flags.make
_deps/glog-build/CMakeFiles/signalhandler_unittest.dir/src/signalhandler_unittest.cc.o: _deps/glog-src/src/signalhandler_unittest.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object _deps/glog-build/CMakeFiles/signalhandler_unittest.dir/src/signalhandler_unittest.cc.o"
	cd /home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS-build/_deps/glog-build && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/signalhandler_unittest.dir/src/signalhandler_unittest.cc.o -c /home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS-build/_deps/glog-src/src/signalhandler_unittest.cc

_deps/glog-build/CMakeFiles/signalhandler_unittest.dir/src/signalhandler_unittest.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/signalhandler_unittest.dir/src/signalhandler_unittest.cc.i"
	cd /home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS-build/_deps/glog-build && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS-build/_deps/glog-src/src/signalhandler_unittest.cc > CMakeFiles/signalhandler_unittest.dir/src/signalhandler_unittest.cc.i

_deps/glog-build/CMakeFiles/signalhandler_unittest.dir/src/signalhandler_unittest.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/signalhandler_unittest.dir/src/signalhandler_unittest.cc.s"
	cd /home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS-build/_deps/glog-build && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS-build/_deps/glog-src/src/signalhandler_unittest.cc -o CMakeFiles/signalhandler_unittest.dir/src/signalhandler_unittest.cc.s

# Object files for target signalhandler_unittest
signalhandler_unittest_OBJECTS = \
"CMakeFiles/signalhandler_unittest.dir/src/signalhandler_unittest.cc.o"

# External object files for target signalhandler_unittest
signalhandler_unittest_EXTERNAL_OBJECTS =

_deps/glog-build/signalhandler_unittest: _deps/glog-build/CMakeFiles/signalhandler_unittest.dir/src/signalhandler_unittest.cc.o
_deps/glog-build/signalhandler_unittest: _deps/glog-build/CMakeFiles/signalhandler_unittest.dir/build.make
_deps/glog-build/signalhandler_unittest: _deps/glog-build/libglogd.a
_deps/glog-build/signalhandler_unittest: _deps/glog-build/CMakeFiles/signalhandler_unittest.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable signalhandler_unittest"
	cd /home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS-build/_deps/glog-build && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/signalhandler_unittest.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
_deps/glog-build/CMakeFiles/signalhandler_unittest.dir/build: _deps/glog-build/signalhandler_unittest

.PHONY : _deps/glog-build/CMakeFiles/signalhandler_unittest.dir/build

_deps/glog-build/CMakeFiles/signalhandler_unittest.dir/clean:
	cd /home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS-build/_deps/glog-build && $(CMAKE_COMMAND) -P CMakeFiles/signalhandler_unittest.dir/cmake_clean.cmake
.PHONY : _deps/glog-build/CMakeFiles/signalhandler_unittest.dir/clean

_deps/glog-build/CMakeFiles/signalhandler_unittest.dir/depend:
	cd /home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS-build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS /home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS-build/_deps/glog-src /home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS-build /home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS-build/_deps/glog-build /home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS-build/_deps/glog-build/CMakeFiles/signalhandler_unittest.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : _deps/glog-build/CMakeFiles/signalhandler_unittest.dir/depend


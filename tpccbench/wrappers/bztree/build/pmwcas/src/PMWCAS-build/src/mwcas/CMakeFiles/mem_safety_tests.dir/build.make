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
include src/mwcas/CMakeFiles/mem_safety_tests.dir/depend.make

# Include the progress variables for this target.
include src/mwcas/CMakeFiles/mem_safety_tests.dir/progress.make

# Include the compile flags for this target's objects.
include src/mwcas/CMakeFiles/mem_safety_tests.dir/flags.make

src/mwcas/CMakeFiles/mem_safety_tests.dir/mem_safety_tests.cc.o: src/mwcas/CMakeFiles/mem_safety_tests.dir/flags.make
src/mwcas/CMakeFiles/mem_safety_tests.dir/mem_safety_tests.cc.o: /home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/src/mwcas/mem_safety_tests.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/mwcas/CMakeFiles/mem_safety_tests.dir/mem_safety_tests.cc.o"
	cd /home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS-build/src/mwcas && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mem_safety_tests.dir/mem_safety_tests.cc.o -c /home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/src/mwcas/mem_safety_tests.cc

src/mwcas/CMakeFiles/mem_safety_tests.dir/mem_safety_tests.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mem_safety_tests.dir/mem_safety_tests.cc.i"
	cd /home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS-build/src/mwcas && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/src/mwcas/mem_safety_tests.cc > CMakeFiles/mem_safety_tests.dir/mem_safety_tests.cc.i

src/mwcas/CMakeFiles/mem_safety_tests.dir/mem_safety_tests.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mem_safety_tests.dir/mem_safety_tests.cc.s"
	cd /home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS-build/src/mwcas && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/src/mwcas/mem_safety_tests.cc -o CMakeFiles/mem_safety_tests.dir/mem_safety_tests.cc.s

src/mwcas/CMakeFiles/mem_safety_tests.dir/__/environment/environment_linux.cc.o: src/mwcas/CMakeFiles/mem_safety_tests.dir/flags.make
src/mwcas/CMakeFiles/mem_safety_tests.dir/__/environment/environment_linux.cc.o: /home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/src/environment/environment_linux.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/mwcas/CMakeFiles/mem_safety_tests.dir/__/environment/environment_linux.cc.o"
	cd /home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS-build/src/mwcas && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mem_safety_tests.dir/__/environment/environment_linux.cc.o -c /home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/src/environment/environment_linux.cc

src/mwcas/CMakeFiles/mem_safety_tests.dir/__/environment/environment_linux.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mem_safety_tests.dir/__/environment/environment_linux.cc.i"
	cd /home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS-build/src/mwcas && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/src/environment/environment_linux.cc > CMakeFiles/mem_safety_tests.dir/__/environment/environment_linux.cc.i

src/mwcas/CMakeFiles/mem_safety_tests.dir/__/environment/environment_linux.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mem_safety_tests.dir/__/environment/environment_linux.cc.s"
	cd /home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS-build/src/mwcas && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/src/environment/environment_linux.cc -o CMakeFiles/mem_safety_tests.dir/__/environment/environment_linux.cc.s

# Object files for target mem_safety_tests
mem_safety_tests_OBJECTS = \
"CMakeFiles/mem_safety_tests.dir/mem_safety_tests.cc.o" \
"CMakeFiles/mem_safety_tests.dir/__/environment/environment_linux.cc.o"

# External object files for target mem_safety_tests
mem_safety_tests_EXTERNAL_OBJECTS =

src/mwcas/mem_safety_tests: src/mwcas/CMakeFiles/mem_safety_tests.dir/mem_safety_tests.cc.o
src/mwcas/mem_safety_tests: src/mwcas/CMakeFiles/mem_safety_tests.dir/__/environment/environment_linux.cc.o
src/mwcas/mem_safety_tests: src/mwcas/CMakeFiles/mem_safety_tests.dir/build.make
src/mwcas/mem_safety_tests: _deps/glog-build/libglogd.a
src/mwcas/mem_safety_tests: libpmwcas.so
src/mwcas/mem_safety_tests: _deps/glog-build/libglogd.a
src/mwcas/mem_safety_tests: _deps/googletest-build/googlemock/gtest/libgtest_maind.a
src/mwcas/mem_safety_tests: /usr/local/lib/libpmemobj.so
src/mwcas/mem_safety_tests: _deps/googletest-build/googlemock/gtest/libgtestd.a
src/mwcas/mem_safety_tests: src/mwcas/CMakeFiles/mem_safety_tests.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable mem_safety_tests"
	cd /home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS-build/src/mwcas && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mem_safety_tests.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/mwcas/CMakeFiles/mem_safety_tests.dir/build: src/mwcas/mem_safety_tests

.PHONY : src/mwcas/CMakeFiles/mem_safety_tests.dir/build

src/mwcas/CMakeFiles/mem_safety_tests.dir/clean:
	cd /home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS-build/src/mwcas && $(CMAKE_COMMAND) -P CMakeFiles/mem_safety_tests.dir/cmake_clean.cmake
.PHONY : src/mwcas/CMakeFiles/mem_safety_tests.dir/clean

src/mwcas/CMakeFiles/mem_safety_tests.dir/depend:
	cd /home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS-build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS /home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/src/mwcas /home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS-build /home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS-build/src/mwcas /home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS-build/src/mwcas/CMakeFiles/mem_safety_tests.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/mwcas/CMakeFiles/mem_safety_tests.dir/depend


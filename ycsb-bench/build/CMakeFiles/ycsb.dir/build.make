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
CMAKE_SOURCE_DIR = /home/mkatsa/databases/PENVMTool/ycsb-bench

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/mkatsa/databases/PENVMTool/ycsb-bench/build

# Include any dependencies generated for this target.
include CMakeFiles/ycsb.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/ycsb.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/ycsb.dir/flags.make

CMakeFiles/ycsb.dir/ycsb.cpp.o: CMakeFiles/ycsb.dir/flags.make
CMakeFiles/ycsb.dir/ycsb.cpp.o: ../ycsb.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mkatsa/databases/PENVMTool/ycsb-bench/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/ycsb.dir/ycsb.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ycsb.dir/ycsb.cpp.o -c /home/mkatsa/databases/PENVMTool/ycsb-bench/ycsb.cpp

CMakeFiles/ycsb.dir/ycsb.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ycsb.dir/ycsb.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/mkatsa/databases/PENVMTool/ycsb-bench/ycsb.cpp > CMakeFiles/ycsb.dir/ycsb.cpp.i

CMakeFiles/ycsb.dir/ycsb.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ycsb.dir/ycsb.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/mkatsa/databases/PENVMTool/ycsb-bench/ycsb.cpp -o CMakeFiles/ycsb.dir/ycsb.cpp.s

# Object files for target ycsb
ycsb_OBJECTS = \
"CMakeFiles/ycsb.dir/ycsb.cpp.o"

# External object files for target ycsb
ycsb_EXTERNAL_OBJECTS =

ycsb: CMakeFiles/ycsb.dir/ycsb.cpp.o
ycsb: CMakeFiles/ycsb.dir/build.make
ycsb: libIndexes.a
ycsb: /usr/lib/x86_64-linux-gnu/libtbb.so
ycsb: /usr/lib/x86_64-linux-gnu/libjemalloc.so
ycsb: CMakeFiles/ycsb.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/mkatsa/databases/PENVMTool/ycsb-bench/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ycsb"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ycsb.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/ycsb.dir/build: ycsb

.PHONY : CMakeFiles/ycsb.dir/build

CMakeFiles/ycsb.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/ycsb.dir/cmake_clean.cmake
.PHONY : CMakeFiles/ycsb.dir/clean

CMakeFiles/ycsb.dir/depend:
	cd /home/mkatsa/databases/PENVMTool/ycsb-bench/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mkatsa/databases/PENVMTool/ycsb-bench /home/mkatsa/databases/PENVMTool/ycsb-bench /home/mkatsa/databases/PENVMTool/ycsb-bench/build /home/mkatsa/databases/PENVMTool/ycsb-bench/build /home/mkatsa/databases/PENVMTool/ycsb-bench/build/CMakeFiles/ycsb.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/ycsb.dir/depend


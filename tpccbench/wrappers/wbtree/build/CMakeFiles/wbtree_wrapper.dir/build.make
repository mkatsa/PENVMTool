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
CMAKE_SOURCE_DIR = /home/kskov/tpccbench/wrappers/wbtree

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/kskov/tpccbench/wrappers/wbtree/build

# Include any dependencies generated for this target.
include CMakeFiles/wbtree_wrapper.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/wbtree_wrapper.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/wbtree_wrapper.dir/flags.make

CMakeFiles/wbtree_wrapper.dir/wbtree_wrapper.cpp.o: CMakeFiles/wbtree_wrapper.dir/flags.make
CMakeFiles/wbtree_wrapper.dir/wbtree_wrapper.cpp.o: ../wbtree_wrapper.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kskov/tpccbench/wrappers/wbtree/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/wbtree_wrapper.dir/wbtree_wrapper.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/wbtree_wrapper.dir/wbtree_wrapper.cpp.o -c /home/kskov/tpccbench/wrappers/wbtree/wbtree_wrapper.cpp

CMakeFiles/wbtree_wrapper.dir/wbtree_wrapper.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/wbtree_wrapper.dir/wbtree_wrapper.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kskov/tpccbench/wrappers/wbtree/wbtree_wrapper.cpp > CMakeFiles/wbtree_wrapper.dir/wbtree_wrapper.cpp.i

CMakeFiles/wbtree_wrapper.dir/wbtree_wrapper.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/wbtree_wrapper.dir/wbtree_wrapper.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kskov/tpccbench/wrappers/wbtree/wbtree_wrapper.cpp -o CMakeFiles/wbtree_wrapper.dir/wbtree_wrapper.cpp.s

CMakeFiles/wbtree_wrapper.dir/wbtree/wbtree.cpp.o: CMakeFiles/wbtree_wrapper.dir/flags.make
CMakeFiles/wbtree_wrapper.dir/wbtree/wbtree.cpp.o: ../wbtree/wbtree.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kskov/tpccbench/wrappers/wbtree/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/wbtree_wrapper.dir/wbtree/wbtree.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/wbtree_wrapper.dir/wbtree/wbtree.cpp.o -c /home/kskov/tpccbench/wrappers/wbtree/wbtree/wbtree.cpp

CMakeFiles/wbtree_wrapper.dir/wbtree/wbtree.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/wbtree_wrapper.dir/wbtree/wbtree.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kskov/tpccbench/wrappers/wbtree/wbtree/wbtree.cpp > CMakeFiles/wbtree_wrapper.dir/wbtree/wbtree.cpp.i

CMakeFiles/wbtree_wrapper.dir/wbtree/wbtree.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/wbtree_wrapper.dir/wbtree/wbtree.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kskov/tpccbench/wrappers/wbtree/wbtree/wbtree.cpp -o CMakeFiles/wbtree_wrapper.dir/wbtree/wbtree.cpp.s

# Object files for target wbtree_wrapper
wbtree_wrapper_OBJECTS = \
"CMakeFiles/wbtree_wrapper.dir/wbtree_wrapper.cpp.o" \
"CMakeFiles/wbtree_wrapper.dir/wbtree/wbtree.cpp.o"

# External object files for target wbtree_wrapper
wbtree_wrapper_EXTERNAL_OBJECTS =

libwbtree_wrapper.so: CMakeFiles/wbtree_wrapper.dir/wbtree_wrapper.cpp.o
libwbtree_wrapper.so: CMakeFiles/wbtree_wrapper.dir/wbtree/wbtree.cpp.o
libwbtree_wrapper.so: CMakeFiles/wbtree_wrapper.dir/build.make
libwbtree_wrapper.so: CMakeFiles/wbtree_wrapper.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/kskov/tpccbench/wrappers/wbtree/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX shared library libwbtree_wrapper.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/wbtree_wrapper.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/wbtree_wrapper.dir/build: libwbtree_wrapper.so

.PHONY : CMakeFiles/wbtree_wrapper.dir/build

CMakeFiles/wbtree_wrapper.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/wbtree_wrapper.dir/cmake_clean.cmake
.PHONY : CMakeFiles/wbtree_wrapper.dir/clean

CMakeFiles/wbtree_wrapper.dir/depend:
	cd /home/kskov/tpccbench/wrappers/wbtree/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/kskov/tpccbench/wrappers/wbtree /home/kskov/tpccbench/wrappers/wbtree /home/kskov/tpccbench/wrappers/wbtree/build /home/kskov/tpccbench/wrappers/wbtree/build /home/kskov/tpccbench/wrappers/wbtree/build/CMakeFiles/wbtree_wrapper.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/wbtree_wrapper.dir/depend

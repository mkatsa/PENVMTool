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
CMAKE_SOURCE_DIR = /home/kskov/tpccbench

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/kskov/tpccbench

# Include any dependencies generated for this target.
include src/CMakeFiles/tpccbench.dir/depend.make

# Include the progress variables for this target.
include src/CMakeFiles/tpccbench.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/tpccbench.dir/flags.make

src/CMakeFiles/tpccbench.dir/tpcctables.cc.o: src/CMakeFiles/tpccbench.dir/flags.make
src/CMakeFiles/tpccbench.dir/tpcctables.cc.o: src/tpcctables.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kskov/tpccbench/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/CMakeFiles/tpccbench.dir/tpcctables.cc.o"
	cd /home/kskov/tpccbench/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/tpccbench.dir/tpcctables.cc.o -c /home/kskov/tpccbench/src/tpcctables.cc

src/CMakeFiles/tpccbench.dir/tpcctables.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tpccbench.dir/tpcctables.cc.i"
	cd /home/kskov/tpccbench/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kskov/tpccbench/src/tpcctables.cc > CMakeFiles/tpccbench.dir/tpcctables.cc.i

src/CMakeFiles/tpccbench.dir/tpcctables.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tpccbench.dir/tpcctables.cc.s"
	cd /home/kskov/tpccbench/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kskov/tpccbench/src/tpcctables.cc -o CMakeFiles/tpccbench.dir/tpcctables.cc.s

src/CMakeFiles/tpccbench.dir/clock.cc.o: src/CMakeFiles/tpccbench.dir/flags.make
src/CMakeFiles/tpccbench.dir/clock.cc.o: src/clock.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kskov/tpccbench/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/CMakeFiles/tpccbench.dir/clock.cc.o"
	cd /home/kskov/tpccbench/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/tpccbench.dir/clock.cc.o -c /home/kskov/tpccbench/src/clock.cc

src/CMakeFiles/tpccbench.dir/clock.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tpccbench.dir/clock.cc.i"
	cd /home/kskov/tpccbench/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kskov/tpccbench/src/clock.cc > CMakeFiles/tpccbench.dir/clock.cc.i

src/CMakeFiles/tpccbench.dir/clock.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tpccbench.dir/clock.cc.s"
	cd /home/kskov/tpccbench/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kskov/tpccbench/src/clock.cc -o CMakeFiles/tpccbench.dir/clock.cc.s

src/CMakeFiles/tpccbench.dir/randomgenerator.cc.o: src/CMakeFiles/tpccbench.dir/flags.make
src/CMakeFiles/tpccbench.dir/randomgenerator.cc.o: src/randomgenerator.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kskov/tpccbench/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object src/CMakeFiles/tpccbench.dir/randomgenerator.cc.o"
	cd /home/kskov/tpccbench/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/tpccbench.dir/randomgenerator.cc.o -c /home/kskov/tpccbench/src/randomgenerator.cc

src/CMakeFiles/tpccbench.dir/randomgenerator.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tpccbench.dir/randomgenerator.cc.i"
	cd /home/kskov/tpccbench/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kskov/tpccbench/src/randomgenerator.cc > CMakeFiles/tpccbench.dir/randomgenerator.cc.i

src/CMakeFiles/tpccbench.dir/randomgenerator.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tpccbench.dir/randomgenerator.cc.s"
	cd /home/kskov/tpccbench/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kskov/tpccbench/src/randomgenerator.cc -o CMakeFiles/tpccbench.dir/randomgenerator.cc.s

src/CMakeFiles/tpccbench.dir/tpccclient.cc.o: src/CMakeFiles/tpccbench.dir/flags.make
src/CMakeFiles/tpccbench.dir/tpccclient.cc.o: src/tpccclient.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kskov/tpccbench/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object src/CMakeFiles/tpccbench.dir/tpccclient.cc.o"
	cd /home/kskov/tpccbench/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/tpccbench.dir/tpccclient.cc.o -c /home/kskov/tpccbench/src/tpccclient.cc

src/CMakeFiles/tpccbench.dir/tpccclient.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tpccbench.dir/tpccclient.cc.i"
	cd /home/kskov/tpccbench/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kskov/tpccbench/src/tpccclient.cc > CMakeFiles/tpccbench.dir/tpccclient.cc.i

src/CMakeFiles/tpccbench.dir/tpccclient.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tpccbench.dir/tpccclient.cc.s"
	cd /home/kskov/tpccbench/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kskov/tpccbench/src/tpccclient.cc -o CMakeFiles/tpccbench.dir/tpccclient.cc.s

src/CMakeFiles/tpccbench.dir/tpccgenerator.cc.o: src/CMakeFiles/tpccbench.dir/flags.make
src/CMakeFiles/tpccbench.dir/tpccgenerator.cc.o: src/tpccgenerator.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kskov/tpccbench/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object src/CMakeFiles/tpccbench.dir/tpccgenerator.cc.o"
	cd /home/kskov/tpccbench/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/tpccbench.dir/tpccgenerator.cc.o -c /home/kskov/tpccbench/src/tpccgenerator.cc

src/CMakeFiles/tpccbench.dir/tpccgenerator.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tpccbench.dir/tpccgenerator.cc.i"
	cd /home/kskov/tpccbench/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kskov/tpccbench/src/tpccgenerator.cc > CMakeFiles/tpccbench.dir/tpccgenerator.cc.i

src/CMakeFiles/tpccbench.dir/tpccgenerator.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tpccbench.dir/tpccgenerator.cc.s"
	cd /home/kskov/tpccbench/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kskov/tpccbench/src/tpccgenerator.cc -o CMakeFiles/tpccbench.dir/tpccgenerator.cc.s

src/CMakeFiles/tpccbench.dir/tpccdb.cc.o: src/CMakeFiles/tpccbench.dir/flags.make
src/CMakeFiles/tpccbench.dir/tpccdb.cc.o: src/tpccdb.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kskov/tpccbench/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object src/CMakeFiles/tpccbench.dir/tpccdb.cc.o"
	cd /home/kskov/tpccbench/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/tpccbench.dir/tpccdb.cc.o -c /home/kskov/tpccbench/src/tpccdb.cc

src/CMakeFiles/tpccbench.dir/tpccdb.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tpccbench.dir/tpccdb.cc.i"
	cd /home/kskov/tpccbench/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kskov/tpccbench/src/tpccdb.cc > CMakeFiles/tpccbench.dir/tpccdb.cc.i

src/CMakeFiles/tpccbench.dir/tpccdb.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tpccbench.dir/tpccdb.cc.s"
	cd /home/kskov/tpccbench/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kskov/tpccbench/src/tpccdb.cc -o CMakeFiles/tpccbench.dir/tpccdb.cc.s

src/CMakeFiles/tpccbench.dir/library_loader.cpp.o: src/CMakeFiles/tpccbench.dir/flags.make
src/CMakeFiles/tpccbench.dir/library_loader.cpp.o: src/library_loader.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kskov/tpccbench/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object src/CMakeFiles/tpccbench.dir/library_loader.cpp.o"
	cd /home/kskov/tpccbench/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/tpccbench.dir/library_loader.cpp.o -c /home/kskov/tpccbench/src/library_loader.cpp

src/CMakeFiles/tpccbench.dir/library_loader.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tpccbench.dir/library_loader.cpp.i"
	cd /home/kskov/tpccbench/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kskov/tpccbench/src/library_loader.cpp > CMakeFiles/tpccbench.dir/library_loader.cpp.i

src/CMakeFiles/tpccbench.dir/library_loader.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tpccbench.dir/library_loader.cpp.s"
	cd /home/kskov/tpccbench/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kskov/tpccbench/src/library_loader.cpp -o CMakeFiles/tpccbench.dir/library_loader.cpp.s

# Object files for target tpccbench
tpccbench_OBJECTS = \
"CMakeFiles/tpccbench.dir/tpcctables.cc.o" \
"CMakeFiles/tpccbench.dir/clock.cc.o" \
"CMakeFiles/tpccbench.dir/randomgenerator.cc.o" \
"CMakeFiles/tpccbench.dir/tpccclient.cc.o" \
"CMakeFiles/tpccbench.dir/tpccgenerator.cc.o" \
"CMakeFiles/tpccbench.dir/tpccdb.cc.o" \
"CMakeFiles/tpccbench.dir/library_loader.cpp.o"

# External object files for target tpccbench
tpccbench_EXTERNAL_OBJECTS =

src/libtpccbench.a: src/CMakeFiles/tpccbench.dir/tpcctables.cc.o
src/libtpccbench.a: src/CMakeFiles/tpccbench.dir/clock.cc.o
src/libtpccbench.a: src/CMakeFiles/tpccbench.dir/randomgenerator.cc.o
src/libtpccbench.a: src/CMakeFiles/tpccbench.dir/tpccclient.cc.o
src/libtpccbench.a: src/CMakeFiles/tpccbench.dir/tpccgenerator.cc.o
src/libtpccbench.a: src/CMakeFiles/tpccbench.dir/tpccdb.cc.o
src/libtpccbench.a: src/CMakeFiles/tpccbench.dir/library_loader.cpp.o
src/libtpccbench.a: src/CMakeFiles/tpccbench.dir/build.make
src/libtpccbench.a: src/CMakeFiles/tpccbench.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/kskov/tpccbench/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Linking CXX static library libtpccbench.a"
	cd /home/kskov/tpccbench/src && $(CMAKE_COMMAND) -P CMakeFiles/tpccbench.dir/cmake_clean_target.cmake
	cd /home/kskov/tpccbench/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/tpccbench.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/tpccbench.dir/build: src/libtpccbench.a

.PHONY : src/CMakeFiles/tpccbench.dir/build

src/CMakeFiles/tpccbench.dir/clean:
	cd /home/kskov/tpccbench/src && $(CMAKE_COMMAND) -P CMakeFiles/tpccbench.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/tpccbench.dir/clean

src/CMakeFiles/tpccbench.dir/depend:
	cd /home/kskov/tpccbench && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/kskov/tpccbench /home/kskov/tpccbench/src /home/kskov/tpccbench /home/kskov/tpccbench/src /home/kskov/tpccbench/src/CMakeFiles/tpccbench.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/tpccbench.dir/depend


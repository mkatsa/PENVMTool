cmake_minimum_required(VERSION 3.16.3)
project(pbwtree)

set(CMAKE_BUILD_TYPE Debug)

# include(CheckCXXCompilerFlag)
# CHECK_CXX_COMPILER_FLAG("-march=native" COMPILER_SUPPORTS_MARCH_NATIVE)
# if(COMPILER_SUPPORTS_MARCH_NATIVE)
#     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -march=native -latomic")
# endif()
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++17 -march=native -mrtm -mcx16 -mavx -mavx2 -mbmi2 -mlzcnt -Wno-deprecated-declarations -Wall -Wextra \
-fno-builtin-malloc -fno-builtin-calloc -fno-builtin-realloc -fno-builtin-free -faligned-new=64")
# execute_process(COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/build_recipe_bwtree.sh)
# now we should have a directory RECIPE in this project

############## This is horrible. I have copied the entire contents of RECIPE/P-BwTree 
############## in the root of this project in directory P-BwTree. Until I can figure out 
############## how to involve git in this
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/P-BwTree/src)
# include_directories(P-BwTree/src ../../include)
add_library(pbwtree_wrapper SHARED ${CMAKE_CURRENT_SOURCE_DIR}/pbwtree_wrapper.cpp ${CMAKE_CURRENT_SOURCE_DIR}/P-BwTree/src/bwtree.cpp) # RECIPE/P-BwTree/src/bwtree.cpp)
# add_dependencies(pbwtree_wrapper RECIPE)

# add_custom_target(recipe_target ALL COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/build.sh)
# include_directories(RECIPE/P-BwTree/src)
# target_link_libraries(pbwtree_wrapper recipe_target)

# what do i need?
# pbwtree/src/bwtree.cpp which needs the rest

find_library(JemallocLib jemalloc)
find_library(TbbLib tbb)
find_package (Threads)
find_library(GCCLIBATOMIC_LIBRARY NAMES atomic atomic.so.1 libatomic.so.1)

IF (GCCLIBATOMIC_LIBRARY)
    SET(GCCLIBATOMIC_FOUND TRUE)
    MESSAGE(STATUS "Found GCC's libatomic.so: lib=${GCCLIBATOMIC_LIBRARY}")
ELSE ()
    SET(GCCLIBATOMIC_FOUND FALSE)
    MESSAGE(STATUS "GCC's libatomic.so not found. This library is essential in AArch64 (if you are on x86, this doesn't matter)")
    MESSAGE(STATUS "Try: 'sudo yum install libatomic' (or sudo apt-get install libatomic1)")
ENDIF ()

# add_definitions(-DBWTREE_NODEBUG)
set(INDEX_FILES ${CMAKE_CURRENT_SOURCE_DIR}/P-BwTree/src/bwtree.cpp)

add_library(Indexes ${INDEX_FILES})
# for libatomic (was getting undefined symbol )
target_link_libraries(Indexes ${TbbLib} ${JemallocLib} ${CMAKE_THREAD_LIBS_INIT} ${GCCLIBATOMIC_LIBRARY})
target_link_libraries(pbwtree_wrapper Indexes)
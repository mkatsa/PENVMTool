cmake_minimum_required(VERSION 3.16.3)
project(TpccBench)

set(CMAKE_BUILD_TYPE Debug)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

include(CheckCXXCompilerFlag)
CHECK_CXX_COMPILER_FLAG("-march=native" COMPILER_SUPPORTS_MARCH_NATIVE)
if(COMPILER_SUPPORTS_MARCH_NATIVE)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -march=native")
endif()
# include(CheckCXXCompilerFlag)
# CHECK_CXX_COMPILER_FLAG("-march=native" COMPILER_SUPPORTS_MARCH_NATIVE)
# if(COMPILER_SUPPORTS_MARCH_NATIVE)
#     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -march=native")
# endif()

set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR})

include_directories("${PROJECT_SOURCE_DIR}/include")
# add subdirectory command expects to find a new CMakeLists.txt in the subdir
add_subdirectory(src)
# add_subdirectory(wrappers)
# Example libraries
# add_library(dummy_wrapper SHARED wrappers/dummy/dummy.cpp)
add_library(btree_wrapper SHARED wrappers/evanj_btree/evanj_btree.cpp)
# add_library(stlmap_wrapper SHARED wrappers/stlmap/stlmap_wrapper.cpp)

if(TPCC_BUILD_PBWTREE)
  add_subdirectory(wrappers/P-BwTree)
endif(TPCC_BUILD_PBWTREE)
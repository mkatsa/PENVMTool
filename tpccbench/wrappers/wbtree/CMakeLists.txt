project(wbtree_wrapper)

cmake_minimum_required(VERSION 3.16)

# standard must be 17 for shared_mutex to work
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++17")

set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -g")

set(CMAKE_BUILD_TYPE "Debug")

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/wbtree)

add_library(wbtree_wrapper SHARED wbtree_wrapper.cpp wbtree/wbtree.cpp)
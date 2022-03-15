project(fftree_wrapper)

cmake_minimum_required(VERSION 3.16)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

set(LINK_FLAGS "-lpthread -pthread -lrt")
link_libraries(${LINK_FLAGS})

set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -g")

set(CMAKE_BUILD_TYPE "Debug")

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/fast_fair)
# add_executable(example example.cpp btree.h)
add_library(fftree_wrapper SHARED fftree_wrapper.cpp)
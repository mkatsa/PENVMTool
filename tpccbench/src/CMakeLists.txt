set(tpcc_SRC
    tpcctables.cc
    clock.cc
    randomgenerator.cc
    tpccclient.cc
    tpccgenerator.cc
    tpccdb.cc
    library_loader.cpp
)

set(CMAKE_BUILD_TYPE Debug)

add_library(tpccbench ${tpcc_SRC})

add_executable(tpccbench-bin tpcc.cc)
# link with the DL libs for dlopen etc to work
target_link_libraries(tpccbench-bin tpccbench ${CMAKE_DL_LIBS})
set_target_properties(tpccbench-bin PROPERTIES OUTPUT_NAME tpcc)

# use this to compile with warnings
target_compile_options(tpccbench PRIVATE -Wall -Wextra -Wpedantic)
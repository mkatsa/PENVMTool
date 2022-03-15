# CMake generated Testfile for 
# Source directory: /home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/src/common
# Build directory: /home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS-build/src/common
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(EpochManagerTest.Initialize "/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS-build/src/common/epoch_test" "--gtest_filter=EpochManagerTest.Initialize")
set_tests_properties(EpochManagerTest.Initialize PROPERTIES  _BACKTRACE_TRIPLES "/usr/share/cmake-3.16/Modules/GoogleTest.cmake;353;add_test;/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/CMakeLists.txt;138;gtest_add_tests;/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/src/common/CMakeLists.txt;24;ADD_PMWCAS_TEST;/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/src/common/CMakeLists.txt;0;")
add_test(EpochManagerTest.Uninitialize "/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS-build/src/common/epoch_test" "--gtest_filter=EpochManagerTest.Uninitialize")
set_tests_properties(EpochManagerTest.Uninitialize PROPERTIES  _BACKTRACE_TRIPLES "/usr/share/cmake-3.16/Modules/GoogleTest.cmake;353;add_test;/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/CMakeLists.txt;138;gtest_add_tests;/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/src/common/CMakeLists.txt;24;ADD_PMWCAS_TEST;/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/src/common/CMakeLists.txt;0;")
add_test(EpochManagerTest.Protect "/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS-build/src/common/epoch_test" "--gtest_filter=EpochManagerTest.Protect")
set_tests_properties(EpochManagerTest.Protect PROPERTIES  _BACKTRACE_TRIPLES "/usr/share/cmake-3.16/Modules/GoogleTest.cmake;353;add_test;/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/CMakeLists.txt;138;gtest_add_tests;/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/src/common/CMakeLists.txt;24;ADD_PMWCAS_TEST;/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/src/common/CMakeLists.txt;0;")
add_test(EpochManagerTest.Unprotect "/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS-build/src/common/epoch_test" "--gtest_filter=EpochManagerTest.Unprotect")
set_tests_properties(EpochManagerTest.Unprotect PROPERTIES  _BACKTRACE_TRIPLES "/usr/share/cmake-3.16/Modules/GoogleTest.cmake;353;add_test;/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/CMakeLists.txt;138;gtest_add_tests;/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/src/common/CMakeLists.txt;24;ADD_PMWCAS_TEST;/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/src/common/CMakeLists.txt;0;")
add_test(EpochManagerTest.BumpCurrentEpoch "/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS-build/src/common/epoch_test" "--gtest_filter=EpochManagerTest.BumpCurrentEpoch")
set_tests_properties(EpochManagerTest.BumpCurrentEpoch PROPERTIES  _BACKTRACE_TRIPLES "/usr/share/cmake-3.16/Modules/GoogleTest.cmake;353;add_test;/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/CMakeLists.txt;138;gtest_add_tests;/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/src/common/CMakeLists.txt;24;ADD_PMWCAS_TEST;/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/src/common/CMakeLists.txt;0;")
add_test(EpochManagerTest.ComputeNewSafeToReclaimEpoch "/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS-build/src/common/epoch_test" "--gtest_filter=EpochManagerTest.ComputeNewSafeToReclaimEpoch")
set_tests_properties(EpochManagerTest.ComputeNewSafeToReclaimEpoch PROPERTIES  _BACKTRACE_TRIPLES "/usr/share/cmake-3.16/Modules/GoogleTest.cmake;353;add_test;/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/CMakeLists.txt;138;gtest_add_tests;/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/src/common/CMakeLists.txt;24;ADD_PMWCAS_TEST;/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/src/common/CMakeLists.txt;0;")
add_test(EpochManagerTest.Smoke "/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS-build/src/common/epoch_test" "--gtest_also_run_disabled_tests" "--gtest_filter=EpochManagerTest.DISABLED_Smoke")
set_tests_properties(EpochManagerTest.Smoke PROPERTIES  DISABLED "TRUE" _BACKTRACE_TRIPLES "/usr/share/cmake-3.16/Modules/GoogleTest.cmake;341;add_test;/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/CMakeLists.txt;138;gtest_add_tests;/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/src/common/CMakeLists.txt;24;ADD_PMWCAS_TEST;/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/src/common/CMakeLists.txt;0;")
add_test(MinEpochTableTest.Initialize "/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS-build/src/common/epoch_test" "--gtest_filter=MinEpochTableTest.Initialize")
set_tests_properties(MinEpochTableTest.Initialize PROPERTIES  _BACKTRACE_TRIPLES "/usr/share/cmake-3.16/Modules/GoogleTest.cmake;353;add_test;/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/CMakeLists.txt;138;gtest_add_tests;/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/src/common/CMakeLists.txt;24;ADD_PMWCAS_TEST;/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/src/common/CMakeLists.txt;0;")
add_test(MinEpochTableTest.Initialize_SizeNotAPowerOfTwo "/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS-build/src/common/epoch_test" "--gtest_filter=MinEpochTableTest.Initialize_SizeNotAPowerOfTwo")
set_tests_properties(MinEpochTableTest.Initialize_SizeNotAPowerOfTwo PROPERTIES  _BACKTRACE_TRIPLES "/usr/share/cmake-3.16/Modules/GoogleTest.cmake;353;add_test;/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/CMakeLists.txt;138;gtest_add_tests;/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/src/common/CMakeLists.txt;24;ADD_PMWCAS_TEST;/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/src/common/CMakeLists.txt;0;")
add_test(MinEpochTableTest.Uninitialize "/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS-build/src/common/epoch_test" "--gtest_filter=MinEpochTableTest.Uninitialize")
set_tests_properties(MinEpochTableTest.Uninitialize PROPERTIES  _BACKTRACE_TRIPLES "/usr/share/cmake-3.16/Modules/GoogleTest.cmake;353;add_test;/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/CMakeLists.txt;138;gtest_add_tests;/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/src/common/CMakeLists.txt;24;ADD_PMWCAS_TEST;/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/src/common/CMakeLists.txt;0;")
add_test(MinEpochTableTest.Protect "/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS-build/src/common/epoch_test" "--gtest_filter=MinEpochTableTest.Protect")
set_tests_properties(MinEpochTableTest.Protect PROPERTIES  _BACKTRACE_TRIPLES "/usr/share/cmake-3.16/Modules/GoogleTest.cmake;353;add_test;/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/CMakeLists.txt;138;gtest_add_tests;/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/src/common/CMakeLists.txt;24;ADD_PMWCAS_TEST;/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/src/common/CMakeLists.txt;0;")
add_test(MinEpochTableTest.Unprotect "/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS-build/src/common/epoch_test" "--gtest_filter=MinEpochTableTest.Unprotect")
set_tests_properties(MinEpochTableTest.Unprotect PROPERTIES  _BACKTRACE_TRIPLES "/usr/share/cmake-3.16/Modules/GoogleTest.cmake;353;add_test;/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/CMakeLists.txt;138;gtest_add_tests;/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/src/common/CMakeLists.txt;24;ADD_PMWCAS_TEST;/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/src/common/CMakeLists.txt;0;")
add_test(MinEpochTableTest.ComputeNewSafeToReclaimEpoch "/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS-build/src/common/epoch_test" "--gtest_filter=MinEpochTableTest.ComputeNewSafeToReclaimEpoch")
set_tests_properties(MinEpochTableTest.ComputeNewSafeToReclaimEpoch PROPERTIES  _BACKTRACE_TRIPLES "/usr/share/cmake-3.16/Modules/GoogleTest.cmake;353;add_test;/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/CMakeLists.txt;138;gtest_add_tests;/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/src/common/CMakeLists.txt;24;ADD_PMWCAS_TEST;/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/src/common/CMakeLists.txt;0;")
add_test(MinEpochTableTest.getEntryForThread "/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS-build/src/common/epoch_test" "--gtest_filter=MinEpochTableTest.getEntryForThread")
set_tests_properties(MinEpochTableTest.getEntryForThread PROPERTIES  _BACKTRACE_TRIPLES "/usr/share/cmake-3.16/Modules/GoogleTest.cmake;353;add_test;/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/CMakeLists.txt;138;gtest_add_tests;/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/src/common/CMakeLists.txt;24;ADD_PMWCAS_TEST;/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/src/common/CMakeLists.txt;0;")
add_test(MinEpochTableTest.getEntryForThread_OneSlotFree "/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS-build/src/common/epoch_test" "--gtest_filter=MinEpochTableTest.getEntryForThread_OneSlotFree")
set_tests_properties(MinEpochTableTest.getEntryForThread_OneSlotFree PROPERTIES  _BACKTRACE_TRIPLES "/usr/share/cmake-3.16/Modules/GoogleTest.cmake;353;add_test;/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/CMakeLists.txt;138;gtest_add_tests;/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/src/common/CMakeLists.txt;24;ADD_PMWCAS_TEST;/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/src/common/CMakeLists.txt;0;")
add_test(MinEpochTableTest.reserveEntryForThread "/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS-build/src/common/epoch_test" "--gtest_filter=MinEpochTableTest.reserveEntryForThread")
set_tests_properties(MinEpochTableTest.reserveEntryForThread PROPERTIES  _BACKTRACE_TRIPLES "/usr/share/cmake-3.16/Modules/GoogleTest.cmake;353;add_test;/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/CMakeLists.txt;138;gtest_add_tests;/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/src/common/CMakeLists.txt;24;ADD_PMWCAS_TEST;/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/src/common/CMakeLists.txt;0;")
add_test(MinEpochTableTest.reserveEntry "/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS-build/src/common/epoch_test" "--gtest_filter=MinEpochTableTest.reserveEntry")
set_tests_properties(MinEpochTableTest.reserveEntry PROPERTIES  _BACKTRACE_TRIPLES "/usr/share/cmake-3.16/Modules/GoogleTest.cmake;353;add_test;/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/CMakeLists.txt;138;gtest_add_tests;/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/src/common/CMakeLists.txt;24;ADD_PMWCAS_TEST;/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/src/common/CMakeLists.txt;0;")
add_test(GarbageListTest.Uninitialize "/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS-build/src/common/garbage_list_test" "--gtest_filter=GarbageListTest.Uninitialize")
set_tests_properties(GarbageListTest.Uninitialize PROPERTIES  _BACKTRACE_TRIPLES "/usr/share/cmake-3.16/Modules/GoogleTest.cmake;353;add_test;/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/CMakeLists.txt;138;gtest_add_tests;/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/src/common/CMakeLists.txt;25;ADD_PMWCAS_TEST;/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/src/common/CMakeLists.txt;0;")
add_test(GarbageListTest.Smoke "/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS-build/src/common/garbage_list_test" "--gtest_filter=GarbageListTest.Smoke")
set_tests_properties(GarbageListTest.Smoke PROPERTIES  _BACKTRACE_TRIPLES "/usr/share/cmake-3.16/Modules/GoogleTest.cmake;353;add_test;/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/CMakeLists.txt;138;gtest_add_tests;/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/src/common/CMakeLists.txt;25;ADD_PMWCAS_TEST;/home/kskov/tpccbench/wrappers/bztree/build/pmwcas/src/PMWCAS/src/common/CMakeLists.txt;0;")

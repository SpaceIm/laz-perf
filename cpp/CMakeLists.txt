if (NOT CMAKE_PROJECT_NAME STREQUAL "LAZPERF")
    message(FATAL_ERROR "Run cmake from the top level of the source tree")
endif()

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

#------------------------------------------------------------------------------
# test harness settings
#------------------------------------------------------------------------------

# Name of test suite runner
set(LAZPERF_UNIT_TEST lazperf_tests)

set(LAZPERF_SHARED_LIB lazperf)
set(LAZPERF_STATIC_LIB lazperf_s)

add_subdirectory(lazperf)
add_subdirectory(examples)
add_subdirectory(benchmarks)
add_subdirectory(tools)
if (EMSCRIPTEN)
    add_subdirectory(emscripten)
endif()

if (WITH_TESTS)
    enable_testing()
    add_subdirectory(test)
endif()

if (NOT EMSCRIPTEN)
    include(${PROJECT_SOURCE_DIR}/cmake/install.cmake)
endif()

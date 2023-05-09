cmake_minimum_required(VERSION 3.20)

project(my_ext LANGUAGES CXX)

# Perform a release build by default
if (NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
    set(CMAKE_BUILD_TYPE Release CACHE STRING "Choose the type of build." FORCE)
    set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "Debug" "Release" "MinSizeRel" "RelWithDebInfo")
endif ()

# Create CMake targets for Python components needed by nanobind
find_package(Python 3 COMPONENTS Interpreter Development.Module REQUIRED)

# Determine the nanobind CMake include path and register it
execute_process(
        COMMAND "${Python_EXECUTABLE}" -m nanobind --cmake_dir
        OUTPUT_STRIP_TRAILING_WHITESPACE OUTPUT_VARIABLE NB_DIR)

message(STATUS "NanoBind Cmake directory: " ${NB_DIR})
list(APPEND CMAKE_PREFIX_PATH "${NB_DIR}")

# Import nanobind through CMake's find_package mechanism
find_package(nanobind CONFIG REQUIRED)

# We are now ready to compile the actual extension module
nanobind_add_module(
        _my_ext_impl
        ../src/my_ext.cpp
)

# Install directive for scikit-build
install(TARGETS _my_ext_impl LIBRARY DESTINATION ..)
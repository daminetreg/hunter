cmake_minimum_required (VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-cpplinq)

add_definitions(-std=c++11)

hunter_add_package(cpplinq)
find_package(cpplinq 20150908 REQUIRED)
include_directories(${cpplinq_INCLUDE_DIRS})

add_executable(main main.cpp)

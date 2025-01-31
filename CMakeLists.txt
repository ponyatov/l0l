cmake_minimum_required(VERSION 3.22)
get_filename_component(CMAKE_PROJECT_NAME ${CMAKE_SOURCE_DIR} NAME_WE)
project(${CMAKE_PROJECT_NAME} LANGUAGES C CXX ASM)
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_SOURCE_DIR}/cmake)
include(version)

set(CWD ${CMAKE_SOURCE_DIR})
set(BIN ${CWD}/bin)
set(CMAKE_INSTALL_PREFIX ${BIN})
set(DOC ${CWD}/doc)
set(LIB ${CWD}/lib)
set(INC ${CWD}/inc)
set(SRC ${CWD}/src)
set(TMP ${CWD}/tmp)

file(GLOB_RECURSE LD
    "${CWD}/hw/${HW}/*.ld"
)
file(GLOB_RECURSE A
    "${CWD}/src/*.s*"
    "${CWD}/hw/${HW}/*.s*"
)
file(GLOB_RECURSE C
    "${CWD}/src/*.c*"
    "${CWD}/hw/${HW}/src/*.c*"
    "${CWD}/cpu/${CPU}/src/*.c*"
    "${CWD}/arch/${ARCH}/src/*.c*"
    "${CWD}/os/${OS}/src/*.c*"
)
file(GLOB_RECURSE H
    "${CWD}/inc/*.h*"
    "${CWD}/hw/${HW}/inc/*.h*"
    "${CWD}/cpu/${CPU}/inc/*.h*"
    "${CWD}/arch/${ARCH}/inc/*.h*"
    "${CWD}/os/${OS}/inc/*.h*"
)


set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_SOURCE_DIR}/cmake)

find_package(RAGEL REQUIRED)
find_package(FLEX  REQUIRED)
find_package(BISON REQUIRED)

file(GLOB RL
    RELATIVE ${CMAKE_SOURCE_DIR}
    src/*.ragel lib/src/*.ragel lib/*/src/*.ragel
)

RAGEL_TARGET(cli
    lib/cli/src/cli.ragel
    ${CMAKE_SOURCE_DIR}/tmp/cli.ragel.cpp
    COMPILE_FLAGS -G2
)

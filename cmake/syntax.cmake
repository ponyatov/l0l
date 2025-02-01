find_package(RAGEL REQUIRED)
find_package(FLEX  REQUIRED)
find_package(BISON REQUIRED)

file(GLOB_RECURSE RL
    RELATIVE ${CMAKE_SOURCE_DIR}
    /src/*.ragel
)

RAGEL_TARGET(cli
    lib/cli/src/cli.ragel
    ${CMAKE_SOURCE_DIR}/tmp/cli.ragel.cpp
    COMPILE_FLAGS -G2
)

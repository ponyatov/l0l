find_package(RAGEL REQUIRED)
# find_package(FLEX  REQUIRED)
# find_package(BISON REQUIRED)

set(RAGEL_EXECUTABLE_opts -G2)

file(GLOB RL
    RELATIVE ${CMAKE_SOURCE_DIR}
    src/*.ragel lib/src/*.ragel lib/*/src/*.ragel
)

# list(TRANSFORM RL REPLACE "[.]ragel$" ".cpp.ragel")
# list(TRANSFORM RL REPLACE ".+\/" "tmp/")

# RAGEL_TARGET(cli
#     lib/cli/src/cli.ragel
#     ${CMAKE_SOURCE_DIR}/tmp/cli.ragel.cpp
#     COMPILE_FLAGS -G2
# )

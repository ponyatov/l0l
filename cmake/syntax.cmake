find_package(RAGEL REQUIRED)
# find_package(FLEX  REQUIRED)
# find_package(BISON REQUIRED)

set(RAGEL_EXECUTABLE_opts -G2)

file(GLOB RL
    RELATIVE ${CMAKE_SOURCE_DIR}
    src/*.ragel lib/src/*.ragel lib/*/src/*.ragel
)

foreach(RAGEL_FILE ${RL})
#     string(REGEX REPLACE
#         ".+\/(.+)\.ragel$"
#         "tmp/\\1.ragel.cpp"
#         PARSER_FILE ${RAGEL_FILE})
    message("------- " ${RAGEL_FILE} "\t\t" ${PARSER_FILE})
#     list(APPEND CP ${PARSER_FILE})
#     add_custom_command(OUTPUT ${PARSER_FILE}
#         COMMAND           ${RAGEL_EXECUTABLE}
#         ARGS              ${RAGEL_EXECUTABLE_opts} -o ${PARSER_FILE} ${RAGEL_FILE}
#         DEPENDS           ${RAGEL_FILE}
#         WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
#     )
endforeach()

# # list(TRANSFORM RL REPLACE "[.]ragel$" ".cpp.ragel")
# # list(TRANSFORM RL REPLACE ".+\/" "tmp/")

# # RAGEL_TARGET(cli
# #     lib/cli/src/cli.ragel
# #     ${CMAKE_SOURCE_DIR}/tmp/cli.ragel.cpp
# #     COMPILE_FLAGS -G2
# # )

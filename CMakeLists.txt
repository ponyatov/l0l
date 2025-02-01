cmake_minimum_required(VERSION 3.22)
get_filename_component(CMAKE_PROJECT_NAME ${CMAKE_SOURCE_DIR} NAME_WE)
project(${CMAKE_PROJECT_NAME} LANGUAGES C CXX ASM)
# set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_SOURCE_DIR}/cmake)
include(version)

set(CWD ${CMAKE_SOURCE_DIR})
set(BIN ${CWD}/bin)
set(CMAKE_INSTALL_PREFIX ${BIN})
set(DOC ${CWD}/doc)
set(LIB ${CWD}/lib)
set(INC ${CWD}/inc)
set(SRC ${CWD}/src)
set(TMP ${CWD}/tmp)

# include(syntax)

message("--       dir: " ${CWD})
message("-- toolchain: " ${CMAKE_CXX_COMPILER} " @ " ${CMAKE_TOOLCHAIN_FILE})
message("--    target: " "hw:" ${HW} " cpu:" ${CPU} " arch:" ${ARCH} " os:" ${OS})
message("--   startup: " "${S}")
message("--    binary: " ${BIN_OUTPUT_NAME})
message("--   parsers: " "${RL}")
message("--  includes: " "${H}")

add_executable(${CMAKE_PROJECT_NAME}
    ${C} ${H} ${S} ${LD}
    ${RAGEL_cli_OUTPUTS}
    ${FLEX_lex_OUTPUTS} ${BISON_yacc_OUTPUTS}
)

target_link_libraries(${CMAKE_PROJECT_NAME})

# target install
set_target_properties(${CMAKE_PROJECT_NAME} PROPERTIES OUTPUT_NAME ${BIN_OUTPUT_NAME})
install(TARGETS ${CMAKE_PROJECT_NAME} DESTINATION ${CMAKE_INSTALL_PREFIX})

# cross compiler binaries
set(ELF ${CMAKE_INSTALL_PREFIX}/${BIN_OUTPUT_NAME}.elf)
set(DFU ${CMAKE_INSTALL_PREFIX}/${BIN_OUTPUT_NAME}.dfu)

add_custom_target(clean_all
    COMMAND rm -rf
        ${ELF} ${DFU}
        ${CMAKE_INSTALL_PREFIX}/${CMAKE_PROJECT_NAME}*
        ${CMAKE_BINARY_DIR}
        ${TMP}/${CMAKE_PROJECT_NAME}*
)

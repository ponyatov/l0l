include(arch/cortexM.cmake)

add_compile_options(
)

add_compile_definitions(
    HSI_VALUE=8000000
    LSI_VALUE=40000
    PREFETCH_ENABLE=1
    # INSTRUCTION_CACHE_ENABLE=1
    # DATA_CACHE_ENABLE=1
)

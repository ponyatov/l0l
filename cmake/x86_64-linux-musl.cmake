set(CMAKE_SYSTEM_NAME       Linux)
set(CMAKE_SYSTEM_PROCESSOR  x86_64)
set(TOOLCHAIN_PREFIX        ${ARCH}-${OS}-musl)
# set(TOOLCHAIN_PREFIX        musl)

add_compile_options(
    "-march=native"
)

include(any_toolchain)

# set(CMAKE_C_COMPILER   musl-gcc)
# set(CMAKE_LINKER       musl-gcc)

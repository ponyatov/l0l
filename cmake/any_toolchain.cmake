set(CMAKE_C_STANDARD   17)
set(CMAKE_CXX_STANDARD 17)

set(CMAKE_C_COMPILER_FORCED   TRUE)
set(CMAKE_CXX_COMPILER_FORCED TRUE)
set(CMAKE_C_COMPILER_ID       GNU)
set(CMAKE_CXX_COMPILER_ID     GNU)

set(CMAKE_C_COMPILER   ${TOOLCHAIN_PREFIX}-gcc)
set(CMAKE_ASM_COMPILER ${CMAKE_C_COMPILER})
set(CMAKE_CXX_COMPILER ${TOOLCHAIN_PREFIX}-g++)
set(CMAKE_LINKER       ${CMAKE_C_COMPILER})
set(CMAKE_OBJCOPY      ${TOOLCHAIN_PREFIX}-objcopy)
set(CMAKE_SIZE         ${TOOLCHAIN_PREFIX}-size)
set(CMAKE_RC_COMPILER  ${TOOLCHAIN_PREFIX}-windres)

include(  os/${OS}.cmake  )
include(arch/${ARCH}.cmake)
include( cpu/${CPU}.cmake )
include(  hw/${HW}.cmake  )

string(TOUPPER ${HW}   HW_  )
string(TOUPPER ${CPU}  CPU_ )
string(TOUPPER ${ARCH} ARCH_)
string(TOUPPER ${OS}   OS_  )

add_compile_options(
    "-D${HW_}" "-D${CPU_}" "-D${ARCH_}" "-D${OS_}"
    -Wall -Wextra -Wpedantic
    $<$<CONFIG:Debug>:-DDEBUG>
)

add_link_options(
    -Wl,--print-memory-usage
)

if(CMAKE_BUILD_TYPE MATCHES Debug)
    add_compile_options(-Og -g3)
endif()
if(CMAKE_BUILD_TYPE MATCHES Release)
    add_compile_options(-Os -g0)
endif()

file(GLOB LD
    RELATIVE ${CMAKE_SOURCE_DIR}
    hw/${HW}/*.ld
)

file(GLOB S
    RELATIVE ${CMAKE_SOURCE_DIR}
    hw/${HW}/*.s*
)

file(GLOB C
    RELATIVE ${CMAKE_SOURCE_DIR}
    src/*.c* tmp/*.c*
    # cross
      hw/src/*.c*   hw/${HW}/src/*.c*
     cpu/src/*.c*  cpu/${CPU}/src/*.c*
    arch/src/*.c* arch/${ARCH}/src/*.c*
      os/src/*.c*   os/${OS}/src/*.c*
    # libs
    lib/src/*.c* lib/*/src/*.c*
#     # CortexM/CubeMX
#     ${CWD}/hw/${HW}/Core/Src/*.c*
#     ${CWD}/hw/${HW}/Drivers/CMSIS/Device/ST/${SERIES}xx/Source/*.c*
#     ${CWD}/hw/${HW}/Drivers/${SERIES}xx_HAL_Driver/Src/*.c*
)

file(GLOB H
    RELATIVE ${CMAKE_SOURCE_DIR}
    inc/*.h* tmp/*.h*
    # cross
      hw/inc/*.h*   hw/${HW}/inc/*.h*
     cpu/inc/*.h*  cpu/${CPU}/inc/*.h*
    arch/inc/*.h* arch/${ARCH}/inc/*.h*
      os/inc/*.h*   os/${OS}/inc/*.h*
    # libs
    lib/inc/*.h* lib/*/inc/*.h*
    # # CortexM/CubeMX
    # ${CWD}/hw/${HW}/Core/Inc/*.h*
    # ${CWD}/hw/${HW}/Drivers/CMSIS/Include/*.h*
    # ${CWD}/hw/${HW}/Drivers/CMSIS/Device/ST/${SERIES}xx/Include/*.h*
    # ${CWD}/hw/${HW}/Drivers/${SERIES}xx_HAL_Driver/Inc/*.h*
)

file(GLOB INCDIRS
    RELATIVE ${CMAKE_SOURCE_DIR}
    inc tmp src
    # cross
      hw/inc   hw/${HW}/inc
     cpu/inc  cpu/${CPU}/inc
    arch/inc arch/${ARCH}/inc
      os/inc   os/${OS}/inc
    # libs
    lib/inc lib/*/inc
)
include_directories(
    ${INCDIRS}
    # # CortexM/CubeMX
    # ${CWD}/hw/${HW}/Core/Inc
    # ${CWD}/hw/${HW}/Drivers/CMSIS/Include
    # ${CWD}/hw/${HW}/Drivers/CMSIS/Device/ST/${SERIES}xx/Include
    # ${CWD}/hw/${HW}/Drivers/${SERIES}xx_HAL_Driver/Inc
)

include(syntax)

cmake_minimum_required(VERSION 3.20)

# Cross-compilation system setup (must be prior to project() call)
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR mips)
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

# Toolchain and DFP configuration
set(XC32_DIR "/Applications/microchip/xc32/v6.00" CACHE PATH "Path to XC32 compiler installation")
set(DFP_DIR "$ENV{HOME}/.mchp_packs/Microchip/PIC32MX_DFP/1.7.380" CACHE PATH "Path to PIC32MX Device Family Pack")
set(DEVICE "32MX170F256B" CACHE STRING "Target PIC32 device")

# Compiler and utility paths
set(CMAKE_C_COMPILER "${XC32_DIR}/bin/xc32-gcc")
set(CMAKE_CXX_COMPILER "${XC32_DIR}/bin/xc32-g++")
set(XC32_BIN2HEX "${XC32_DIR}/bin/xc32-bin2hex")
set(XC32_SIZE "${XC32_DIR}/bin/xc32-size")

project(Lab2Projecto C ASM)

# Source files
set(SRCS
    SimMain.c
)

# Target ELF binary
add_executable(${PROJECT_NAME}.elf ${SRCS})

# Target Include Directories
target_include_directories(${PROJECT_NAME}.elf PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${DFP_DIR}/include
)

# Compilation Options
target_compile_options(${PROJECT_NAME}.elf PRIVATE
    -mprocessor=${DEVICE}
    -mdfp=${DFP_DIR}
    -O1
    -g
    -ffunction-sections
    -fdata-sections
)

# Linker Options
target_link_options(${PROJECT_NAME}.elf PRIVATE
    -mprocessor=${DEVICE}
    -mdfp=${DFP_DIR}
    -Wl,--defsym=__MPLAB_BUILD=1
    -Wl,--gc-sections
    -Wl,-Map=${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.map
)

# Post-build: Convert ELF to Intel HEX and print size
add_custom_command(
    TARGET ${PROJECT_NAME}.elf POST_BUILD
    COMMAND ${XC32_BIN2HEX} $<TARGET_FILE:${PROJECT_NAME}.elf>
    COMMAND ${XC32_SIZE} $<TARGET_FILE:${PROJECT_NAME}.elf>
    BYPRODUCTS ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.hex
    COMMENT "Generating Intel HEX file and reporting size"
)

include("${CMAKE_CURRENT_LIST_DIR}/rule.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/file.cmake")

set(lab2part5_default_library_list )

# Handle files with suffix s, for group default-XC32
if(lab2part5_default_default_XC32_FILE_TYPE_assemble)
add_library(lab2part5_default_default_XC32_assemble OBJECT ${lab2part5_default_default_XC32_FILE_TYPE_assemble})
    lab2part5_default_default_XC32_assemble_rule(lab2part5_default_default_XC32_assemble)
    list(APPEND lab2part5_default_library_list "$<TARGET_OBJECTS:lab2part5_default_default_XC32_assemble>")

endif()

# Handle files with suffix S, for group default-XC32
if(lab2part5_default_default_XC32_FILE_TYPE_assembleWithPreprocess)
add_library(lab2part5_default_default_XC32_assembleWithPreprocess OBJECT ${lab2part5_default_default_XC32_FILE_TYPE_assembleWithPreprocess})
    lab2part5_default_default_XC32_assembleWithPreprocess_rule(lab2part5_default_default_XC32_assembleWithPreprocess)
    list(APPEND lab2part5_default_library_list "$<TARGET_OBJECTS:lab2part5_default_default_XC32_assembleWithPreprocess>")

endif()

# Handle files with suffix [cC], for group default-XC32
if(lab2part5_default_default_XC32_FILE_TYPE_compile)
add_library(lab2part5_default_default_XC32_compile OBJECT ${lab2part5_default_default_XC32_FILE_TYPE_compile})
    lab2part5_default_default_XC32_compile_rule(lab2part5_default_default_XC32_compile)
    list(APPEND lab2part5_default_library_list "$<TARGET_OBJECTS:lab2part5_default_default_XC32_compile>")

endif()

# Handle files with suffix cpp, for group default-XC32
if(lab2part5_default_default_XC32_FILE_TYPE_compile_cpp)
add_library(lab2part5_default_default_XC32_compile_cpp OBJECT ${lab2part5_default_default_XC32_FILE_TYPE_compile_cpp})
    lab2part5_default_default_XC32_compile_cpp_rule(lab2part5_default_default_XC32_compile_cpp)
    list(APPEND lab2part5_default_library_list "$<TARGET_OBJECTS:lab2part5_default_default_XC32_compile_cpp>")

endif()

# Handle files with suffix [cC], for group default-XC32
if(lab2part5_default_default_XC32_FILE_TYPE_dependentObject)
add_library(lab2part5_default_default_XC32_dependentObject OBJECT ${lab2part5_default_default_XC32_FILE_TYPE_dependentObject})
    lab2part5_default_default_XC32_dependentObject_rule(lab2part5_default_default_XC32_dependentObject)
    list(APPEND lab2part5_default_library_list "$<TARGET_OBJECTS:lab2part5_default_default_XC32_dependentObject>")

endif()


# Main target for this project
add_executable(lab2part5_default_image_tT2nz_YC ${lab2part5_default_library_list})

set_target_properties(lab2part5_default_image_tT2nz_YC PROPERTIES
    OUTPUT_NAME "default"
    SUFFIX ".elf"
    RUNTIME_OUTPUT_DIRECTORY "${lab2part5_default_output_dir}")
target_link_libraries(lab2part5_default_image_tT2nz_YC PRIVATE ${lab2part5_default_default_XC32_FILE_TYPE_link})
# Add the link options from the rule file.
lab2part5_default_link_rule( lab2part5_default_image_tT2nz_YC)

# Add bin2hex target for converting built file to a .hex file.
string(REGEX REPLACE [.]elf$ .hex lab2part5_default_image_name_hex ${lab2part5_default_image_name})
add_custom_target(lab2part5_default_Bin2Hex ALL
    COMMAND ${MP_BIN2HEX} \"${lab2part5_default_output_dir}/${lab2part5_default_image_name}\"
    BYPRODUCTS ${lab2part5_default_output_dir}/${lab2part5_default_image_name_hex}
    COMMENT "Convert built file to .hex")
add_dependencies(lab2part5_default_Bin2Hex lab2part5_default_image_tT2nz_YC)





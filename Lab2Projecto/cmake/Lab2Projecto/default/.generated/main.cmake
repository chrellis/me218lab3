include("${CMAKE_CURRENT_LIST_DIR}/rule.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/file.cmake")

set(Lab2Projecto_default_library_list )

# Handle files with suffix s, for group default-XC32
if(Lab2Projecto_default_default_XC32_FILE_TYPE_assemble)
add_library(Lab2Projecto_default_default_XC32_assemble OBJECT ${Lab2Projecto_default_default_XC32_FILE_TYPE_assemble})
    Lab2Projecto_default_default_XC32_assemble_rule(Lab2Projecto_default_default_XC32_assemble)
    list(APPEND Lab2Projecto_default_library_list "$<TARGET_OBJECTS:Lab2Projecto_default_default_XC32_assemble>")

endif()

# Handle files with suffix S, for group default-XC32
if(Lab2Projecto_default_default_XC32_FILE_TYPE_assembleWithPreprocess)
add_library(Lab2Projecto_default_default_XC32_assembleWithPreprocess OBJECT ${Lab2Projecto_default_default_XC32_FILE_TYPE_assembleWithPreprocess})
    Lab2Projecto_default_default_XC32_assembleWithPreprocess_rule(Lab2Projecto_default_default_XC32_assembleWithPreprocess)
    list(APPEND Lab2Projecto_default_library_list "$<TARGET_OBJECTS:Lab2Projecto_default_default_XC32_assembleWithPreprocess>")

endif()

# Handle files with suffix [cC], for group default-XC32
if(Lab2Projecto_default_default_XC32_FILE_TYPE_compile)
add_library(Lab2Projecto_default_default_XC32_compile OBJECT ${Lab2Projecto_default_default_XC32_FILE_TYPE_compile})
    Lab2Projecto_default_default_XC32_compile_rule(Lab2Projecto_default_default_XC32_compile)
    list(APPEND Lab2Projecto_default_library_list "$<TARGET_OBJECTS:Lab2Projecto_default_default_XC32_compile>")

endif()

# Handle files with suffix cpp, for group default-XC32
if(Lab2Projecto_default_default_XC32_FILE_TYPE_compile_cpp)
add_library(Lab2Projecto_default_default_XC32_compile_cpp OBJECT ${Lab2Projecto_default_default_XC32_FILE_TYPE_compile_cpp})
    Lab2Projecto_default_default_XC32_compile_cpp_rule(Lab2Projecto_default_default_XC32_compile_cpp)
    list(APPEND Lab2Projecto_default_library_list "$<TARGET_OBJECTS:Lab2Projecto_default_default_XC32_compile_cpp>")

endif()

# Handle files with suffix [cC], for group default-XC32
if(Lab2Projecto_default_default_XC32_FILE_TYPE_dependentObject)
add_library(Lab2Projecto_default_default_XC32_dependentObject OBJECT ${Lab2Projecto_default_default_XC32_FILE_TYPE_dependentObject})
    Lab2Projecto_default_default_XC32_dependentObject_rule(Lab2Projecto_default_default_XC32_dependentObject)
    list(APPEND Lab2Projecto_default_library_list "$<TARGET_OBJECTS:Lab2Projecto_default_default_XC32_dependentObject>")

endif()


# Main target for this project
add_executable(Lab2Projecto_default_image_fN1xohk7 ${Lab2Projecto_default_library_list})

set_target_properties(Lab2Projecto_default_image_fN1xohk7 PROPERTIES
    OUTPUT_NAME "default-production-production"
    SUFFIX ".elf"
    RUNTIME_OUTPUT_DIRECTORY "${Lab2Projecto_default_output_dir}")
target_link_libraries(Lab2Projecto_default_image_fN1xohk7 PRIVATE ${Lab2Projecto_default_default_XC32_FILE_TYPE_link})
# Add the link options from the rule file.
Lab2Projecto_default_link_rule( Lab2Projecto_default_image_fN1xohk7)

# Add bin2hex target for converting built file to a .hex file.
string(REGEX REPLACE [.]elf$ .hex Lab2Projecto_default_image_name_hex ${Lab2Projecto_default_image_name})
add_custom_target(Lab2Projecto_default_Bin2Hex ALL
    COMMAND ${MP_BIN2HEX} \"${Lab2Projecto_default_output_dir}/${Lab2Projecto_default_image_name}\"
    BYPRODUCTS ${Lab2Projecto_default_output_dir}/${Lab2Projecto_default_image_name_hex}
    COMMENT "Convert built file to .hex")
add_dependencies(Lab2Projecto_default_Bin2Hex Lab2Projecto_default_image_fN1xohk7)





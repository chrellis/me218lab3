# The following variables contains the files used by the different stages of the build process.
set(lab2part5_default_default_XC32_FILE_TYPE_assemble)
set_source_files_properties(${lab2part5_default_default_XC32_FILE_TYPE_assemble} PROPERTIES LANGUAGE ASM)

# For assembly files, add "." to the include path for each file so that .include with a relative path works
foreach(source_file ${lab2part5_default_default_XC32_FILE_TYPE_assemble})
        set_source_files_properties(${source_file} PROPERTIES INCLUDE_DIRECTORIES "$<PATH:NORMAL_PATH,$<PATH:REMOVE_FILENAME,${source_file}>>")
endforeach()

set(lab2part5_default_default_XC32_FILE_TYPE_assembleWithPreprocess)
set_source_files_properties(${lab2part5_default_default_XC32_FILE_TYPE_assembleWithPreprocess} PROPERTIES LANGUAGE ASM)

# For assembly files, add "." to the include path for each file so that .include with a relative path works
foreach(source_file ${lab2part5_default_default_XC32_FILE_TYPE_assembleWithPreprocess})
        set_source_files_properties(${source_file} PROPERTIES INCLUDE_DIRECTORIES "$<PATH:NORMAL_PATH,$<PATH:REMOVE_FILENAME,${source_file}>>")
endforeach()

set(lab2part5_default_default_XC32_FILE_TYPE_compile
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../Lab2DriverMain.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../PIC32_SPI_HAL_Starter.c")
set_source_files_properties(${lab2part5_default_default_XC32_FILE_TYPE_compile} PROPERTIES LANGUAGE C)
set(lab2part5_default_default_XC32_FILE_TYPE_compile_cpp)
set_source_files_properties(${lab2part5_default_default_XC32_FILE_TYPE_compile_cpp} PROPERTIES LANGUAGE CXX)
set(lab2part5_default_default_XC32_FILE_TYPE_link "${CMAKE_CURRENT_SOURCE_DIR}/../../../Lab2DriverLibrary.X.a")
set(lab2part5_default_image_name "default-production.elf")
set(lab2part5_default_image_base_name "default-production")

# The output directory of the final image.
set(lab2part5_default_output_dir "${CMAKE_CURRENT_SOURCE_DIR}/../../../out/lab2part5/production")

# The full path to the final image.
set(lab2part5_default_full_path_to_image ${lab2part5_default_output_dir}/${lab2part5_default_image_name})

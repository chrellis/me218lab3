set(DEPENDENT_MP_BIN2HEXlab2part5_default_tT2nz_YC "/Applications/microchip/xc32/v6.00/bin/xc32-bin2hex")
set(DEPENDENT_DEPENDENT_TARGET_ELFlab2part5_default_tT2nz_YC ${CMAKE_CURRENT_LIST_DIR}/../../../../out/lab2part5/default.elf)
set(DEPENDENT_TARGET_DIRlab2part5_default_tT2nz_YC ${CMAKE_CURRENT_LIST_DIR}/../../../../out/lab2part5)
set(DEPENDENT_BYPRODUCTSlab2part5_default_tT2nz_YC ${DEPENDENT_TARGET_DIRlab2part5_default_tT2nz_YC}/${sourceFileNamelab2part5_default_tT2nz_YC}.c)
add_custom_command(
    OUTPUT ${DEPENDENT_TARGET_DIRlab2part5_default_tT2nz_YC}/${sourceFileNamelab2part5_default_tT2nz_YC}.c
    COMMAND ${DEPENDENT_MP_BIN2HEXlab2part5_default_tT2nz_YC} --image ${DEPENDENT_DEPENDENT_TARGET_ELFlab2part5_default_tT2nz_YC} --image-generated-c ${sourceFileNamelab2part5_default_tT2nz_YC}.c --image-generated-h ${sourceFileNamelab2part5_default_tT2nz_YC}.h --image-copy-mode ${modelab2part5_default_tT2nz_YC} --image-offset ${addresslab2part5_default_tT2nz_YC} 
    WORKING_DIRECTORY ${DEPENDENT_TARGET_DIRlab2part5_default_tT2nz_YC}
    DEPENDS ${DEPENDENT_DEPENDENT_TARGET_ELFlab2part5_default_tT2nz_YC})
add_custom_target(
    dependent_produced_source_artifactlab2part5_default_tT2nz_YC 
    DEPENDS ${DEPENDENT_TARGET_DIRlab2part5_default_tT2nz_YC}/${sourceFileNamelab2part5_default_tT2nz_YC}.c
    )

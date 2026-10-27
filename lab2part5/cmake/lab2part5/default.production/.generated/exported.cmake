set(DEPENDENT_MP_BIN2HEXlab2part5_default_Rtv9E1ks "/Applications/microchip/xc32/v6.00/bin/xc32-bin2hex")
set(DEPENDENT_DEPENDENT_TARGET_ELFlab2part5_default_Rtv9E1ks ${CMAKE_CURRENT_LIST_DIR}/../../../../out/lab2part5/production/default-production.elf)
set(DEPENDENT_TARGET_DIRlab2part5_default_Rtv9E1ks ${CMAKE_CURRENT_LIST_DIR}/../../../../out/lab2part5/production)
set(DEPENDENT_BYPRODUCTSlab2part5_default_Rtv9E1ks ${DEPENDENT_TARGET_DIRlab2part5_default_Rtv9E1ks}/${sourceFileNamelab2part5_default_Rtv9E1ks}.c)
add_custom_command(
    OUTPUT ${DEPENDENT_TARGET_DIRlab2part5_default_Rtv9E1ks}/${sourceFileNamelab2part5_default_Rtv9E1ks}.c
    COMMAND ${DEPENDENT_MP_BIN2HEXlab2part5_default_Rtv9E1ks} --image ${DEPENDENT_DEPENDENT_TARGET_ELFlab2part5_default_Rtv9E1ks} --image-generated-c ${sourceFileNamelab2part5_default_Rtv9E1ks}.c --image-generated-h ${sourceFileNamelab2part5_default_Rtv9E1ks}.h --image-copy-mode ${modelab2part5_default_Rtv9E1ks} --image-offset ${addresslab2part5_default_Rtv9E1ks} 
    WORKING_DIRECTORY ${DEPENDENT_TARGET_DIRlab2part5_default_Rtv9E1ks}
    DEPENDS ${DEPENDENT_DEPENDENT_TARGET_ELFlab2part5_default_Rtv9E1ks})
add_custom_target(
    dependent_produced_source_artifactlab2part5_default_Rtv9E1ks 
    DEPENDS ${DEPENDENT_TARGET_DIRlab2part5_default_Rtv9E1ks}/${sourceFileNamelab2part5_default_Rtv9E1ks}.c
    )

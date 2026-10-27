set(DEPENDENT_MP_BIN2HEXLab2Projecto_default_fN1xohk7 "/Applications/microchip/xc32/v6.00/bin/xc32-bin2hex")
set(DEPENDENT_DEPENDENT_TARGET_ELFLab2Projecto_default_fN1xohk7 ${CMAKE_CURRENT_LIST_DIR}/../../../../out/Lab2Projecto/production/production/default-production-production.elf)
set(DEPENDENT_TARGET_DIRLab2Projecto_default_fN1xohk7 ${CMAKE_CURRENT_LIST_DIR}/../../../../out/Lab2Projecto/production/production)
set(DEPENDENT_BYPRODUCTSLab2Projecto_default_fN1xohk7 ${DEPENDENT_TARGET_DIRLab2Projecto_default_fN1xohk7}/${sourceFileNameLab2Projecto_default_fN1xohk7}.c)
add_custom_command(
    OUTPUT ${DEPENDENT_TARGET_DIRLab2Projecto_default_fN1xohk7}/${sourceFileNameLab2Projecto_default_fN1xohk7}.c
    COMMAND ${DEPENDENT_MP_BIN2HEXLab2Projecto_default_fN1xohk7} --image ${DEPENDENT_DEPENDENT_TARGET_ELFLab2Projecto_default_fN1xohk7} --image-generated-c ${sourceFileNameLab2Projecto_default_fN1xohk7}.c --image-generated-h ${sourceFileNameLab2Projecto_default_fN1xohk7}.h --image-copy-mode ${modeLab2Projecto_default_fN1xohk7} --image-offset ${addressLab2Projecto_default_fN1xohk7} 
    WORKING_DIRECTORY ${DEPENDENT_TARGET_DIRLab2Projecto_default_fN1xohk7}
    DEPENDS ${DEPENDENT_DEPENDENT_TARGET_ELFLab2Projecto_default_fN1xohk7})
add_custom_target(
    dependent_produced_source_artifactLab2Projecto_default_fN1xohk7 
    DEPENDS ${DEPENDENT_TARGET_DIRLab2Projecto_default_fN1xohk7}/${sourceFileNameLab2Projecto_default_fN1xohk7}.c
    )

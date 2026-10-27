set(DEPENDENT_MP_BIN2HEXLab2Projecto_default_nrFfEYMf "/Applications/microchip/xc32/v6.00/bin/xc32-bin2hex")
set(DEPENDENT_DEPENDENT_TARGET_ELFLab2Projecto_default_nrFfEYMf ${CMAKE_CURRENT_LIST_DIR}/../../../../out/Lab2Projecto/production/production/production/default-production-production-production.elf)
set(DEPENDENT_TARGET_DIRLab2Projecto_default_nrFfEYMf ${CMAKE_CURRENT_LIST_DIR}/../../../../out/Lab2Projecto/production/production/production)
set(DEPENDENT_BYPRODUCTSLab2Projecto_default_nrFfEYMf ${DEPENDENT_TARGET_DIRLab2Projecto_default_nrFfEYMf}/${sourceFileNameLab2Projecto_default_nrFfEYMf}.c)
add_custom_command(
    OUTPUT ${DEPENDENT_TARGET_DIRLab2Projecto_default_nrFfEYMf}/${sourceFileNameLab2Projecto_default_nrFfEYMf}.c
    COMMAND ${DEPENDENT_MP_BIN2HEXLab2Projecto_default_nrFfEYMf} --image ${DEPENDENT_DEPENDENT_TARGET_ELFLab2Projecto_default_nrFfEYMf} --image-generated-c ${sourceFileNameLab2Projecto_default_nrFfEYMf}.c --image-generated-h ${sourceFileNameLab2Projecto_default_nrFfEYMf}.h --image-copy-mode ${modeLab2Projecto_default_nrFfEYMf} --image-offset ${addressLab2Projecto_default_nrFfEYMf} 
    WORKING_DIRECTORY ${DEPENDENT_TARGET_DIRLab2Projecto_default_nrFfEYMf}
    DEPENDS ${DEPENDENT_DEPENDENT_TARGET_ELFLab2Projecto_default_nrFfEYMf})
add_custom_target(
    dependent_produced_source_artifactLab2Projecto_default_nrFfEYMf 
    DEPENDS ${DEPENDENT_TARGET_DIRLab2Projecto_default_nrFfEYMf}/${sourceFileNameLab2Projecto_default_nrFfEYMf}.c
    )

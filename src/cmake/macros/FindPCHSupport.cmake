function(ADD_CXX_PCH TARGET_NAME_LIST PCH_HEADER)
  # Use the header for every target
  foreach(TARGET_NAME ${TARGET_NAME_LIST})
    # Disable unity builds
    set_target_properties(${TARGET_NAME} PROPERTIES UNITY_BUILD OFF)

    # Set the prefix header
    target_precompile_headers(${TARGET_NAME} PRIVATE ${PCH_HEADER})
  endforeach()
endfunction(ADD_CXX_PCH)

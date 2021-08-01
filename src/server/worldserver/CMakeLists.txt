#
# Copyright (C) 2016+     AzerothCore <www.azerothcore.org>, released under GNU AGPL3 v3 license: https://github.com/azerothcore/azerothcore-wotlk/blob/master/LICENSE-AGPL3
#
# This file is free software; as a special exception the author gives
# unlimited permission to copy and/or distribute it, with or without
# modifications, as long as this notice is preserved.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY, to the extent permitted by law; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

CollectSourceFiles(
  ${CMAKE_CURRENT_SOURCE_DIR}
  PRIVATE_SOURCES
  # Exclude
  ${CMAKE_CURRENT_SOURCE_DIR}/PrecompiledHeaders)

if (USE_COREPCH)
  set(PRIVATE_PCH_HEADER PrecompiledHeaders/worldPCH.h)
endif()

add_executable(worldserver
  ${PRIVATE_SOURCES})

set_target_properties(worldserver PROPERTIES
  COMPILE_DEFINITIONS _ACORE_CORE_CONFIG="${CONF_DIR}/worldserver.conf")

add_dependencies(worldserver revision.h)

if(NOT NOJEM)
  set(worldserver_LINK_FLAGS "-pthread -lncurses ${worldserver_LINK_FLAGS}")
endif()

set_target_properties(worldserver PROPERTIES LINK_FLAGS "${worldserver_LINK_FLAGS}")

CollectIncludeDirectories(
  ${CMAKE_CURRENT_SOURCE_DIR}
  PUBLIC_INCLUDES
  # Exclude
  ${CMAKE_CURRENT_SOURCE_DIR}/PrecompiledHeaders)

target_include_directories(worldserver
  PUBLIC
    ${PUBLIC_INCLUDES}
  PRIVATE
    ${CMAKE_CURRENT_BINARY_DIR})

target_link_libraries(worldserver
  PRIVATE
    game-interface
    scripts-interface
  PUBLIC
    game
    shared
    scripts
    readline
    ${GPERFTOOLS_LIBRARIES})

set_target_properties(worldserver
  PROPERTIES
    FOLDER
      "server")

install(TARGETS worldserver DESTINATION bin)

install(FILES worldserver.conf.dist DESTINATION ${CONF_DIR})

# Generate precompiled header
if( USE_COREPCH )
  add_cxx_pch(worldserver ${PRIVATE_PCH_HEADER})
endif()

# handle config file
CU_GET_GLOBAL("MODULE_CONFIG_FILE_LIST")
FOREACH(configFile ${MODULE_CONFIG_FILE_LIST})
install(FILES "${configFile}" DESTINATION ${CONF_DIR})
ENDFOREACH()

CU_GET_GLOBAL("MODULE_CONFIG_FILE_LIST")
FOREACH(configFile ${MODULE_CONFIG_FILE_LIST})
    get_filename_component(file_name ${configFile} NAME_WE)
    set(CONFIG_LIST ${CONFIG_LIST}${file_name},)
ENDFOREACH()
add_definitions(-DCONFIG_FILE_LIST=$<1:"${CONFIG_LIST}">)
# end handle config file

CU_RUN_HOOK("AFTER_WORLDSERVER_CMAKE")

#
# Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU AGPLv3 license: https://gitlab.com/opfesoft/sol/-/blob/master/LICENSE.md
# Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU AGPL3 v3 license: https://github.com/azerothcore/azerothcore-wotlk/blob/master/LICENSE-AGPL3
#
# This file is free software; as a special exception the author gives
# unlimited permission to copy and/or distribute it, with or without
# modifications, as long as this notice is preserved.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY, to the extent permitted by law; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

########### authserver ###############

CollectSourceFiles(
  ${CMAKE_CURRENT_SOURCE_DIR}
  PRIVATE_SOURCES)

add_executable(authserver
  ${PRIVATE_SOURCES})

add_dependencies(authserver revision.h)

set_target_properties(authserver PROPERTIES
  COMPILE_DEFINITIONS _ACORE_REALM_CONFIG="${CONF_DIR}/authserver.conf")

target_link_libraries(authserver
  PUBLIC
    shared)

CollectIncludeDirectories(
  ${CMAKE_CURRENT_SOURCE_DIR}
  PUBLIC_INCLUDES)

target_include_directories(authserver
  PUBLIC
    ${PUBLIC_INCLUDES}
  PRIVATE
    ${CMAKE_CURRENT_BINARY_DIR})

set_target_properties(authserver
  PROPERTIES
    FOLDER
      "server")

install(TARGETS authserver DESTINATION bin)

install(FILES  authserver.conf.dist DESTINATION ${CONF_DIR})

CU_RUN_HOOK("AFTER_AUTHSERVER_CMAKE")

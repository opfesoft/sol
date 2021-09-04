# Copyright (C) 2008-2019 TrinityCore <https://www.trinitycore.org/>
# Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under GNU AGPL3 v3 license: https://gitlab.com/opfesoft/sol/-/blob/master/LICENSE
# Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU AGPL3 v3 license: https://github.com/azerothcore/azerothcore-wotlk/blob/master/LICENSE-AGPL3
#
# This file is free software; as a special exception the author gives
# unlimited permission to copy and/or distribute it, with or without
# modifications, as long as this notice is preserved.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY, to the extent permitted by law; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

# Collects all source files into the given variable,
# which is useful to include all sources in subdirectories.
# Ignores full qualified directories listed in the variadic arguments.
#
# Use it like:
# CollectSourceFiles(
#   ${CMAKE_CURRENT_SOURCE_DIR}
#   COMMON_PRIVATE_SOURCES
#   # Exclude
#   ${CMAKE_CURRENT_SOURCE_DIR}/PrecompiledHeaders
#   ${CMAKE_CURRENT_SOURCE_DIR}/Platform)
#
function(CollectSourceFiles current_dir variable)
  list(FIND ARGN "${current_dir}" IS_EXCLUDED)
  if(IS_EXCLUDED EQUAL -1)
    file(GLOB COLLECTED_SOURCES
      ${current_dir}/*.c
      ${current_dir}/*.cc
      ${current_dir}/*.cpp
      ${current_dir}/*.inl
      ${current_dir}/*.def
      ${current_dir}/*.h
      ${current_dir}/*.hh
      ${current_dir}/*.hpp)
    list(APPEND ${variable} ${COLLECTED_SOURCES})

    file(GLOB SUB_DIRECTORIES ${current_dir}/*)
    foreach(SUB_DIRECTORY ${SUB_DIRECTORIES})
      if (IS_DIRECTORY ${SUB_DIRECTORY})
        CollectSourceFiles("${SUB_DIRECTORY}" "${variable}" "${ARGN}")
      endif()
    endforeach()
    set(${variable} ${${variable}} PARENT_SCOPE)
  endif()
endfunction()

# Collects all subdirectoroies into the given variable,
# which is useful to include all subdirectories.
# Ignores full qualified directories listed in the variadic arguments.
#
# Use it like:
# CollectIncludeDirectories(
#   ${CMAKE_CURRENT_SOURCE_DIR}
#   COMMON_PUBLIC_INCLUDES
#   # Exclude
#   ${CMAKE_CURRENT_SOURCE_DIR}/PrecompiledHeaders
#   ${CMAKE_CURRENT_SOURCE_DIR}/Platform)
#
function(CollectIncludeDirectories current_dir variable)
  list(FIND ARGN "${current_dir}" IS_EXCLUDED)
  if(IS_EXCLUDED EQUAL -1)
    list(APPEND ${variable} ${current_dir})
    file(GLOB SUB_DIRECTORIES ${current_dir}/*)
    foreach(SUB_DIRECTORY ${SUB_DIRECTORIES})
      if (IS_DIRECTORY ${SUB_DIRECTORY})
        CollectIncludeDirectories("${SUB_DIRECTORY}" "${variable}" "${ARGN}")
      endif()
    endforeach()
    set(${variable} ${${variable}} PARENT_SCOPE)
  endif()
endfunction()

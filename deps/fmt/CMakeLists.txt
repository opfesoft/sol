#
# Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU AGPLv3 license: https://gitlab.com/opfesoft/sol/-/blob/master/LICENSE.md
# Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU AGPL3 v3 license: https://github.com/azerothcore/azerothcore-wotlk/blob/master/LICENSE-AGPL3
# Copyright (C) 2008-2019 TrinityCore <https://www.trinitycore.org/>
#
# This file is free software; as a special exception the author gives
# unlimited permission to copy and/or distribute it, with or without
# modifications, as long as this notice is preserved.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY, to the extent permitted by law; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

function(add_headers VAR)
  set(headers ${${VAR}})
  foreach (header ${ARGN})
    set(headers ${headers} fmt/${header})
  endforeach()
  set(${VAR} ${headers} PARENT_SCOPE)
endfunction()

# Define the fmt library, its includes and the needed defines.
add_headers(FMT_HEADERS 
  args.h
  chrono.h
  color.h
  compile.h
  core.h
  format-inl.h
  format.h
  os.h
  ostream.h
  printf.h
  ranges.h
  std.h
  xchar.h)

set(FMT_SOURCES 
  fmt/format.cc
  fmt/os.cc)

add_library(fmt STATIC 
  ${FMT_SOURCES}
  ${FMT_HEADERS})

if (HAVE_STRTOD_L)
  target_compile_definitions(fmt 
    PUBLIC 
      FMT_LOCALE)
endif()

target_include_directories(fmt
  PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR})

target_link_libraries(fmt
  PRIVATE
    acore-dependency-interface)

set_target_properties(fmt
  PROPERTIES
    FOLDER
      "deps")

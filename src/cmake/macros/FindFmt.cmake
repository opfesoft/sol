#
# Find the fmt includes and library
#

# This module defines
# FMT_INCLUDE_DIR, where to find format.h
# FMT_LIBRARY, where to find the fmt library.

if (NOT FMT_INCLUDE_DIR)
  FIND_PATH( FMT_INCLUDE_DIR
    NAMES
      fmt/format.h
    PATHS
      ${LIBSDIR}/fmt/include
    NO_DEFAULT_PATH
  )
endif()

if (NOT FMT_LIBRARY)
  FIND_LIBRARY( FMT_LIBRARY
    NAMES
      fmt
    PATHS
      ${LIBSDIR}/fmt/lib
    NO_DEFAULT_PATH
  )
endif()

if ( FMT_LIBRARY )
  if ( FMT_INCLUDE_DIR )
    message( STATUS "Found fmt library: ${FMT_LIBRARY}")
    message( STATUS "Found fmt headers: ${FMT_INCLUDE_DIR}")
  else ( FMT_INCLUDE_DIR )
    message(FATAL_ERROR "Could not find fmt headers! Please install fmt libraries and headers")
  endif ( FMT_INCLUDE_DIR)
endif ( FMT_LIBRARY )

mark_as_advanced( FMT_LIBRARY FMT_INCLUDE_DIR )

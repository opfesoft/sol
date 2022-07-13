#
# Find the JEMALLOC client includes and library
#

# This module defines
# JEMALLOC_INCLUDE_DIR, where to find ace.h
# JEMALLOC_LIBRARY, where to find the jemalloc library.

if (NOT JEMALLOC_INCLUDE_DIR)
  FIND_PATH( JEMALLOC_INCLUDE_DIR
    NAMES
      jemalloc/jemalloc.h
    PATHS
      ${LIBSDIR}/jemalloc/include
  )
endif()

if (NOT JEMALLOC_LIBRARY)
  FIND_LIBRARY( JEMALLOC_LIBRARY
    NAMES
      jemalloc
    PATHS
      ${LIBSDIR}/jemalloc/lib
  )

endif()

if ( JEMALLOC_LIBRARY )
  if ( JEMALLOC_INCLUDE_DIR )
    message( STATUS "Found jemalloc library: ${JEMALLOC_LIBRARY}")
    message( STATUS "Found jemalloc headers: ${JEMALLOC_INCLUDE_DIR}")
  else ( JEMALLOC_INCLUDE_DIR )
    message(FATAL_ERROR "Could not find jemalloc headers! Please install jemalloc libraries and headers")
  endif ( JEMALLOC_INCLUDE_DIR )
endif ( JEMALLOC_LIBRARY )

mark_as_advanced( JEMALLOC_LIBRARY JEMALLOC_INCLUDE_DIR )

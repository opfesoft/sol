#
# Find the OpenSSL includes and library
#

# This module defines
# OPENSSL_INCLUDE_DIR, where to find crypto.h
# OPENSSL_LIBRARY, where to find the openssl library.

if (NOT OPENSSL_INCLUDE_DIR)
  FIND_PATH( OPENSSL_INCLUDE_DIR
    NAMES
      openssl/crypto.h
    PATHS
      ${LIBSDIR}/openssl/include
    NO_DEFAULT_PATH
  )
endif()

if (NOT OPENSSL_LIBRARY)
  FIND_LIBRARY( OPENSSL_LIBRARY
    NAMES
      crypto
    PATHS
      ${LIBSDIR}/openssl/lib64
    NO_DEFAULT_PATH
  )
endif()

if ( OPENSSL_LIBRARY )
  if ( OPENSSL_INCLUDE_DIR )
    message( STATUS "Found OpenSSL library: ${OPENSSL_LIBRARY}")
    message( STATUS "Found OpenSSL headers: ${OPENSSL_INCLUDE_DIR}")
  else ( OPENSSL_INCLUDE_DIR )
    message(FATAL_ERROR "Could not find OpenSSL headers! Please install OpenSSL libraries and headers")
  endif (  OPENSSL_INCLUDE_DIR)
endif ( OPENSSL_LIBRARY )

mark_as_advanced( OPENSSL_LIBRARY OPENSSL_INCLUDE_DIR )

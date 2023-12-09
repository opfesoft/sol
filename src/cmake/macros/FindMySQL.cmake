#
# Find the MariaDB client includes and library
# 

# This module defines
# MYSQL_INCLUDE_DIR, where to find mysql.h
# MYSQL_LIBRARY, the libraries to link against to connect to MariaDB
# MYSQL_FOUND, if false, you cannot build anything that requires MariaDB

set( MYSQL_FOUND 0 )

find_program(MYSQL_CONFIG mariadb_config
  /usr/local/bin/
  /usr/bin/
)

if( MYSQL_CONFIG )
  message(STATUS "Using mariadb_config: ${MYSQL_CONFIG}")
  # set INCLUDE_DIR
  execute_process(COMMAND ${MYSQL_CONFIG} --variable=pkgincludedir
    OUTPUT_VARIABLE MYSQL_ADD_INCLUDE_PATH
    OUTPUT_STRIP_TRAILING_WHITESPACE
  )

  #message("[DEBUG] MARIADB ADD_INCLUDE_PATH : ${MYSQL_ADD_INCLUDE_PATH}")
  # set LIBRARY_DIR
  execute_process(COMMAND ${MYSQL_CONFIG} --variable=pkglibdir
    OUTPUT_VARIABLE MYSQL_ADD_LIBRARIES_PATH
    OUTPUT_STRIP_TRAILING_WHITESPACE
  )
  #message("[DEBUG] MARIADB ADD_LIBRARIES_PATH : ${MYSQL_ADD_LIBRARIES_PATH}")
endif( MYSQL_CONFIG )

find_path(MYSQL_INCLUDE_DIR
  NAMES
    mysql.h
  PATHS
    ${MYSQL_ADD_INCLUDE_PATH}
  DOC "Specify the directory containing mysql.h"
)

find_library( MYSQL_LIBRARY
  NAMES
    mariadb
  PATHS
    ${MYSQL_ADD_LIBRARIES_PATH}
  DOC "Specify the location of the mariadb library here"
)

if( MYSQL_LIBRARY )
  if( MYSQL_INCLUDE_DIR )
    set( MYSQL_FOUND 1 )
    message(STATUS "Found MariaDB library: ${MYSQL_LIBRARY}")
    message(STATUS "Found MariaDB headers: ${MYSQL_INCLUDE_DIR}")
  else( MYSQL_INCLUDE_DIR )
    message(FATAL_ERROR "Could not find MariaDB headers! Please install the development libraries and headers")
  endif( MYSQL_INCLUDE_DIR )
else( MYSQL_LIBRARY )
  message(FATAL_ERROR "Could not find the MariaDB libraries! Please install the development libraries and headers")
endif( MYSQL_LIBRARY )

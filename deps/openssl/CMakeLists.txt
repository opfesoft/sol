#
# Copyright (C) 2022+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU AGPLv3 license: https://gitlab.com/opfesoft/sol/-/blob/master/LICENSE.md
#
# This file is free software; as a special exception the author gives
# unlimited permission to copy and/or distribute it, with or without
# modifications, as long as this notice is preserved.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY, to the extent permitted by law; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

find_package(OpenSSL 3.0.0...3.1.4 REQUIRED)

add_library(openssl INTERFACE)

target_link_libraries(openssl
  INTERFACE
    ${OPENSSL_LIBRARIES})

target_include_directories(openssl
  INTERFACE
    ${OPENSSL_INCLUDE_DIR})

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

# Look for an installed bzip2 on unix
find_package(BZip2 REQUIRED)

add_library(bzip2 SHARED IMPORTED GLOBAL)

set_target_properties(bzip2
  PROPERTIES
    IMPORTED_LOCATION
      "${BZIP2_LIBRARIES}"
    INTERFACE_INCLUDE_DIRECTORIES
      "${BZIP2_INCLUDE_DIRS}")

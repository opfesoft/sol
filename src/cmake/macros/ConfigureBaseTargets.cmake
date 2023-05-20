#
# Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU GPLv2 license: https://gitlab.com/opfesoft/sol/-/blob/master/deps/gpl-2.0.md; you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
# Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>
# Copyright (C) 2008-2019 TrinityCore <https://www.trinitycore.org/>
#

# An interface library to make the target com available to other targets
add_library(acore-compile-option-interface INTERFACE)

# Use -std=c++17 instead of -std=gnu++17
set(CXX_EXTENSIONS OFF)

# Enable support С++17
set(CMAKE_CXX_STANDARD 17)
message(STATUS "Enabled С++17 support")

# An interface library to make the target features available to other targets
add_library(acore-feature-interface INTERFACE)

target_compile_features(acore-feature-interface
  INTERFACE
    cxx_alias_templates
    cxx_auto_type
    cxx_constexpr
    cxx_decltype
    cxx_decltype_auto
    cxx_final
    cxx_lambdas
    cxx_generic_lambdas
    cxx_variadic_templates
    cxx_defaulted_functions
    cxx_nullptr
    cxx_trailing_return_types
    cxx_return_type_deduction)

# An interface library to make the warnings level available to other targets
# This interface taget is set-up through the platform specific script
add_library(acore-warning-interface INTERFACE)

# An interface used for all other interfaces
add_library(acore-default-interface INTERFACE)
target_link_libraries(acore-default-interface
  INTERFACE
    acore-compile-option-interface
    acore-feature-interface)

# An interface used for silencing all warnings
add_library(acore-no-warning-interface INTERFACE)

target_compile_options(acore-no-warning-interface
  INTERFACE
    -w)

# An interface library to change the default behaviour
# to hide symbols automatically.
add_library(acore-hidden-symbols-interface INTERFACE)

# An interface amalgamation which provides the flags and definitions
# used by the dependency targets.
add_library(acore-dependency-interface INTERFACE)
target_link_libraries(acore-dependency-interface
  INTERFACE
    acore-default-interface
    acore-no-warning-interface
    acore-hidden-symbols-interface)

# An interface amalgamation which provides the flags and definitions
# used by the core targets.
add_library(acore-core-interface INTERFACE)
target_link_libraries(acore-core-interface
  INTERFACE
    acore-default-interface
    acore-warning-interface)

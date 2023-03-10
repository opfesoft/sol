# Copyright (C) TrinityCore, AzerothCore
#
# This file is free software; as a special exception the author gives
# unlimited permission to copy and/or distribute it, with or without
# modifications, as long as this notice is preserved.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY, to the extent permitted by law; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

# User has manually chosen to ignore the git-tests, so throw them a warning.
# This is done EACH compile so they can be alerted about the consequences.

if(NOT BUILDDIR)
  set(BUILDDIR ${CMAKE_BINARY_DIR})
endif()

if(WITHOUT_GIT)
  set(rev_date "1970-01-01 00:00:00 +0000")
  set(rev_date_unix "0")
  set(rev_hash "unknown")
  set(rev_branch "Archived")
else()
  # Workaround for not correctly detecting git
  if (NOT GIT_EXECUTABLE)
    set(GIT_EXECUTABLE "git")
  endif()

  if(GIT_EXECUTABLE)
    # Create a revision-string that we can use
    execute_process(
      COMMAND "${GIT_EXECUTABLE}" describe --long --match 0.1 --dirty=+ --abbrev=12 --always
      WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
      OUTPUT_VARIABLE rev_info
      OUTPUT_STRIP_TRAILING_WHITESPACE

    )

    # And grab the commits timestamp
    execute_process(
      COMMAND "${GIT_EXECUTABLE}" show -s --format=%ci
      WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
      OUTPUT_VARIABLE rev_date
      OUTPUT_STRIP_TRAILING_WHITESPACE
      ERROR_QUIET
    )

    execute_process(
      COMMAND "${GIT_EXECUTABLE}" show -s --format=%ct
      WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
      OUTPUT_VARIABLE rev_date_unix
      OUTPUT_STRIP_TRAILING_WHITESPACE
      ERROR_QUIET
    )

    # Also retrieve branch name
    execute_process(
      COMMAND "${GIT_EXECUTABLE}" rev-parse --abbrev-ref HEAD
      WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
      OUTPUT_VARIABLE rev_branch
      OUTPUT_STRIP_TRAILING_WHITESPACE
      ERROR_QUIET
    )
  endif()

  # Last minute check - ensure that we have a proper revision
  # If everything above fails (means the user has erased the git revision control directory or removed the origin/HEAD tag)
  if(NOT rev_info)
    # No valid ways available to find/set the revision/hash, so let's force some defaults
    message(STATUS "
    Could not find a proper repository signature (hash) - you may need to pull tags with git fetch -t
    Continuing anyway - note that the versionstring will be set to \"unknown 1970-01-01 00:00:00 (Archived)\"")
    set(rev_date "1970-01-01 00:00:00 +0000")
    set(rev_date_unix "0")
    set(rev_hash "unknown")
    set(rev_branch "Archived")
  else()
    # Extract information required to build a proper versionstring
    string(REGEX REPLACE 0.1-|[0-9]+-g "" rev_hash ${rev_info})
  endif()
endif()

# Create the actual revision.h file from the above params
if(NOT "${rev_hash_cached}" STREQUAL "${rev_hash}" OR NOT "${rev_branch_cached}" STREQUAL "${rev_branch}" OR NOT EXISTS "${BUILDDIR}/revision.h")
  configure_file(
    "${CMAKE_SOURCE_DIR}/src/cmake/revision.h.in.cmake"
    "${BUILDDIR}/revision.h"
    @ONLY
  )
  set(rev_hash_cached "${rev_hash}" CACHE INTERNAL "Cached commit-hash")
  set(rev_branch_cached "${rev_branch}" CACHE INTERNAL "Cached branch name")
endif()

# check what platform we're on (64-bit or 32-bit), and create a simpler test than CMAKE_SIZEOF_VOID_P
if(CMAKE_SIZEOF_VOID_P MATCHES 8)
    set(PLATFORM 64)
    MESSAGE(STATUS "Detected 64-bit platform")
else()
    set(PLATFORM 32)
    MESSAGE(STATUS "Detected 32-bit platform")
endif()

include("${CMAKE_SOURCE_DIR}/src/cmake/platform/settings.cmake")

include("${CMAKE_SOURCE_DIR}/src/cmake/platform/unix/settings.cmake")

include("${CMAKE_SOURCE_DIR}/src/cmake/platform/after_platform.cmake")

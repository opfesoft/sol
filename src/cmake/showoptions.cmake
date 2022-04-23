# output generic information about the core and buildtype chosen
message("")
message("* Project \"Sol\" revision          : ${rev_hash} ${rev_date} (${rev_branch} branch)")
message("* Project \"Sol\" buildtype         : ${CMAKE_BUILD_TYPE}")
message("")

# output information about installation-directories and locations

message("* Install core to                 : ${CMAKE_INSTALL_PREFIX}")
message("* Install libraries to            : ${LIBSDIR}")

message("* Install configs to              : ${CONF_DIR}")
add_definitions(-D_CONF_DIR=$<1:"${CONF_DIR}">)

message("")

# Show infomation about the options selected during configuration

if( SERVERS )
  message("* Build world/auth                : Yes (default)")
else()
  message("* Build world/authserver          : No")
endif()

if( SCRIPTS )
  message("* Build with scripts              : Yes (default)")
  add_definitions(-DSCRIPTS)
else()
  message("* Build with scripts              : No")
endif()

if( TOOLS )
  message("* Build map/vmap tools            : Yes")
  add_definitions(-DNO_CORE_FUNCS)
else()
  message("* Build map/vmap tools            : No  (default)")
endif()

if( WITH_WARNINGS )
  message("* Show all warnings               : Yes")
else()
  message("* Show compile-warnings           : No  (default)")
endif()

if( WITH_COREDEBUG )
  message("* Use coreside debug              : Yes")
  add_definitions(-DACORE_DEBUG)
else()
  message("* Use coreside debug              : No  (default)")
endif()

if( WITH_PERFTOOLS )
  message("* Use unix gperftools             : Yes")
  add_definitions(-DPERF_TOOLS)
else()
  message("* Use unix gperftools             : No  (default)")
endif()

if ( WITHOUT_GIT )
  message("* Use GIT revision hash           : No")
  message("")
  message(" *** WITHOUT_GIT - WARNING!")
  message(" *** By choosing the WITHOUT_GIT option you have waived all rights for support,")
  message(" *** and accept that or all requests for support or assistance sent to the core")
  message(" *** developers will be rejected. This due to that we will be unable to detect")
  message(" *** what revision of the codebase you are using in a proper way.")
  message(" *** We remind you that you need to use the repository codebase and a supported")
  message(" *** version of git for the revision-hash to work, and be allowede to ask for")
  message(" *** support if needed.")
else()
  message("* Use GIT revision hash           : Yes (default)")
endif()

if ( NOJEM )
  message("")
  message(" *** NOJEM - WARNING!")
  message(" *** jemalloc linking has been disabled!")
  message(" *** Please note that this is for DEBUGGING WITH VALGRIND only!")
  message(" *** DO NOT DISABLE IT UNLESS YOU KNOW WHAT YOU'RE DOING!")
endif()

# Performance optimization options:

if( ENABLE_EXTRAS )
  message("* Enable extra features           : Yes (default)")
  add_definitions(-DENABLE_EXTRAS)
else()
  message("* Enable extra features           : No")
endif()

if( ENABLE_VMAP_CHECKS )
  message("* Enable vmap DisableMgr checks   : Yes (default)")
  add_definitions(-DENABLE_VMAP_CHECKS)
else()
  message("* Enable vmap DisableMgr checks   : No")
endif()

if( ENABLE_EXTRA_LOGS )
  message("* Enable extra logging functions  : Yes")
  add_definitions(-DENABLE_EXTRA_LOGS)
else()
  message("* Enable extra logging functions  : No (default)")
endif()

message("* Show source tree                : No (For UNIX default)")

message("")


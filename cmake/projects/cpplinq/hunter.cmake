if(DEFINED HUNTER_CMAKE_PROJECTS_CPPLINQ_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_CPPLINQ_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME CPPLINQ
    VERSION "20150908"
    URL "https://github.com/daminetreg/cpplinq/archive/cpplinq-20150908.tar.gz"
    SHA1 8b8ef7069e2992b069dd023d275bab2cbef54292 
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_download(PACKAGE_NAME CPPLINQ)

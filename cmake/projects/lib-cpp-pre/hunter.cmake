if(DEFINED HUNTER_CMAKE_PROJECTS_LIB_CPP_PRE_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_LIB_CPP_PRE_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME lib-cpp-pre
    VERSION "1.2.0"
    URL "https://github.com/daminetreg/lib-cpp-pre/archive/v1.2.0.tar.gz" 
    SHA1 9e3ab0289fa1250916f4a47fae862ed4f5063cba 
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_download(PACKAGE_NAME lib-cpp-pre)

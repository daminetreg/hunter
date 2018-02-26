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
    VERSION "1.4.5"
    URL "https://github.com/daminetreg/lib-cpp-pre/archive/v1.4.5.tar.gz" 
    SHA1 15b7dafe7a0528ffbd9395ae17e77348c1db65f6 
)


hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_download(PACKAGE_NAME lib-cpp-pre)

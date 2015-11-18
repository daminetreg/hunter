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
    VERSION "1.2.2"
    URL "https://github.com/daminetreg/lib-cpp-pre/archive/v1.2.2.tar.gz" 
    SHA1 6733a0abd9f74bd67e4ef521e7677ad9437cdba1 
)

hunter_add_version(
    PACKAGE_NAME lib-cpp-pre
    VERSION "1.3.2"
    URL "https://github.com/daminetreg/lib-cpp-pre/archive/v1.3.2.tar.gz" 
    SHA1 e91a1364d88087d162b9fb05309cb47702ec25a2 
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_download(PACKAGE_NAME lib-cpp-pre)

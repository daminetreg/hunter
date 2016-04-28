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
    SHA1 fef5d597594a62f25bc4ae71608d1f0d70f24a56 
)

hunter_add_version(
    PACKAGE_NAME lib-cpp-pre
    VERSION "1.3.3"
    URL "https://github.com/daminetreg/lib-cpp-pre/archive/v1.3.3.tar.gz" 
    SHA1 28e5f813b255d6a2e5592d0cf80225ffaeef3f8e 
)

hunter_add_version(
    PACKAGE_NAME lib-cpp-pre
    VERSION "1.3.5"
    URL "https://github.com/daminetreg/lib-cpp-pre/archive/v1.3.5.tar.gz" 
    SHA1 3b32577823fd7fdbe448d13e6011672e7a8ef143 
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_download(PACKAGE_NAME lib-cpp-pre)

if(DEFINED HUNTER_CMAKE_PROJECTS_CPPCMS_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_CPPCMS_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME CPPCMS
    VERSION "1.0.5"
    URL "http://downloads.sourceforge.net/project/cppcms/cppcms/1.0.5/cppcms-1.0.5.tar.bz2" 
    SHA1 15f21897c14acfd4b0c74622e49d95857f2fe939
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_download(PACKAGE_NAME CPPCMS)

# Create checksums for source and binary packages.
# "make package" and "make package_source" must be run before "make checksums" to get them.

message (STATUS "Packages must be generated using 'make package' and 'make package_source' before")
file(REMOVE "checksums-md5.txt")
file(REMOVE "checksums-sha1.txt")
file(REMOVE "checksums-sha256.txt")
file(REMOVE "checksums-sha512.txt")
# Binary packages
foreach(ext "tar.gz" "tar.bz2" "deb" "rpm")
    if(EXISTS "wxmaxima-${VERSION}-${CMAKE_SYSTEM_NAME}.${ext}")
        file(MD5 wxmaxima-${VERSION}-${CMAKE_SYSTEM_NAME}.${ext} hashvalue)    
        file(APPEND "checksums-md5.txt" "${hashvalue}  wxmaxima-${VERSION}-${CMAKE_SYSTEM_NAME}.${ext}\n")
        file(SHA1 wxmaxima-${VERSION}-${CMAKE_SYSTEM_NAME}.${ext} hashvalue)    
        file(APPEND "checksums-sha1.txt" "${hashvalue}  wxmaxima-${VERSION}-${CMAKE_SYSTEM_NAME}.${ext}\n")
        file(SHA256 wxmaxima-${VERSION}-${CMAKE_SYSTEM_NAME}.${ext} hashvalue)    
        file(APPEND "checksums-sha256.txt" "${hashvalue}  wxmaxima-${VERSION}-${CMAKE_SYSTEM_NAME}.${ext}\n")
        file(SHA512 wxmaxima-${VERSION}-${CMAKE_SYSTEM_NAME}.${ext} hashvalue)    
        file(APPEND "checksums-sha512.txt" "${hashvalue}  wxmaxima-${VERSION}-${CMAKE_SYSTEM_NAME}.${ext}\n")
    endif()
endforeach()
# Source packages
foreach(ext "tar.gz" "tar.bz2" "tar.xz" "tar.Z")
    if(EXISTS "wxmaxima-${VERSION}.${ext}")
        file(MD5 wxmaxima-${VERSION}.${ext} hashvalue)    
        file(APPEND "checksums-md5.txt" "${hashvalue}  wxmaxima-${VERSION}.${ext}\n")
        file(SHA1 wxmaxima-${VERSION}.${ext} hashvalue)    
        file(APPEND "checksums-sha1.txt" "${hashvalue}  wxmaxima-${VERSION}.${ext}\n")
        file(SHA256 wxmaxima-${VERSION}.${ext} hashvalue)    
        file(APPEND "checksums-sha256.txt" "${hashvalue}  wxmaxima-${VERSION}.${ext}\n")
        file(SHA512 wxmaxima-${VERSION}.${ext} hashvalue)    
        file(APPEND "checksums-sha512.txt" "${hashvalue}  wxmaxima-${VERSION}.${ext}\n")
    endif()
endforeach()

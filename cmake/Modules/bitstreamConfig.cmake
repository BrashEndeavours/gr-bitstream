INCLUDE(FindPkgConfig)
PKG_CHECK_MODULES(PC_BITSTREAM bitstream)

FIND_PATH(
    BITSTREAM_INCLUDE_DIRS
    NAMES bitstream/api.h
    HINTS $ENV{BITSTREAM_DIR}/include
        ${PC_BITSTREAM_INCLUDEDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/include
          /usr/local/include
          /usr/include
)

FIND_LIBRARY(
    BITSTREAM_LIBRARIES
    NAMES gnuradio-bitstream
    HINTS $ENV{BITSTREAM_DIR}/lib
        ${PC_BITSTREAM_LIBDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/lib
          ${CMAKE_INSTALL_PREFIX}/lib64
          /usr/local/lib
          /usr/local/lib64
          /usr/lib
          /usr/lib64
)

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(BITSTREAM DEFAULT_MSG BITSTREAM_LIBRARIES BITSTREAM_INCLUDE_DIRS)
MARK_AS_ADVANCED(BITSTREAM_LIBRARIES BITSTREAM_INCLUDE_DIRS)


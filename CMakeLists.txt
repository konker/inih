cmake_minimum_required(VERSION 2.8)
project(inih)
set(CMAKE_BUILD_TYPE Debug)

option(SHARED_LIBRARY "Build a shared library" OFF)

include_directories(include)

file(GLOB LIBSOURCES "src/*.c")
file(GLOB EXAMPLESOURCES "examples/*.c")

if(SHARED_LIBRARY)
    add_library(inih SHARED ${LIBSOURCES})
else()
    add_library(inih STATIC ${LIBSOURCES})
endif()


#ini_xmacros.c
add_executable(ini_example examples/ini_example.c)
target_link_libraries(ini_example inih)

add_executable(ini_dump examples/ini_dump.c)
target_link_libraries(ini_dump inih)

add_executable(ini_buffer examples/ini_buffer.c)
target_link_libraries(ini_buffer inih)

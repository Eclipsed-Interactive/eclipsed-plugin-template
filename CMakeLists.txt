cmake_minimum_required(VERSION "4.0.0")

include(Tools/options.cmake)

project(${PLUGIN_NAME} LANGUAGES CXX C)

add_compile_definitions(
    PRIVATE
        ${PLUGIN_API_KEY}_EXPORTS
    INTERFACE
        ${PLUGIN_API_KEY}_IMPORTS
)

set(ROOT "${CMAKE_CURRENT_SOURCE_DIR}/Plugin/Assets")
file(GLOB_RECURSE SOURCE
    "${ROOT}/*.cpp"
    "${ROOT}/*.h"
    "${ROOT}/*.c"
    "${ROOT}/*.hpp"
    "${ROOT}/*.ipp"
    "${ROOT}/*.inl"
)

add_library(${PLUGIN_NAME} ${PLUGIN_LIBRARY_TYPE} ${SOURCE})

set_target_properties(${PLUGIN_NAME} PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/Bin"
)

target_include_directories(${PLUGIN_NAME} PUBLIC ${ENGINE_PATH})

source_group(
    TREE "${CMAKE_CURRENT_SOURCE_DIR}/Plugin/Assets"
    FILES ${SOURCE}
)



file(GLOB_RECURSE ASSETS
    "${ROOT}/*"
)

list(FILTER ASSETS EXCLUDE REGEX "\\.(hpp|h|cpp|c|ipp|inl)$")

if(ASSETS)
    add_custom_target(Assets SOURCES ${ASSETS})

    source_group(
        TREE "${ROOT}"
        FILES ${ASSETS}
    )
endif()







file(WRITE "${CMAKE_CURRENT_SOURCE_DIR}/Generated/${PLUGIN_NAME}.Core.hpp"
    "#pragma once\n"
    "\n"
    "#ifdef ${PLUGIN_API_KEY}_EXPORTS\n"
    "#define ${PLUGIN_API_KEY} __declspec(dllexport)\n"
    "#elif ${PLUGIN_API_KEY}_IMPORTS\n"
    "#define ${PLUGIN_API_KEY} __declspec(dllimport)\n"
    "#else\n"
    "#define  ${PLUGIN_API_KEY}\n"
    "#endif"
)

set(GEN_ROOT "${CMAKE_CURRENT_SOURCE_DIR}/Generated")
file(GLOB_RECURSE GEN_SOURCE
    "${GEN_ROOT}/*.cpp"
    "${GEN_ROOT}/*.h"
    "${GEN_ROOT}/*.c"
    "${GEN_ROOT}/*.hpp"
    "${GEN_ROOT}/*.ipp"
    "${GEN_ROOT}/*.inl"
)

set_source_files_properties(
    ${GEN_SOURCE}
    PROPERTIES
        LANGUAGE CXX
)

add_library(Generated STATIC ${GEN_SOURCE})

source_group(
        TREE "${GEN_ROOT}"
        FILES ${GEN_SOURCE}
    )

target_link_libraries(${PLUGIN_NAME} PUBLIC Generated)

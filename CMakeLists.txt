cmake_minimum_required(VERSION "4.0.0")

include(Tools/options.cmake)

if("${PLUGIN_NAME}" STREQUAL "")
    get_filename_component(FOLDER_NAME "${CMAKE_CURRENT_SOURCE_DIR}" PLUGIN_NAME)
endif()

project(${PLUGIN_NAME} LANGUAGES CXX C)

set(ROOT "${CMAKE_CURRENT_SOURCE_DIR}/Plugin")
file(GLOB_RECURSE SOURCE
    "${ROOT}/*.cpp"
    "${ROOT}/*.h"
    "${ROOT}/*.c"
    "${ROOT}/*.hpp"
    "${ROOT}/*.ipp"
    "${ROOT}/*.inl"
)

add_library(${PLUGIN_NAME} ${PLUGIN_LIBRARY_TYPE})

target_compile_definitions(${PLUGIN_NAME}
    PRIVATE
        ${PLUGIN_API_KEY}_EXPORTS
)

if("${PLUGIN_LIBRARY_TYPE}" STREQUAL "SHARED")
    target_compile_definitions(${PLUGIN_NAME}
        PRIVATE
            IS_SHARED
    )
endif()

target_include_directories(${PLUGIN_NAME} PUBLIC ${ENGINE_PATH})

set_target_properties(${PLUGIN_NAME} PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/Bin"
)

if(SOURCE)
    target_sources(${PLUGIN_NAME} PRIVATE
        ${SOURCE}
    )

    source_group(
        TREE "${CMAKE_CURRENT_SOURCE_DIR}/Plugin"
        FILES ${SOURCE}
    )
endif()

include(Plugin/Plugin.cmake)


target_link_libraries(${PLUGIN_NAME} PUBLIC Generated)

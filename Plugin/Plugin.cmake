include_guard(GLOBAL)

file(WRITE "${CMAKE_CURRENT_SOURCE_DIR}/Generated/Plugin.Core.hpp"
    "#pragma once\n"
    "\n"
    "#if defined(${PLUGIN_API_KEY}_EXPORTS) && defined(IS_SHARED)\n"
    "#define DLL __declspec(dllexport)\n"
    "#elif defined(IS_SHARED)\n"
    "#define DLL __declspec(dllimport)\n"
    "#else\n"
    "#define DLL ${PLUGIN_API_KEY}\n"
    "#endif"
)

if(CMAKE_SOURCE_DIR STREQUAL CMAKE_CURRENT_SOURCE_DIR)

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

    target_include_directories(Generated PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/Generated")

    source_group(
            TREE "${GEN_ROOT}"
            FILES ${GEN_SOURCE}
        )

    target_link_libraries(${PLUGIN_NAME} PUBLIC Generated)
else()
    target_include_directories(${PLUGIN_NAME} PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/Generated")
    target_sources(${PLUGIN_NAME} PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/Generated/Plugin.Core.hpp")
    target_link_libraries(${PLUGIN_NAME} PUBLIC EclipsedEngine)
endif()
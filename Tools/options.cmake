include_guard(GLOBAL)

set(CMAKE_CXX_STANDARD 20)

set(CMAKE_PCH_INSTANTIATE_TEMPLATES ON)
set(CMAKE_UNITY_BUILD ON)

set(HIDE_CMAKELISTS ON)

set(ENGINE_PATH "" CACHE PATH "Path to the engine")
set(PLUGIN_NAME "" CACHE STRING "Plugin name")
set(PLUGIN_LIBRARY_TYPE "" CACHE STRING "Plugin library type")
set(PLUGIN_API_KEY "" CACHE STRING "Plugin api key name")

set_property(GLOBAL PROPERTY 
    USE_FOLDERS ON
    
)
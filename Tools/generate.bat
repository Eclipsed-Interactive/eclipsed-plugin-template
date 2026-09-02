@echo off

call common.bat :GetEnginePath
call common.bat :GetPluginName
call common.bat :GetApiKey

cd ..

if "%~1"=="" (
    set "LIBRARY_TYPE=SHARED"
) else (
    set "LIBRARY_TYPE=%~1"
)

cmake -G "Visual Studio 18 2026"    ^
    -T host=x64                     ^
    -S .                            ^
    -B Library/Game-Plugin-Binary   ^
    -DENGINE_PATH="%ENGINE_PATH%"   ^
    -DPLUGIN_NAME="%PLUGIN_NAME%"   ^
    -DPLUGIN_LIBRARY_TYPE="%LIBRARY_TYPE%"  ^
    -DPLUGIN_API_KEY="%API_KEY%"

    pause
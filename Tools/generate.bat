@echo off

setlocal

call common.bat :GetEnginePath
call common.bat :GetPluginName
call common.bat :GetApiKey
call common.bat :GetEngineOutputPath


if "%~1"=="" (
    set "LIBRARY_TYPE=SHARED"
) else (
    set "LIBRARY_TYPE=%~1"
)

cd ..

cmake -G "Visual Studio 18 2026"    ^
    -T host=x64                     ^
    -S .                            ^
    -B Library/DLL-Plugin-Binary   ^
    -DENGINE_PATH="%ENGINE_PATH%"   ^
    -DPLUGIN_NAME="%PLUGIN_NAME%"   ^
    -DPLUGIN_LIBRARY_TYPE="%LIBRARY_TYPE%"  ^
    -DENGINE_OUTPUT_PATH="%ENGINE_OUTPUT_PATH%"  ^
    -DPLUGIN_API_KEY="%API_KEY%"

endlocal
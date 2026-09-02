@echo off

setlocal EnableDelayedExpansion

if "%~1" NEQ "" (
    echo engine-path="%~1" > .plugin
) else (
    set /p "ENGINE_PATH=Enter engine path: "
    set /p "PLUGIN_NAME=Enter plugin name: "
    set /p "API_KEY=Enter plugin api key (The name of the dll export define): "
    
    echo engine-path=!ENGINE_PATH!> ".plugin"
    echo plugin-name=!PLUGIN_NAME!>> ".plugin"
    echo api-key=!API_KEY!>> ".plugin"
)

endlocal
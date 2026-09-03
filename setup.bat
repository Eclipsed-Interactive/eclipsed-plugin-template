@echo off

setlocal EnableDelayedExpansion

if "%~1" NEQ "" (
    
) else (
    set /p "PLUGIN_NAME=Enter plugin name: "
    set /p "API_KEY=Enter plugin api key (The name of the dll export define): "
    
    echo plugin-name=!PLUGIN_NAME!>> ".plugin"
    echo api-key=!API_KEY!>> ".plugin"
)

endlocal
@echo off

if /i "%~1"==":GetEnginePath" goto GetEnginePath
if /i "%~1"==":GetPluginName" goto GetPluginName
if /i "%~1"==":GetApiKey" goto GetApiKey

exit /b 1


:GetEnginePath

set "CONFIG=%~dp0..\.plugin"

for /f "usebackq tokens=1,* delims==" %%A in ("%CONFIG%") do (
    if "%%A"=="engine-path" set "ENGINE_PATH=%%B"
)

exit /b 0


:GetPluginName

set "CONFIG=%~dp0..\.plugin"

for /f "usebackq tokens=1,* delims==" %%A in ("%CONFIG%") do (
    if "%%A"=="plugin-name" set "PLUGIN_NAME=%%B"
)

exit /b 0



:GetApiKey

set "CONFIG=%~dp0..\.plugin"

for /f "usebackq tokens=1,* delims==" %%A in ("%CONFIG%") do (
    if "%%A"=="api-key" set "API_KEY=%%B"
)

exit /b 0
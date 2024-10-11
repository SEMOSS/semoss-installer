@echo off
Setlocal EnableDelayedExpansion

FOR /F "tokens=1,2 delims==" %%G IN (master.properties) DO (
    set %%G=%%H
)

set dir=%cd%

set "workspacePath2=%workspacePath%"
set "workspacePath2=!workspacePath2:\=\\!"
if not exist "%workspacePath%" mkdir "%workspacePath%"

:: Setup Log Files
if not exist logs (
    mkdir logs
)
call > logs/settings.log
call > logs/vs_install.log
call > logs/download_software.log
call > logs/clone.log
call > logs/maven.log

start "Settings.bat" /d ".\scripts" /MIN "Settings.bat" >> logs/settings.log 2>&1
start "VS_Install.bat" /d ".\scripts" "VSInstall.bat" >> logs/vs_install.log 2>&1
start "Download_Software.bat" /d ".\scripts" /W "Download_Software.bat" >> logs/download_software.log 2>&1
start "clone.bat" /d ".\scripts" /B /W "clone.bat" >> logs/clone.log 2>&1

call .\scripts\pnpm.bat
call .\scripts\buildProjectPath.bat
call .\scripts\importSettings.bat
call .\scripts\CheckRDF_Map.bat
call .\scripts\socialProperties_Update.bat
call .\scripts\server.bat
call .\scripts\WebXml.bat
call .\scripts\createTomcat.bat

if %setEnvVariables%==true (
    call .\scripts\Environment_Variables.bat
    pause
)

start "Maven Clean & Install" /d ".\scripts" /B /W "maven.bat" >> logs/maven.log 2>&1
call .\scripts\catalina.bat
start "Maven Clean & Install" /d ".\scripts" /B /W "maven.bat" >> logs/maven.log 2>&1

if %rInstall%==true (
    call .\scripts\R_Install.bat
    pause
)

call .\scripts\pythonlibs.bat
call .\scripts\semoss_Update.bat
call .\scripts\launch.bat

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
call > logs/master.log

start "Settings.bat" /d ".\scripts" /MIN "Settings.bat" >> logs/settings.log 2>&1
start "VS_Install.bat" /d ".\scripts" "VSInstall.bat" >> logs/vs_install.log 2>&1
start "Download_Software.bat" /d ".\scripts" /W "Download_Software.bat" >> logs/download_software.log 2>&1
start "clone.bat" /d ".\scripts" /B /W "clone.bat" >> logs/clone.log 2>&1

call .\scripts\classpath.bat >> logs/master.log 2>&1
call .\scripts\CheckRDF_Map.bat >> logs/master.log 2>&1
call .\scripts\socialProperties_Update.bat >> logs/master.log 2>&1
call .\scripts\server.bat >> logs/master.log 2>&1
call .\scripts\WebXml.bat >> logs/master.log 2>&1
call .\scripts\createTomcat.bat >> logs/master.log 2>&1

pause

if %setEnvVariables%==true (
    call .\scripts\Environment_Variables.bat >> logs/master.log 2>&1
    pause
)

start "Maven Clean & Install" /d ".\scripts" /B /W "maven.bat" >> logs/master.log 2>&1
call .\scripts\catalina.bat >> logs/master.log 2>&1
start "Maven Clean & Install" /d ".\scripts" /B /W "maven.bat" >> logs/master.log 2>&1

pause

if %rInstall%==true (
    call .\scripts\R_Install.bat >> logs/master.log 2>&1
    pause
)

call .\scripts\pythonlibs.bat >> logs/master.log 2>&1
call .\scripts\pnpm.bat >> logs/master.log 2>&1
call .\scripts\semoss_Update.bat >> logs/master.log 2>&1
call .\scripts\launch.bat >> logs/master.log 2>&1
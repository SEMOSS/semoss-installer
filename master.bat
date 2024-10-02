@echo off
Setlocal EnableDelayedExpansion

FOR /F "tokens=1,2 delims==" %%G IN (master.properties) DO (
    set %%G=%%H
)

set dir=%cd%

set "workspacePath2=%workspacePath%"
set "workspacePath2=!workspacePath2:\=\\!"
if not exist "%workspacePath%" mkdir "%workspacePath%"

start "Settings.bat" /d ".\scripts" /MIN "Settings.bat"
start "VS_Install.bat" /d ".\scripts" "VSInstall.bat"
start "Download_Software.bat" /d ".\scripts" /W "Download_Software.bat"
start "clone.bat" /d ".\scripts" /B /W "clone.bat"
call .\scripts\classpath.bat
call .\scripts\CheckRDF_Map.bat
call .\scripts\socialProperties_Update.bat
call .\scripts\server.bat
call .\scripts\WebXml.bat
call .\scripts\createTomcat.bat

pause

if %setEnvVariables%==true (
    call .\scripts\Environment_Variables.bat
    pause
)

start "Maven Clean & Install" /d ".\scripts" /B /W "maven.bat"
call .\scripts\catalina.bat
start "Maven Clean & Install" /d ".\scripts" /B /W "maven.bat"

pause

if %rInstall%==true (
    call .\scripts\R_Install.bat
    pause
)

call .\scripts\pythonlibs.bat
call .\scripts\pnpm.bat
call .\scripts\semoss_Update.bat
call .\scripts\launch.bat
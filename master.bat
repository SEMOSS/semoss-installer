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

@REM start "Settings.bat" /d ".\scripts" /MIN "Settings.bat" >> logs/settings.log 2>&1
@REM start "VS_Install.bat" /d ".\scripts" "VSInstall.bat" >> logs/vs_install.log 2>&1
@REM start "Download_Software.bat" /d ".\scripts" /W "Download_Software.bat" >> logs/download_software.log 2>&1
@REM start "clone.bat" /d ".\scripts" /B /W "clone.bat" >> logs/clone.log 2>&1

@REM call .\scripts\pnpm.bat
@REM call .\scripts\buildProjectPath.bat
@REM call .\scripts\importSettings.bat
@REM call .\scripts\CheckRDF_Map.bat
@REM call .\scripts\socialProperties_Update.bat
@REM call .\scripts\server.bat
@REM call .\scripts\WebXml.bat
@REM call .\scripts\createTomcat.bat

@REM if %setEnvVariables%==true (
@REM     call .\scripts\Environment_Variables.bat
@REM )

@REM start "Maven Clean & Install" /d ".\scripts" /B /W "maven.bat" >> logs/maven.log 2>&1
@REM call .\scripts\catalina.bat
@REM start "Maven Clean & Install" /d ".\scripts" /B /W "maven.bat" >> logs/maven.log 2>&1

@REM if %rInstall%==true (
@REM     call .\scripts\R_Install.bat
@REM     pause
@REM )

@REM if %pyenvInstall%==true (
@REM     call .\scripts\pyenv\pyenv_install.bat
@REM     call .\scripts\pyenv\pyenv_env.bat
@REM     call .\scripts\pyenv\pyenv_scoop.bat
@REM )

call .\scripts\pythonlibs.bat
@REM call .\scripts\semoss_Update.bat
@REM call .\scripts\launch.bat

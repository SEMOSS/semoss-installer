@echo off
Setlocal EnableDelayedExpansion

SET R_Path=%UserProfile%\Documents\R\%R_Version%
SET Downloads=%UserProfile%\Downloads

:: Downloads R
if not exist %R_Path% mkdir %R_Path%
curl -o %Downloads%\R-4.2.3-win.exe %R_Download%
start %Downloads%\R-4.2.3-win.exe

pause

:: R Variables
if %setEnvVariables%==true (
    setx R_HOME "%UserProfile%\Documents\R\%R_Version%" /m
    if not exist "%UserProfile%\Documents\R\win-library\4.2" mkdir "%UserProfile%\Documents\R\win-library\4.2"
    setx R_LIBS "%UserProfile%\Documents\R\win-library\4.2" /m

    pause
)

:: Installs R Packages
"%UserProfile%\Documents\R\%R_Version%\bin\Rscript.exe" "%workspacePath%\Semoss\R\SemossConfigR\scripts\Packages.R"
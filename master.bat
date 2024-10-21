@echo off
Setlocal EnableDelayedExpansion

:: Permission Check
echo Detecting permissions...

net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Administrative permissions required. Close the program and run again as administrator.
    exit /B
) else (
    echo Success: Administrative permissions confirmed.
)

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

echo 1. Updating Settings
start /wait "Settings.bat" /d ".\scripts" /MIN "Settings.bat" >> logs/settings.log 2>&1
echo 2. Checking Visual Studio
if %vsFlag%==true (
    start /wait "VS_Install.bat" /d ".\scripts" "VSInstall.bat" >> logs/vs_install.log 2>&1
)
echo 3. Software Downloads
start /wait "Download_Software.bat" /d ".\scripts" "Download_Software.bat" >> logs/download_software.log 2>&1
set "PATH=%ProgramFiles%\Git\cmd;%PATH%"
git --version
set "PATH=%ProgramFiles%\nodejs\;%PATH%"
node --version
echo 4. Cloning Repos
start "Monolith Clone" /d "%workspacePath%" /MIN "%dir%\scripts\cloneScripts\monoClone.bat"
start "SemossWeb Clone" /d "%workspacePath%\%Tomcat_Version%\webapps" /MIN "%dir%\scripts\cloneScripts\semossWebClone.bat"
start /wait "Semoss Clone" /d "%workspacePath%" /MIN "%dir%\scripts\cloneScripts\semossClone.bat"

echo 5. Checking Libraries
if %rInstall%==true (
    echo 5. -Installing R Libraries
    start .\scripts\R_Install.bat
)
if %pyenvInstall%==true (
    echo 5. -Setting Up Python Environment
    start /wait .\scripts\pyenv\pyenv_install.bat
    start /wait .\scripts\pyenv\pyenv_env.bat
    start /wait .\scripts\pyenv\py-scoop.bat
)
echo 6. Installing Python Libraries
start /wait .\scripts\pythonlibs.bat
echo 7. Setting up PNPM
start /wait .\scripts\pnpm.bat
echo 8. Building Project Path
call .\scripts\buildProjectPath.bat
echo 9. Importing Settings
call .\scripts\importSettings.bat
echo 10. Checking RDF_Map
call .\scripts\CheckRDF_Map.bat
echo 11. Updating social properties
call .\scripts\socialProperties_Update.bat
echo 12. Setting up Tomcat
call .\scripts\server.bat
echo 13. Editing WebXml
call .\scripts\WebXml.bat
echo 14. Creating Tomcat
call .\scripts\createTomcat.bat

echo 15. Checking Environment Variables
if %setEnvVariables%==true (
    call .\scripts\Environment_Variables.bat
)
echo 16. Maven Cleaning / Catalina
echo -- Cleaning...
start /MIN /wait "Maven Clean & Install" /d ".\scripts" "maven.bat" >> logs/maven.log 2>&1
-- Tomcat Catalina Setup...
call .\scripts\catalina.bat
echo -- Cleaning...
start /MIN /wait "Maven Clean & Install" /d ".\scripts" "maven.bat" >> logs/maven.log 2>&1

echo 17. Updating Semoss
call .\scripts\semoss_Update.bat
echo 18. Launching
call .\scripts\launch.bat
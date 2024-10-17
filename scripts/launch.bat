@echo off
Setlocal EnableDelayedExpansion

:: Launch eclipse
if %eclipseLoc% == null (
    echo Failed to open eclipse.
    echo The eclipse path variable, eclipseLoc, was not specified in the properties file.
    echo Enter the directory that contains the file eclipse.exe
    set /p "eclipseLoc=Path:"
)
start %eclipseLoc%\eclipse.exe -data %workspacePath%
echo =================================================
echo PLEASE START THE SERVER YOURSELF THROUGH ECLIPSE.
echo =================================================

:: Run Frontend
start cmd /k "cd /d %workspacePath%\%Tomcat_Version%\webapps\SemossWeb && pnpm run dev:client"

:: Wait for backend/frontend servers
timeout /t 180 /nobreak

:: Load up the SEMOSS web
start http://localhost:9090/SemossWeb/#!/

cd %dir%

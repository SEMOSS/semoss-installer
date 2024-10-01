@echo off
Setlocal EnableDelayedExpansion

:: Launch eclipse
if %eclipseLoc% neq null (
    start %eclipseLoc%\eclipse.exe -data %workspacePath%
    pause
) else (
    echo Failed to open eclipse.
    echo The eclipse path variable, eclipseLoc, was not specified in the properties file.
    echo Enter the directory that contains the file eclipse.exe
    set /p "eclipseLoc=path:"

    start !eclipseLoc!\eclipse.exe -data %workspacePath%
    pause
)

:: Start server
echo server starts successfully, but that isn't reflected in eclipse.

cd %workspacePath%\%Tomcat_Version%\bin
startup.bat

:: Timeout for the server starting 
timeout /t 60 /nobreak

:: Load up the SEMOSS web
start http://localhost:9090/SemossWeb/#!/

cd %dir%
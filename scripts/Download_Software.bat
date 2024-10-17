@echo off
Setlocal EnableDelayedExpansion

:: Downloads and unzips Tomcat
start "Tomcat Download" /MIN ".\downloadScripts\tomcat.bat"

:: Downloads files
if %softawareInstall%==true (

    if %eclipseFlag%==true (
        start "eclipse Download" /MIN ".\downloadScripts\eclipse.bat"
        set "eclipseLoc=%UserProfile%\Desktop\eclipse"
    )

    if %gitFlag%==true (
        start "Git Download" /MIN ".\downloadScripts\git.bat"
        @REM start %UserProfile%\Downloads\Git-2.46.1-64-bit.exe
        @REM pause
    )

    if %notepadFlag%==true (
        start "Notepad++ Download" /MIN ".\downloadScripts\notepad.bat"
        @REM start %UserProfile%\Downloads\npp.7.8.2.Installer.x64.exe
        @REM pause
    )

    if %nodeFlag%==true (
        start "Node Download" /MIN ".\downloadScripts\node.bat"
        @REM start %UserProfile%\Downloads\node-v18.16.0-x64.msi
        @REM pause
    )

    if %mavenFlag%==true (
        start "Maven Download" /MIN ".\downloadScripts\maven.bat"
    )
)

if %eclipseLoc% == null (
    echo Failed to open eclipse.
    echo The eclipse path variable, eclipseLoc, was not specified in the properties file.
    echo Enter the directory that contains the file eclipse.exe
    set /p "eclipseLoc=Path:"
)

start %eclipseLoc%\eclipse.exe -data %workspacePath%
timeout /t 60 /nobreak
echo Attempting to close Eclipse...
taskkill /IM eclipse.exe /F

exit

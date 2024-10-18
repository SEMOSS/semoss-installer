@echo off
Setlocal EnableDelayedExpansion

echo Checking Downloads
:: Downloads files
if %softawareInstall%==true (

    if %eclipseFlag%==true (
        echo -- Downloading Eclipse...
        start "eclipse Download" /MIN ".\downloadScripts\eclipse.bat"
        set "eclipseLoc=%UserProfile%\Desktop\eclipse"
    )

    if %gitFlag%==true (
        echo -- Downloading Git...
        start /wait "Git Download" /MIN ".\downloadScripts\git.bat"
    )

    if %notepadFlag%==true (
        echo -- Downloading Notepad++...
        start "Notepad++ Download" /MIN ".\downloadScripts\notepad.bat"
        @REM start %UserProfile%\Downloads\npp.7.8.2.Installer.x64.exe
        @REM pause
    )

    if %nodeFlag%==true (
        echo -- Downloading Node...
        start "Node Download" /MIN ".\downloadScripts\node.bat"
        @REM start %UserProfile%\Downloads\node-v18.16.0-x64.msi
        @REM pause
    )

    if %mavenFlag%==true (
        echo -- Downloading Maven...
        start "Maven Download" /MIN ".\downloadScripts\maven.bat"
    )

    if %jdkFlag%==true (
        echo -- Downloading JDK...
        call ".\downloadScripts\jdk.bat"
    )
)

:: Downloads and unzips Tomcat
echo -- Downloading Tomcat...
start /wait "Tomcat Download" /MIN ".\downloadScripts\tomcat.bat"

exit

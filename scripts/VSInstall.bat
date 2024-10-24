@echo off

:: Check if VS 2019 is already installed, then make sure they have all options installed
echo ==== SEE GITHUB README =================================
if not exist %VS_Path% (
    if vsFlag==true (
        echo Downloading Visual Studio 2019
        curl -o %UserProfile%\Downloads\vs_BuildTools.exe %VS_Download%
        start /MIN %UserProfile%\Downloads\vs_BuildTools.exe
    ) 
    @REM else (
    @REM     echo Visual Studio 2019 not found. Please change vsFlag to true in properties and try again.
    @REM     pause
    @REM )

) else (
    echo Visual Studio 2019 is already installed.
    echo If you have not set this up yet, follow the instructions below. If you have, continue on.
    start /MIN C:\"Program Files (x86)"\"Microsoft Visual Studio"\Installer\setup.exe
)
echo .
echo The Visual Studio Installer will now open. 
echo You should see a box for "Visual Studio Build Tools 2019", click the "Modify" button on the right side. 
echo Check the "Desktop development with C++" box. 
echo On the right side there will be an "Installation details" section. Make sure to select each checkbox under the Optional section. Download and install the selection
echo =======================================================

pause
exit

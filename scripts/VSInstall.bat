@echo off

:: Check if VS 2019 is already installed, then make sure they have all options installed
if not exist %VS_Path% (
    echo Downloading Visual Studio 2019

    curl -o %UserProfile%\Downloads\vs_BuildTools.exe %VS_Download%
    start %UserProfile%\Downloads\vs_BuildTools.exe

    echo .
    echo Check the "Desktop development with C++" box. 
    echo On the right side there will be an "Installation details" section. Make sure to select each checkbox under the Optional section. Download and install the selection
    
) else (
    echo Visual Studio 2019 is already installed.
    echo .
    echo The Visual Studio Installer will now open. 
    echo .
    echo You should see a box for "Visual Studio Build Tools 2019", click the "Modify" button on the right side. 
    echo Check the "Desktop development with C++" box. 
    echo On the right side there will be an "Installation details" section. Make sure to select each checkbox under the Optional section. Download and install the selection

    start C:\"Program Files (x86)"\"Microsoft Visual Studio"\Installer\setup.exe
)

exit

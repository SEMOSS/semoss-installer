@echo off
setlocal enabledelayedexpansion

:: Locate the file
set "filepath=%workspacePath%\Semoss\RDF_Map.prop"
set "folderpath=%workspacePath2%\\Semoss"

echo %folderpath%

:: Define the workspace path to be checked
set "default_workspace=C:\\workspace\\Semoss"

:: Create a temporary file to store the modified content
set "tempfile=%filepath%.tmp"

:: Read the file and check each path
(for /f "delims=" %%a in (%filepath%) do (
    set "line=%%a"

    if "!line:%default_workspace%=!" NEQ "!line!" (
        set "line=!line:%default_workspace%=%folderpath%!"
    )
    echo !line!
)) > "%tempfile%"

:: Replace the original file with the modified file
move /y "%tempfile%" "%filepath%"

endlocal
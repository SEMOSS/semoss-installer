@echo off
setlocal
set "zipFilePath=%UserProfile%\Downloads\eclipse-jee-2019-09-R-win32-x86_64.zip"
set "destinationFolder=%UserProfile%\Downloads"
set Eclipse_Download="https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/2019-09/R/eclipse-jee-2019-09-R-win32-x86_64.zip"


start /wait curl -L -o "%zipFilePath%" "%Eclipse_Download%"
if %errorlevel% neq 0 (
    echo Error: Failed to download the file.
    exit /b 1
)
echo Unzipping Eclipse ...
tar -xf "%zipFilePath%" -C "%UserProfile%\Desktop"

if %errorlevel% neq 0 (
    echo Error: Failed to unzip the file.
    exit /b 1
)
echo Eclipse has been unZipped to Desktop!

endlocal
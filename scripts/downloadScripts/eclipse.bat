@echo off
setlocal
set "zipFilePath=%UserProfile%\Downloads\eclipse-jee-2019-09-R-win32-x86_64.zip"
set "destinationFolder=%UserProfile%\Downloads"

curl -L -o "%zipFilePath%" "%Eclipse_Download%"
echo Unzipping Eclipse ...
tar -xf "%zipFilePath%" -C "%UserProfile%\Desktop"

if %errorlevel% neq 0 (
    echo Error: Failed to unzip the file.
    exit /b 1
)
echo Eclipse has been unZipped to Desktop!

endlocal
exit

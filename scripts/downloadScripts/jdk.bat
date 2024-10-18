@echo off
setlocal
set "zipPath=%dir%\zulu8.82.0.21-ca-jdk8.0.432-win_x64.zip"
set "destinationFolder=C:\Program Files\Java"
set javaFolder=C:\Program Files\Java

if not exist "%javaFolder%" (
    mkdir "%javaFolder%"
    echo Java folder created at %javaFolder%.
) else (
    echo Java folder already exists at %javaFolder%.
)

echo Unzipping jdk ...
::tar -xf  %dir%\zulu8.82.0.21-ca-jdk8.0.432-win_x64.zip -C "%destinationFolder%"
tar -xf "%zipPath%" -C "%destinationFolder%"

pause
endlocal
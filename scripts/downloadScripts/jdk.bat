@echo off
setlocal
set "zipPath=%UserProfile%\Downloads\zulu8.82.0.21-ca-jdk8.0.432-win_x64.zip"
set "JavaFolder=C:\Program Files\Java"

start /Wait https://cdn.azul.com/zulu/bin/zulu8.82.0.21-ca-jdk8.0.432-win_x64.zip
timeout /t 60 /nobreak


if not exist "%javaFolder%" (
    mkdir "%javaFolder%"
    echo Java folder created at %javaFolder%.
) else (
    echo Java folder already exists at %javaFolder%.
)

echo Unzipping jdk ...
tar -xf "%zipPath%" -C "%JavaFolder%"

pause
endlocal

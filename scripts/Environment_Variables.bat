:: Run in Administrator command prompt

@echo off
Setlocal EnableDelayedExpansion

:: Java Variables
FOR /D %%A IN ("C:\Program Files\Java\jdk-1.8*" ) DO (
        set Java_Home_Path=%%A
        goto :endLoop1
)
:endLoop1

if not defined Java_Home_Path (
    FOR /D %%A IN ("C:\Program Files\Java\jdk1.8.0*" ) DO (
        set Java_Home_Path=%%A
        goto :endLoop2
    )
)
:endLoop2

:: Maven Variables
FOR /D %%A IN ("%UserProfile%\Documents\%Maven_Version%" ) DO (
    set Maven_Home_Path=%%A
)

setx JAVA_HOME "%Java_Home_Path%" /m
setx MVN_HOME "%Maven_Home_Path%" /m

:: Define paths to be added as literal strings
set "paths[0]=%Java_Home_Path%\bin;"
set "paths[1]=%Maven_Home_Path%\bin;"

set "addPaths[0]=%%JAVA_HOME%%\bin;"
set "addPaths[1]=%%MVN_HOME%%\bin;"

:: Get the current system path
for /f "tokens=2*" %%A in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v Path') do set "current_path=%%B"
:: Loop through each path and add if not already present
for %%i in (0 1) do (
    set "new_path=!paths[%%i]!"
    set "add_path=!addPaths[%%i]!"
    echo !current_path! | findstr /i /c:"!new_path!" >nul
    if !errorlevel! equ 0 (
        echo --- The path "!new_path!" already exists in the system Path.
    ) else (
        echo --- Adding "!add_path!" to the system Path.
        set "last_char=!current_path:~-1!"
        if "!last_char!" equ ";" (
            set "current_path=!current_path!!add_path!"
        ) else (
            set "current_path=!current_path!;!add_path!"
        )
    )
)
:: Update the system path
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v Path /t REG_EXPAND_SZ /d "!current_path!" /f

endlocal
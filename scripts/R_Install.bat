@echo off
Setlocal EnableDelayedExpansion

SET R_Path=%UserProfile%\Documents\R\%R_Version%
SET Downloads=%UserProfile%\Downloads

:: Downloads R
if not exist %R_Path% mkdir %R_Path%
curl -o %Downloads%\R-4.2.3-win.exe %R_Download%
start %Downloads%\R-4.2.3-win.exe

pause

:: R Variables
if %setEnvVariables%==true (
    setx R_HOME "%UserProfile%\Documents\R\%R_Version%" /m
    if not exist "%UserProfile%\Documents\R\win-library\4.2" mkdir "%UserProfile%\Documents\R\win-library\4.2"
    setx R_LIBS "%UserProfile%\Documents\R\win-library\4.2" /m

    :: Define paths to be added as literal strings
    set "paths[0]=%UserProfile%\Documents\R\%R_Version%;"
    set "paths[1]=%UserProfile%\Documents\R\%R_Version%\bin\x64;"
    set "paths[2]=%UserProfile%\Documents\R\win-library\4.2;"
    set "paths[3]=%UserProfile%\Documents\R\win-library\4.2\rJava\jri\x64;"

    set "addPaths[0]=%%R_HOME%%\bin;"
    set "addPaths[1]=%%R_HOME%%\bin\x64;"
    set "addPaths[2]=%%R_LIBS%%;"
    set "addPaths[3]=%%R_LIBS%%\rJava\jri\x64;"

    :: Get the current system path
    for /f "tokens=2*" %%A in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v Path') do set "current_path=%%B"
    :: Loop through each path and add if not already present
    for %%i in (0 1 2 3) do (
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

)

:: Installs R Packages
"%UserProfile%\Documents\R\%R_Version%\bin\Rscript.exe" "%workspacePath%\Semoss\R\SemossConfigR\scripts\Packages.R"
exit
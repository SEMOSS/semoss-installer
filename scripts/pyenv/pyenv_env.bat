:: Run in Administrator command prompt

@echo off
Setlocal EnableDelayedExpansion

:: Define paths to be added as literal strings
set "paths[0]=C:\Users\%USERNAME%\.pyenv\pyenv-win\bin"
set "paths[1]=C:\Users\%USERNAME%\.pyenv\pyenv-win\shims"

:: Delete Paths from User Variables
for /f "tokens=2*" %%A in ('reg query "HKCU\Environment" /v Path') do set "current_path=%%B"
echo !current_path!
for %%i in (0 1) do (
    set "remove_path=!paths[%%i]!"
    set "updated_path="
    set "path_found=0"
    for %%P in ("!current_path:;=";"!") do (
        if /i "%%~P"=="!remove_path!" (
            set "path_found=1"
            echo --- The path "!remove_path!;" found and will be removed from the user Path.
        ) else (
            if defined updated_path (
                set "updated_path=!updated_path!;%%~P"
            ) else (
                set "updated_path=%%~P"
            )
        )
    )
    if !path_found! equ 1 (
        set "current_path=!updated_path!"
    )
)
echo !current_path!
reg add "HKCU\Environment" /v Path /t REG_EXPAND_SZ /d "!current_path!" /f

:: Add Paths to System Variables
for /f "tokens=2*" %%A in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v Path') do set "current_path=%%B"
for %%i in (0 1) do (
    set "new_path=!paths[%%i]!"
    set "path_found=0"
    for %%P in ("!current_path:;=";"!") do (
        if /i "%%~P"=="!new_path!" (
            set "path_found=1"
            echo --- The path "!new_path!;" already exists in the system Path.
        )
    )   
    if !path_found! equ 0 (
        echo --- Adding "!new_path!;" to the system Path.
        set "current_path=!new_path!;!current_path!"
    )
)

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v Path /t REG_EXPAND_SZ /d "!current_path!" /f

endlocal
exit

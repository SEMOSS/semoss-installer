@echo off
setlocal enabledelayedexpansion

:: Locate the file
set filepath=%workspacePath%\Semoss\social.properties

:: Set old ports and new port
set "old_ports=5353 5355 8080"
set "new_port=9090"


:: Define the string to be changed and its new value
set "googleVar=google_login false"
set "gitVar=github_login false"
set "enable_google=google_login true"
set "enable github=github_login true"
set "old_string=SemossWeb_AppUi"
set "new_string=SemossWeb"

:: Create a temporary file to store the modified content
set "tempfile=%filepath%.tmp"

:: Read the file
(for /f "delims=" %%a in (%filepath%) do (
    set "line=%%a"

    :: Iterate over each old port and replace it with the new port
    for %%p in (%old_ports%) do (
        set "line=!line:%%p=%new_port%!"
    )

    set "line=!line:%googleVar%=%enable_google%!"

    set "line=!line:%gitVar%=%enable github%!"

    set "line=!line:%old_string%=%new_string%!"
    
    echo !line!
)) > "%tempfile%"


:: Replace the original file with the modified file
move /y "%tempfile%" "%filepath%"

endlocal

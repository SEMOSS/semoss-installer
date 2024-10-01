@echo off
setlocal enabledelayedexpansion

:: Define the file paths
set "file=%workspacePath%\%Tomcat_Version%\conf\catalina.properties"
set "tempfile=%file%.tmp"

:: Create or clear the temporary file
> "%tempfile%" echo

:: Read the file line by line
for /f "usebackq delims=" %%a in ("%file%") do (
    set "line=%%a"
    echo Processing line: !line!

    :: Check if the line starts with the target string
    if "!line:tomcat.util.scan.StandardJarScanFilter.jarsToSkip==!" neq "!line!" (
        :: Replace the target string
        echo Found target string, replacing...
        set "line=tomcat.util.scan.StandardJarScanFilter.jarsToSkip=*.jar,\"
    )

    :: Write the (possibly modified) line to the temporary file
    >> "%tempfile%" echo(!line!)
)

:: Replace the original file with the temporary file
move /y "%tempfile%" "%file%"

endlocal
@echo off
setlocal enabledelayedexpansion

:: Define the input file path and a temporary output file path
set file="%workspacePath%\%Tomcat_Version%\conf\server.xml"
set tempFile="%file%.tmp"

:: Text to change to
set "lineText1=<Connector port="9090" protocol="HTTP/1.1""
set "lineText2=<Server port="8105" shutdown="SHUTDOWN">"

:: Loop through file to find phrase to replace
for /F "usebackq delims=" %%A in (%file%) do (
    set "line=%%A"
    if "!line:<Connector port="8080" protocol="HTTP/1.1">=!" neq "!line!" (
        echo !lineText1! >> %tempfile%
    ) else if "!line:<Server port="8005" shutdown="SHUTDOWN">=!" neq "!line!" (
        echo !lineText2! >> %tempfile%
    ) else (
        setlocal DISABLEDELAYEDEXPANSION
        echo %%A >> %tempfile%
        endlocal
    )
)

:: Replace original file with temp
move /Y %tempfile% %file%

endlocal
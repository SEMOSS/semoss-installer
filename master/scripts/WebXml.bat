@echo off
setlocal enabledelayedexpansion

set inputFile="%workspacePath%\Monolith\WebContent\WEB-INF\web.xml"
set tempFile=%inputFile%.tmp

:: Text to change to
set lineText1="<param-value>%workspacePath2%\\Semoss</param-value>"
set lineText2="<param-value>%workspacePath2%\\Semoss\\RDF_Map.prop</param-value>"

::loop through file to find phrase to replace
for /F "usebackq delims=" %%A in (%inputFile%) do (
    set "line=%%A"
    
    if  "!line:<param-value>C:\\workspace\\Semoss\\</param-value>=!" neq "!line!" (
        echo !lineText1! >> %tempFile%
    ) else (
        if  "!line:<param-value>C:/workspace/Semoss/RDF_Map.prop</param-value>=!" neq "!line!" (
            echo !lineText2! >> %tempFile%
        ) else (
            setlocal DISABLEDELAYEDEXPANSION
            echo %%A >> %tempFile%
            endlocal
        )
    )

)

::replace original file with temp
move /Y %tempFile% %inputFile%

endlocal
@echo off
setlocal enabledelayedexpansion

@REM Define the path to the RDF_Map.prop file
set PROP_FILE="%workspacePath%\Semoss\RDF_Map.prop"

::need the user to input their username 
@REM Define the Anaconda environment path based on the username
set ANACONDA_ENV=C:\Users\%username%\AppData\Local\anaconda3\envs\semoss

@REM Verify the existence of the Anaconda environment directory
if not exist "%ANACONDA_ENV%" (
    echo The Anaconda environment directory does not exist: %ANACONDA_ENV%
    echo Please verify the path and try again.
    endlocal
    pause
    exit /b 1
)

@REM Define the properties and values to update or add
set "PROPERTY1=NETTY_PYTHON false"
set "PROPERTY2=USE_PY_FILE false"
set "PROPERTY3=USE_PYTHON false"
set "PROPERTY4=NATIVE_PY_SERVER false"
set "PROPERTY5=LD_LIBRARY_PATH	{{INPUT_YOUR_PYTHON_HOME}}\\Lib\\site-packages\\jep"
set "PROPERTY6=PYTHONHOME"


set "VALUE1=NETTY_PYTHON true"
set "VALUE2=USE_PY_FILE	TRUE"
set "VALUE3=USE_PYTHON true"
set "VALUE4=NATIVE_PY_SERVER true"
set "VALUE5=LD_LIBRARY_PATH C:\\Users\\%username%\\AppData\\Local\\anaconda3\\envs\\semoss\\Lib\\site-packages\\jep"
set "VALUE6=PYTHONHOME %ANACONDA_ENV:\=\\%"

@REM Temporary file to store updated content
set "TEMP_FILE=%PROP_FILE%.tmp"

@REM Flags to check if the properties exist
set "FOUND1=0"
set "FOUND2=0"
set "FOUND3=0"
set "FOUND4=0"
set "FOUND5=0"
set "FOUND6=0"


@REM Read the file line by line
(for /f "delims=" %%i in ('type "%PROP_FILE%"') do (
    set line=%%i

    if "!line:~0,25!"=="%VALUE1%" (
    set FOUND1=2
    ) else if "!line:~0,25!"=="%PROPERTY1%" (
    set "line=!line:%PROPERTY1%=%VALUE1%!"
    set FOUND1=1
    )

    if "!line:~0,16!"=="%VALUE2%" (
    set FOUND2=2
    ) else if "!line:~0,17!"=="%PROPERTY2%" (
    set "line=!line:%PROPERTY2%=%VALUE2%!"
    set FOUND2=1
    )

    if "!line:~0,25!"=="%VALUE3%" (
    set FOUND3=2
    ) else if "!line:~0,25!"=="%PROPERTY3%" (
    set "line=!line:%PROPERTY3%=%VALUE3%!"
    set FOUND3=1
    )

    if "!line:~0,21!"=="%VALUE4%" (
    set FOUND4=2
    ) else if "!line:~0,22!"=="%PROPERTY4%" (
    set "line=!line:%PROPERTY4%=%VALUE4%!"
    set FOUND4=1
    )

    if "!line:~0,120!"=="%VALUE5%" (
    set FOUND5=2
    ) else if "!line:~0,120!"=="%PROPERTY5%" (
    set "line=!line:%PROPERTY5%=%VALUE5%!"
    set FOUND5=1
    )

    if "!line:~0,120!"=="%VALUE6%" (
    set FOUND6=2
    ) else if "!line:~0,120!"=="%PROPERTY6%" (
    set "line=!line:%PROPERTY6%=%VALUE6%!"
    set FOUND6=1
    )


    echo !line!
)) > "%TEMP_FILE%"

if %FOUND1% equ 0 (
    echo %VALUE1% >> "%TEMP_FILE%"
)

if %FOUND2% equ 0 (
    echo %VALUE2% >> "%TEMP_FILE%"
)

if %FOUND3% equ 0 (
    echo %VALUE3% >> "%TEMP_FILE%"
)

if %FOUND4% equ 0 (
    echo %VALUE4% >> "%TEMP_FILE%"
)

if %FOUND5% equ 0 (
    echo %VALUE5% >> "%TEMP_FILE%"
)

if %FOUND6% equ 0 (
    echo %VALUE6% >> "%TEMP_FILE%"
)

@REM Reset the flags
set "FOUND1=0"
set "FOUND2=0"
set "FOUND3=0"
set "FOUND4=0"
set "FOUND5=0"
set "FOUND6=0"


@REM Replace the original file with the updated file
move /y "%TEMP_FILE%" "%PROP_FILE%"

endlocal
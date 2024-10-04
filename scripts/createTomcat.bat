@echo off
setlocal enabledelayedexpansion

:: Locate the file
if %eclipseLoc% == null (
    set "eclipse=%UserProfile%\Desktop\eclipse"
) else (
    set "eclipse=%eclipseLoc%"
)

::-------------------------------------------------------------------------------

:: Check if the Eclipse executable exists
if not exist "%eclipse%\eclipse.exe" (
    echo Eclipse executable not found at %eclipse%
    endlocal
    pause
    exit /b 1
)

:: Check if the workspace directory exists
if not exist "%workspacePath%" (
    echo Workspace directory not found at %workspacePath%
    endlocal
    pause
    exit /b 1
)

::------------------- Open a workspace path in eclipse to populate the .metadata -------------------
start %eclipse%\eclipse.exe -data %workspacePath%
timeout /t 60 /nobreak

:: Attempt to close Eclipse using taskkill
echo Attempting to close Eclipse...
taskkill /IM eclipse.exe /F

:: Continue with the rest of the batch script
echo Eclipse has been closed. Continuing with the script...

::------------------- CREATE FOLDER C:\workspace2\.metadata\.plugins\org.eclipse.wst.server.core -------------------
set server_metaPath=%workspacePath%\.metadata\.plugins\org.eclipse.wst.server.core
if not exist "%server_metaPath%" (
    mkdir "%server_metaPath%"
    echo Subfolder created at %server_metaPath%.
) else (
    echo Subfolder already exists at %server_metaPath%.
)

::------------------- CREATE FOLDER C:\workspace2\.metadata\.plugins\org.eclipse.wst.server.discovery -------------------
set server_metaPath2=%workspacePath%\.metadata\.plugins\org.eclipse.wst.server.discovery
if not exist "%server_metaPath2%" (
    mkdir "%server_metaPath2%"
    echo Subfolder created at %server_metaPath2%.
) else (
    echo Subfolder already exists at %server_metaPath2%.
)

::------------------- CREATE FILE "servers.xml" -------------------
set xmlFile=%workspacePath%\.metadata\.plugins\org.eclipse.wst.server.core\servers.xml
:: Create the XML file and write the content
(
    echo ^<?xml version="1.0" encoding="UTF-8" standalone="no"?^>
    echo ^<servers^>
    echo ^<server auto-publish-setting="1" auto-publish-time="1" configuration-id="/Servers/Tomcat v9.0 Server at localhost-config" hostname="localhost" id="Tomcat v9.0 Server at localhost" name="Tomcat v9.0 Server at localhost" runtime-id="Apache Tomcat v9.0" saveSeparateContextFiles="false" server-type="org.eclipse.jst.server.tomcat.90" server-type-id="org.eclipse.jst.server.tomcat.90" start-timeout="300" stop-timeout="15" testEnvironment="false" timestamp="2"^>
    echo ^<list key="modules" value0="Monolith::org.eclipse.jst.jee.server:Monolith::jst.web::4.0"/^>
    echo ^</server^>
    echo ^</servers^>
) > "%xmlFile%"
:: Check if the file was created successfully
if exist "%xmlFile%" (
    echo Server XML file created successfully.
) else (
    echo Failed to create the Server XML file.
    endlocal
    pause
    exit /b 1
)
::------------------- CREATE FOLDER "Server" -------------------
set serversFolder=%workspacePath%\Servers
if not exist "%serversFolder%" (
    mkdir "%serversFolder%"
    echo Servers folder created at %serversFolder%.
) else (
    echo Servers folder already exists at %serversFolder%.
)
::------------------- CREATE FILE ".project" -------------------
set project_file=%workspacePath%\Servers\.project
:: Create the XML file and write the content
(
    echo ^<?xml version="1.0" encoding="UTF-8" standalone="no"?^>
    echo ^<projectDescription^>
    echo    ^<name^>Servers^</name^>
    echo    ^<comment^>^</comment^>
    echo    ^<projects^>
    echo    ^</projects^>
    echo    ^<buildSpec^>
    echo    ^</buildSpec^>
    echo    ^<natures^>
    echo    ^</natures^>
    echo ^</projectDescription^>
) > "%project_file%"

:: Check if the file was created successfully
if exist "%project_file%" (
    echo project file created successfully.
) else (
    echo Failed to create the project file.
)

::------------------- CREATE SUBFOLDER "Tomcat v9.0 Server at localhost-config" -------------------
set subfolderPath=%workspacePath%\Servers\Tomcat v9.0 Server at localhost-config
if not exist "%subfolderPath%" (
    mkdir "%subfolderPath%"
    echo Subfolder created at %subfolderPath%.
) else (
    echo Subfolder already exists at %subfolderPath%.
)

:: Complete slide 11
:: Check if the XML file exists
if not exist "%xmlFile%" (
    echo XML file not found at %xmlFile%
    endlocal
    pause
    exit /b 1
)

::------------------- CREATE .PROJECT FOLDER IN METADATA -------------------
set projectfolder_Path=%workspacePath%\.metadata\.plugins\org.eclipse.core.resources\.projects
if not exist "%projectfolder_Path%" (
    mkdir "%projectfolder_Path%"
    echo Subfolder created at %projectfolder_Path%.
) else (
    echo Subfolder already exists at %projectfolder_Path%.
)
::------------------- CREATE server SUBFOLDER IN METADATA -------------------
set server_subfolder_Path=%workspacePath%\.metadata\.plugins\org.eclipse.core.resources\.projects\Servers
if not exist "%server_subfolder_Path%" (
    mkdir "%server_subfolder_Path%"
    echo Subfolder created at %server_subfolder_Path%.
) else (
    echo Subfolder already exists at %server_subfolder_Path%.
)
::------------------- CREATE Monolith SUBFOLDER IN METADATA -------------------
set monolith_subfolder_Path=%workspacePath%\.metadata\.plugins\org.eclipse.core.resources\.projects\Monolith
if not exist "%monolith_subfolder_Path%" (
    mkdir "%monolith_subfolder_Path%"
    echo Subfolder created at %monolith_subfolder_Path%.
) else (
    echo Subfolder already exists at %monolith_subfolder_Path%.
)
::------------------- CREATE Semoss SUBFOLDER IN METADATA -------------------
set semoss_subfolder_Path=%workspacePath%\.metadata\.plugins\org.eclipse.core.resources\.projects\Semoss
if not exist "%semoss_subfolder_Path%" (
    mkdir "%semoss_subfolder_Path%"
    echo Subfolder created at %semoss_subfolder_Path%.
) else (
    echo Subfolder already exists at %semoss_subfolder_Path%.
)
::------------------- COPY 37.tree file IN METADATA -------------------
set copy_root=%dir%\scripts\BuildFilesDirectory\37.tree
set rootfolder_Path=%workspacePath%\.metadata\.plugins\org.eclipse.core.resources\.root
if exist "%projectfolder_Path%" (
    copy "%copy_root%" "%rootfolder_Path%" /Y
    echo 37.tree file copied at %rootfolder_Path%.
) else (
    echo .root folder doesn't exist
)

::------------------- COPY org.eclipse.core.resources file IN METADATA -------------------
set copy_safetable=%dir%\scripts\BuildFilesDirectory\org.eclipse.core.resources
set safetable_Path=%workspacePath%\.metadata\.plugins\org.eclipse.core.resources\.safetable
if exist "%safetable_Path%" (
    copy "%copy_safetable%" "%safetable_Path%" /Y
    echo file copied at %safetable_Path%.
) else (
    echo .safetable folder doesn't exist
)

::------------------- CREATE org.eclipse.emf.common.ui FOLDER -------------------
set newFolder_Path=%workspacePath%\.metadata\.plugins\org.eclipse.emf.common.ui
if not exist "%newFolder_Path%" (
    mkdir "%newFolder_Path%"
    echo Subfolder created at %newFolder_Path%.
) else (
    echo Subfolder already exists at %newFolder_Path%.
)
::------------------- SET AUTOMATIC ECLIPSE REFRESH -------------------
set eclipse_refresh=%workspacePath%\.metadata\.plugins\org.eclipse.core.runtime\.settings\org.eclipse.core.resources.prefs
set "lineToAdd=refresh.enabled=true"
set "eclipse_temp=%eclipse_refresh%.tmp"

:: Initialize line counter
set /a lineCounter=0
set "lineExists=false"

:: Read the file and check if the line already exists
for /f "delims=" %%i in (%eclipse_refresh%) do (
    if "%%i"=="%lineToAdd%" (
        set "lineExists=true"
    )
)
:: If the line does not exist, insert it at line 2
if "%lineExists%"=="false" (
    (
        echo eclipse.preferences.version=1
        echo refresh.enabled=true
        echo version=1
    ) > "%eclipse_temp%"

    :: Replace the original file with the temporary file
    move /y "%eclipse_temp%" "%eclipse_refresh%"
)

::------------------- CREATE FILE "org.eclipse.wst.server.core.prefs"-------------------!!!!NEED TO FIX ITS NOT FINDING FILE
set server_settings=%workspacePath%\.metadata\.plugins\org.eclipse.core.runtime\.settings\org.eclipse.wst.server.core.prefs

:: Check if the file exists before attempting to delete it
if exist "%server_settings%" (
    :: Delete the file
    del "%server_settings%"

    :: Check if the file was deleted successfully
    if not exist "%server_settings%" (
        echo File deleted successfully.
    ) else (
        echo Failed to delete the file.
    )
) else (
    echo File does not exist: %server_settings%

        (
            echo eclipse.preferences.version=1
            echo module-start-timeout=300000
            echo runtimes=^<?xml version\="1.0" encoding\="UTF-8" standalone\="no"?^>\r\n^<runtimes^>\r\n  ^<runtime id\="Apache Tomcat v9.0" location\="C:/%workspaceName%/%Tomcat_Version%" name\="Apache Tomcat v9.0" runtime-type-id\="org.eclipse.jst.server.tomcat.runtime.90" timestamp\="0"/^>\r\n^</runtimes^>\r\n
        ) > "%server_settings%"
    echo ... org.eclipse.wst.server.discovery.prefs file created
)

::------------------- CREATE FILE "org.eclipse.wst.server.discovery.prefs"-------------------
set server_settings2=%workspacePath%\.metadata\.plugins\org.eclipse.core.runtime\.settings\org.eclipse.wst.server.discovery.prefs
(
    echo cache-lastUpdatedDate=Fri Sep 27 2024 13\:14\:02 EDT
    echo eclipse.preferences.version=1
) > "%server_settings2%"

:: Check if the file was created successfully
if exist "%server_settings2%" (
    echo org.eclipse.wst.server.discovery.prefs created successfully.
) else (
    echo Failed to create org.eclipse.wst.server.discovery.prefs.
    endlocal
    pause
    exit /b 1
)
::------------------- COPY FILES from catalina folder in apache tomcat folder-------------------
set "catalina_policy=%workspacePath%\%Tomcat_Version%\conf\catalina.policy"
set "catalina_properties=%workspacePath%\%Tomcat_Version%\conf\catalina.properties"
set "context_file=%workspacePath%\%Tomcat_Version%\conf\context.xml"
set "server_file=%dir%\scripts\BuildFilesDirectory\server.xml"
set "tomcat_usersFile=%workspacePath%\%Tomcat_Version%\conf\tomcat-users.xml"
set "web_file=%workspacePath%\%Tomcat_Version%\conf\web.xml"

:: Copy the catalina.policy to the destination folder
copy "%catalina_policy%" "%subfolderPath%"
:: Check if the copy operation was successful
if %errorlevel% equ 0 (
    echo catalina.policy copied successfully
) else (
    echo Failed to copy catalina.policy
)

:: Copy catalina_properties to the destination folder
copy "%catalina_properties%" "%subfolderPath%"
:: Check if the copy operation was successful
if %errorlevel% equ 0 (
    echo catalina.properties copied successfully
) else (
    echo Failed to copy catalina.properties
)

:: Copy context_file to the destination folder
copy "%context_file%" "%subfolderPath%"

:: Check if the copy operation was successful
if %errorlevel% equ 0 (
    echo context.xml copied successfully
) else (
    echo Failed to copy context.xml
)

:: Copy server_file to the destination folder
copy "%server_file%" "%subfolderPath%"
:: Check if the copy operation was successful
if %errorlevel% equ 0 (
    echo server.xml copied successfully
) else (
    echo Failed to copy server.xml
)

:: Copy tomcat_usersFile to the destination folder
copy "%tomcat_usersFile%" "%subfolderPath%"
:: Check if the copy operation was successful
if %errorlevel% equ 0 (
    echo tomcat-users copied successfully
) else (
    echo Failed to copy tomcat-users
)

:: Copy web_file to the destination folder
copy "%web_file%" "%subfolderPath%"
:: Check if the copy operation was successful
if %errorlevel% equ 0 (
    echo web.xml copied successfully
) else (
    echo Failed to copy web.xml
)

endlocal

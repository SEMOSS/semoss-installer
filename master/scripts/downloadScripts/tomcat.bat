@echo off

curl -o %UserProfile%\Downloads\apache-tomcat-9.0.95-windows-x64.zip %Tomcat_Download%
tar -zxvf %UserProfile%\Downloads\apache-tomcat-9.0.95-windows-x64.zip --directory "%workspacePath%"

:: Ensures a apache-tomcat folder exist
if not exist "%workspacePath%\%Tomcat_Version%" (
    :: DO SOMETHING HERE
    echo Apache-tomcat folder does not exist at %workspacePath%\%Tomcat_Version%
    pause
)

exit
@echo off

Tomcat_Version=apache-tomcat-9.0.96

curl -o %UserProfile%\Downloads\%Tomcat_Version%-windows-x64.zip %Tomcat_Download%
tar -zxvf %UserProfile%\Downloads\%Tomcat_Version%-windows-x64.zip --directory "%workspacePath%"

:: Ensures a apache-tomcat folder exist
if not exist "%workspacePath%\%Tomcat_Version%" (
    :: DO SOMETHING HERE
    echo Apache-tomcat folder does not exist at %workspacePath%\%Tomcat_Version%
    echo Please check versions and try again.
    pause
)

exit
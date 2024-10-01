@echo off

git clone https://github.com/SEMOSS/semoss-ui.git
ren semoss-ui SemossWeb
cd SemossWeb
git checkout dev

set filepath="%workspacePath%\%Tomcat_Version%\webapps\SemossWeb\.env.local"
echo ENDPOINT=../../.. > %filepath%
echo MODULE=/Monolith >> %filepath%
echo. >> %filepath%
echo THEME_TITLE=SEMOSS >> %filepath%
echo THEME_FAVICON=./src/assets/favicon.svg >> %filepath%
echo. >> %filepath%
echo NODE_ENV=development >> %filepath%

exit
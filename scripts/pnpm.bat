@echo off
Setlocal EnableDelayedExpansion

cd "%workspacePath%"\%Tomcat_Version%\webapps\SemossWeb
call npm install -g pnpm
call pnpm install
call pnpm run build

cd .\packages\ui
call pnpm run build

cd %dir%
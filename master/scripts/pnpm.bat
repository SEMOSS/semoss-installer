@echo off
Setlocal EnableDelayedExpansion

cd "%workspacePath%"\%Tomcat_Version%\webapps\SemossWeb

@REM if %npmFlag%==true (
    npm install -g pnpm
@REM )
@REM if %pnpmFlag%==true (
    pnpm install
@REM )

pnpm run build

cd packages\ui
pnpm run build

cd %dir%
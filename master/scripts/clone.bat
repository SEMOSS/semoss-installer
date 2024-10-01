@echo off
Setlocal EnableDelayedExpansion

start "Semoss Clone" /d "%workspacePath%" /MIN "%dir%\scripts\cloneScripts\semossClone.bat"
start "Monolith Clone" /d "%workspacePath%" /MIN "%dir%\scripts\cloneScripts\monoClone.bat"

:: POSSIBLE INFINITE LOOP
:: May want to change
:check-again
if not exist "%workspacePath%\%Tomcat_Version%\webapps" (
    goto check-again
) else (
    start "SemossWeb Clone" /d "%workspacePath%\%Tomcat_Version%\webapps" /MIN /W "%dir%\scripts\cloneScripts\semossWebClone.bat"
)
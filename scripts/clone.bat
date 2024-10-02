@echo off
Setlocal EnableDelayedExpansion

start "Monolith Clone" /d "%workspacePath%" /MIN "%dir%\scripts\cloneScripts\monoClone.bat"
start "SemossWeb Clone" /d "%workspacePath%\%Tomcat_Version%\webapps" /MIN "%dir%\scripts\cloneScripts\semossWebClone.bat"
start "Semoss Clone" /d "%workspacePath%" /MIN /W "%dir%\scripts\cloneScripts\semossClone.bat"
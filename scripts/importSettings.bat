@echo off

::Copy into Monolith
mkdir %workspacePath%\Monolith\.settings
robocopy "%cd%\scripts\settingsDirs\.settingsMonolith" "%workspacePath%\Monolith\.settings" /mir

::Copy into Semoss
mkdir %workspacePath%\Semoss\.settings
robocopy "%cd%\scripts\settingsDirs\.settingsSemoss" "%workspacePath%\Semoss\.settings" /mir
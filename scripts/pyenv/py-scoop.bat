@echo off
Setlocal EnableDelayedExpansion

@REM :: Check if Scoop is installed
@REM start powershell -Command "if (!(Get-Command scoop -ErrorAction SilentlyContinue)) { Write-Output 'Scoop is not installed. Installing Scoop...'; Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser; Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression } else { Write-Output 'Scoop is already installed.' }"

@REM :: Check if pipx is installed
@REM start powershell -Command "if (!(Get-Command pipx -ErrorAction SilentlyContinue)) { Write-Output 'pipx is not installed. Installing pipx...'; scoop install pipx; pipx ensurepath } else { Write-Output 'pipx is already installed.' }"

@REM :: Verify installations
@REM start powershell -Command "scoop --version; pipx --version"

:: Step 1: Open a new PowerShell terminal and run the commands to install Scoop
start powershell -NoExit -Command "& {Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser;Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression;exit;}"

:: Wait for the PowerShell commands to complete
timeout /t 5

:: Step 2: Close the PowerShell terminal and open a new one to run 'scoop --version'
start powershell -NoExit -Command "& {scoop --version;exit;}"

:: Wait for the PowerShell command to complete
timeout /t 10

:: Step 3: Install pipx with scoop
start powershell -NoExit -Command "& {scoop install pipx;exit;}"

:: Wait for the PowerShell command to complete
timeout /t 5

:: Step 4: Add pipx to your path
start powershell -NoExit -Command "& {pipx ensurepath;exit;}"

endlocal

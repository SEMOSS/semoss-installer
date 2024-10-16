@echo off

:: Check if Scoop is installed
start powershell -Command "if (!(Get-Command scoop -ErrorAction SilentlyContinue)) { Write-Output 'Scoop is not installed. Installing Scoop...'; Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser; Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression } else { Write-Output 'Scoop is already installed.' }"

:: Check if pipx is installed
start powershell -Command "if (!(Get-Command pipx -ErrorAction SilentlyContinue)) { Write-Output 'pipx is not installed. Installing pipx...'; scoop install pipx; pipx ensurepath } else { Write-Output 'pipx is already installed.' }"

:: Verify installations
start powershell -Command "scoop --version; pipx --version"
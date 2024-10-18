@echo off
Setlocal EnableDelayedExpansion

echo -- Installing Git...
set "destinationPath=%UserProfile%\Downloads\Git-2.46.1-64-bit.exe"
echo !destinationPath!
curl -L -o "!destinationPath!" %Git_Download%
"!destinationPath!" /VERYSILENT /NORESTART

endlocal
exit
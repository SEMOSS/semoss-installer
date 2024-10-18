@echo off
Setlocal EnableDelayedExpansion

set "destinationPath=%UserProfile%\Downloads\Git-2.46.1-64-bit.exe"
curl -L -o "!destinationPath!" %Git_Download%
"!destinationPath!" /VERYSILENT /NORESTART

endlocal
exit
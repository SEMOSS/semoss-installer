@echo off
Setlocal EnableDelayedExpansion

curl -o %UserProfile%\Downloads\node-v18.16.0-x64.msi %Node_Download%
msiexec /i "%UserProfile%\Downloads\node-v18.16.0-x64.msi" /qn /norestart

endlocal
exit
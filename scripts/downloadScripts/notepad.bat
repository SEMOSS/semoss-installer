@echo off

set "destinationFolder=%UserProfile%\Downloads\npp.7.8.2.Installer.x64.exe"
curl -L -o "%destinationFolder%" "%Notepad_Download%"

exit
@echo off

curl -o %UserProfile%\Downloads\eclipse-jee-2019-09-R-win32-x86_64.zip %Eclipse_Download%
tar -zxvf %UserProfile%\Downloads\eclipse-jee-2019-09-R-win32-x86_64.zip --directory %UserProfile%\Desktop

exit
@echo off

curl -o %UserProfile%\Downloads\apache-maven-3.9.9-bin.zip %Maven_Download%
tar -zxvf %UserProfile%\Downloads\apache-maven-3.9.9-bin.zip --directory %UserProfile%\Documents

exit
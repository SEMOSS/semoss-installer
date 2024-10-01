@echo off

@REM Set up the Developer Command Prompt environment for 64-bit
call "C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\VC\Auxiliary\Build\vcvars64.bat"

@REM Install Python packages
echo Installing Python packages
call pip install pandas
call pip install fuzzywuzzy
call pip install python-Levenshtein
call pip install --upgrade -r https://raw.githubusercontent.com/SEMOSS/docker-r-python/R4.2.1-debian11/semoss_requirements.txt
call pip install --upgrade -r https://raw.githubusercontent.com/SEMOSS/docker-r-python/cuda12-R4.2.1/cfgai_requirements.txt

@REM Exit the Developer Command Prompt

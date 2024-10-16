@echo off

start cmd /c "cd %UserProfile% & pipx install virtualenv"

start cmd /c "cd %workspacePath%\Semoss & virtualenv venv & venv\Scripts\activate & call pip install pandas & pip install fuzzywuzzy & pip install python-Levenshtein & pip install -r https://raw.githubusercontent.com/SEMOSS/docker-r-python/dev-setup/dev-cpu/pinned-requirements.txt"

::if your PC has a GPU, replace the last command with the one below:
::pip install -r https://raw.githubusercontent.com/SEMOSS/docker-r-python/dev-setup/dev-gpu/pinned-requirements.txt"

@REM Exit 

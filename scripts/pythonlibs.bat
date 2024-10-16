@echo off

start /wait cmd /c "cd %UserProfile% & pipx install virtualenv"

start /wait cmd /c "cd %workspacePath%\Semoss & virtualenv venv & venv\Scripts\activate & call pip install -r https://raw.githubusercontent.com/SEMOSS/docker-r-python/dev-setup/dev-cpu/pinned-requirements.txt"

::if your PC has a GPU, replace the last command with the one below:
::pip install -r https://raw.githubusercontent.com/SEMOSS/docker-r-python/dev-setup/dev-gpu/pinned-requirements.txt"

@REM Exit 

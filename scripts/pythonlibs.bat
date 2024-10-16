@echo off

start /wait cmd /c "cd %UserProfile% & pipx install virtualenv"

if %haveGPU%==true (
    start /wait cmd /c "cd %workspacePath%\Semoss & virtualenv venv & venv\Scripts\activate & call pip install -r https://raw.githubusercontent.com/SEMOSS/docker-r-python/dev-setup/dev-gpu/pinned-requirements.txt"
) else (
    echo false
    start /wait cmd /c "cd %workspacePath%\Semoss & virtualenv venv & venv\Scripts\activate & call pip install -r https://raw.githubusercontent.com/SEMOSS/docker-r-python/dev-setup/dev-cpu/pinned-requirements.txt"
)

@REM Exit 

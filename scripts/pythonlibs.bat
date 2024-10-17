@echo off

start /wait cmd /c "cd %UserProfile% & pipx install virtualenv"

@REM if %haveGPU%==true (
@REM     start /wait cmd /c "cd %workspacePath%\Semoss & virtualenv venv & venv\Scripts\activate & call pip install -r https://raw.githubusercontent.com/SEMOSS/docker-r-python/dev-setup/dev-gpu/pinned-requirements.txt"
@REM ) else (
@REM     start /wait cmd /c "cd %workspacePath%\Semoss & virtualenv venv & venv\Scripts\activate & call pip install -r https://raw.githubusercontent.com/SEMOSS/docker-r-python/dev-setup/dev-cpu/pinned-requirements.txt"
@REM )

if %haveGPU%==true (
    cd %workspacePath%\Semoss
    virtualenv venv
    call venv\Scripts\activate
    call pip install -r https://raw.githubusercontent.com/SEMOSS/docker-r-python/dev-setup/dev-gpu/pinned-requirements.txt
) else (
    cd %workspacePath%\Semoss
    virtualenv venv
    call venv\Scripts\activate
    call pip install -r https://raw.githubusercontent.com/SEMOSS/docker-r-python/dev-setup/dev-cpu/pinned-requirements.txt
)

exit 

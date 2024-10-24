@echo off

::initial pyenv-win install
start /wait powershell -Command "Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser; Invoke-WebRequest -UseBasicParsing -Uri 'https://raw.githubusercontent.com/pyenv-win/pyenv-win/master/pyenv-win/install-pyenv-win.ps1' -OutFile './install-pyenv-win.ps1'; &'./install-pyenv-win.ps1'"
::not exiting powershell to see what the output versions are, can change that in the future
start powershell -Command "pyenv --version; pyenv install %PYTHON_VERSION%; pyenv global %PYTHON_VERSION%; pyenv version"

endlocal
exit
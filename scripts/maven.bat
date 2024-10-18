@echo off

start /wait /MIN "Semoss Clean & Install" cmd.exe /c "cd %workspacePath%\Semoss & mvn clean install -U -DskipTests=true"
start /wait /MIN "Monolith Clean & Install" cmd.exe /c "cd %workspacePath%\Monolith & mvn clean install -U -DskipTests=true"

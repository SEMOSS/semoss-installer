@echo off
setlocal enabledelayedexpansion


::------------------- COPY .classpath into Semoss -------------------
set copy_classpathSemoss=%dir%\scripts\BuildFilesDirectory\Semoss\.classpath
set S_folder_Path=%workspacePath%\Semoss

if exist "%S_folder_Path%" (
    copy "%copy_classpathSemoss%" "%S_folder_Path%" /Y
    echo Semoss Classpath copied at %S_folder_Path%.
) else (
    echo Semoss folder doesn't exist
)

::------------------- COPY .project into Semoss -------------------
set copy_SemossProject=%dir%\scripts\BuildFilesDirectory\Semoss\.project

if exist "%S_folder_Path%" (
    copy "%copy_SemossProject%" "%S_folder_Path%" /Y
    echo Semoss Classpath copied at %S_folder_Path%.
) else (
    echo Semoss folder doesn't exist
)

::------------------- COPY .classpath into Monolith -------------------
set copy_classpathMonolith=%dir%\scripts\BuildFilesDirectory\Monolith\.classpath
set M_folder_Path=%workspacePath%\Monolith

if exist "%M_folder_Path%" (
    copy "%copy_classpathMonolith%" "%M_folder_Path%" /Y
    echo MonolithClasspath copied at %M_folder_Path%.
) else (
    echo Monolith folder doesn't exist
)

::------------------- COPY .project into Monolith -------------------
set copy_MonoProject=%dir%\scripts\BuildFilesDirectory\Semoss\.project

if exist "%M_folder_Path%" (
    copy "%copy_MonoProject%" "%M_folder_Path%" /Y
    echo Semoss Classpath copied at %M_folder_Path%.
) else (
    echo Semoss folder doesn't exist
)

endlocal
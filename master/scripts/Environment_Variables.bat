:: Run in Administrator command prompt

@echo off
Setlocal EnableDelayedExpansion

:: Java Variables
FOR /D %%A IN ("C:\Program Files\Java\jdk-1.8*" ) DO (
        set Java_Home_Path=%%A
        goto :endLoop1
)
:endLoop1

if not defined Java_Home_Path (
    FOR /D %%A IN ("C:\Program Files\Java\jdk1.8.0*" ) DO (
        set Java_Home_Path=%%A
        goto :endLoop2
    )
)
:endLoop2

setx JAVA_HOME "%Java_Home_Path%" /m

:: Maven Variables
FOR /D %%A IN ("%UserProfile%\Documents\%Maven_Version%" ) DO (
    set Maven_Home_Path=%%A
)
setx MVN_HOME "%Maven_Home_Path%" /m
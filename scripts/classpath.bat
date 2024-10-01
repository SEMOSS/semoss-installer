@echo off

@REM Navigate to the desired directory
cd %workspacePath%\Monolith

@REM Create the .classpath file and write the XML content
echo ^<?xml version="1.0" encoding="UTF-8"?^> > .classpath
echo ^<classpath^> >> .classpath
echo     ^<classpathentry kind="con" path="org.eclipse.jdt.launching.JRE_CONTAINER/org.eclipse.jdt.internal.debug.ui.launcher.StandardVMType/JavaSE-1.8"^> >> .classpath
echo         ^<attributes^> >> .classpath
echo             ^<attribute name="maven.pomderived" value="true"/^> >> .classpath
echo         ^</attributes^> >> .classpath
echo     ^</classpathentry^> >> .classpath
echo     ^<classpathentry kind="src" output="target/classes" path="src"^> >> .classpath
echo         ^<attributes^> >> .classpath
echo             ^<attribute name="optional" value="true"/^> >> .classpath
echo             ^<attribute name="maven.pomderived" value="true"/^> >> .classpath
echo         ^</attributes^> >> .classpath
echo     ^</classpathentry^> >> .classpath
echo     ^<classpathentry kind="src" path="Semosssrc"/^> >> .classpath
echo     ^<classpathentry kind="con" path="org.eclipse.m2e.MAVEN2_CLASSPATH_CONTAINER"^> >> .classpath
echo         ^<attributes^> >> .classpath
echo             ^<attribute name="maven.pomderived" value="true"/^> >> .classpath
echo             ^<attribute name="org.eclipse.jst.component.dependency" value="/WEB-INF/lib"/^> >> .classpath
echo         ^</attributes^> >> .classpath
echo     ^</classpathentry^> >> .classpath
echo     ^<classpathentry kind="con" path="org.eclipse.jst.server.core.container/org.eclipse.jst.server.tomcat.runtimeTarget/Apache Tomcat v9.0"/^> >> .classpath
echo     ^<classpathentry kind="output" path="target/classes"/^> >> .classpath
echo ^</classpath^> >> .classpath

@REM Confirm the .classpath file has been created
echo .classpath file created successfully.

set "temp=%workspacePath%"
set "temp=!temp:\=/!"

@REM Create the .project file and write the XML content
echo ^<?xml version="1.0" encoding="UTF-8"?^> > .project
echo ^<projectDescription^> >> .project
echo    ^<name^>Monolith^</name^> >> .project
echo    ^<comment^>^</comment^> >> .project
echo    ^<projects^>^</projects^> >> .project
echo    ^<buildSpec^> >> .project
echo        ^<buildCommand^> >> .project
echo            ^<name^>org.eclipse.jdt.core.javabuilder^</name^> >> .project
echo            ^<arguments^>^</arguments^> >> .project
echo        ^</buildCommand^> >> .project
echo        ^<buildCommand^> >> .project
echo            ^<name^>org.eclipse.wst.common.project.facet.core.builder^</name^> >> .project
echo            ^<arguments^>^</arguments^> >> .project
echo        ^</buildCommand^> >> .project
echo        ^<buildCommand^> >> .project
echo            ^<name^>org.eclipse.wst.validation.validationbuilder^</name^> >> .project
echo            ^<arguments^>^</arguments^> >> .project
echo        ^</buildCommand^> >> .project
echo        ^<buildCommand^> >> .project
echo            ^<name^>org.eclipse.m2e.core.maven2Builder^</name^> >> .project
echo            ^<arguments^>^</arguments^> >> .project
echo        ^</buildCommand^> >> .project
echo    ^</buildSpec^> >> .project
echo    ^<natures^> >> .project
echo        ^<nature^>org.eclipse.jem.workbench.JavaEMFNature^</nature^> >> .project
echo        ^<nature^>org.eclipse.wst.common.modulecore.ModuleCoreNature^</nature^> >> .project
echo        ^<nature^>org.eclipse.jdt.core.javanature^</nature^> >> .project
echo        ^<nature^>org.eclipse.m2e.core.maven2Nature^</nature^> >> .project
echo        ^<nature^>org.eclipse.wst.common.project.facet.core.nature^</nature^> >> .project
echo        ^<nature^>org.eclipse.wst.jsdt.core.jsNature^</nature^> >> .project
echo    ^</natures^> >> .project
echo    ^<linkedResources^> >> .project
echo        ^<link^> >> .project
echo            ^<name^>Semosssrc^</name^> >> .project
echo            ^<type^>2^</type^> >> .project
echo            ^<location^>%temp%/Semoss/src^</location^> >> .project
echo        ^</link^> >> .project
echo    ^</linkedResources^> >> .project
echo ^</projectDescription^> >> .project

@REM Confirm the .project file has been created
echo .project file created successfully.

cd %dir%

endlocal
@echo off

@REM Navigate to the desired directory
cd %workspacePath%\Semoss

@REM Create the .classpath file and write the XML content
(
echo ^<?xml version="1.0" encoding="UTF-8"?^> 
echo ^<classpath^> 
echo     ^<classpathentry including="**/*.java" kind="src" output="target/classes" path="src"^>
echo         ^<attributes^> 
echo             ^<attribute name="optional" value="true"/^>
echo             ^<attribute name="maven.pomderived" value="true"/^>
echo         ^</attributes^> 
echo     ^</classpathentry^> 
echo     ^<classpathentry kind="src" path="MonolithSrc"/^>
echo     ^<classpathentry including="**/*.java" kind="src" output="target/test-classes" path="test"^>
echo         ^<attributes^> 
echo             ^<attribute name="test" value="true"/^>
echo             ^<attribute name="optional" value="true"/^>
echo             ^<attribute name="maven.pomderived" value="true"/^>
echo         ^</attributes^> 
echo     ^</classpathentry^> 
echo     ^<classpathentry kind="con" path="org.eclipse.jdt.launching.JRE_CONTAINER/org.eclipse.jdt.internal.debug.ui.launcher.StandardVMType/JavaSE-1.8"^>
echo         ^<attributes^> 
echo             ^<attribute name="maven.pomderived" value="true"/^>
echo         ^</attributes^> 
echo     ^</classpathentry^> 
echo     ^<classpathentry kind="con" path="org.eclipse.m2e.MAVEN2_CLASSPATH_CONTAINER"^>
echo         ^<attributes^> 
echo             ^<attribute name="maven.pomderived" value="true"/^>
echo             ^<attribute name="org.eclipse.jst.component.nondependency" value=""/^>
echo         ^</attributes^> 
echo     ^</classpathentry^> 
echo     ^<classpathentry kind="output" path="target/classes"/^>
echo ^</classpath^>
) > .classpath

@REM Confirm the .classpath file has been created
echo .classpath file created successfully.


set "temp=%workspacePath%"
set "temp=!temp:\=/!"

@REM Create the .project file and write the XML content
(
echo ^<?xml version="1.0" encoding="UTF-8"?^>
echo ^<projectDescription^>
echo     ^<name^>Semoss^</name^>
echo     ^<comment^>^</comment^>
echo     ^<projects^>^</projects^>
echo     ^<buildSpec^>
echo         ^<buildCommand^>
echo             ^<name^>org.eclipse.wst.common.project.facet.core.builder^</name^>
echo             ^<arguments^>^</arguments^>
echo         ^</buildCommand^>
echo         ^<buildCommand^>
echo             ^<name^>org.eclipse.jdt.core.javabuilder^</name^>
echo             ^<arguments^>^</arguments^>
echo         ^</buildCommand^>
echo         ^<buildCommand^>
echo             ^<name^>org.eclipse.wst.validation.validationbuilder^</name^>
echo             ^<arguments^>^</arguments^>
echo         ^</buildCommand^>
echo         ^<buildCommand^>
echo             ^<name^>org.eclipse.m2e.core.maven2Builder^</name^>
echo             ^<arguments^>^</arguments^>
echo         ^</buildCommand^>
echo     ^</buildSpec^>
echo     ^<natures^>
echo         ^<nature^>org.eclipse.jem.workbench.JavaEMFNature^</nature^>
echo         ^<nature^>org.eclipse.wst.common.modulecore.ModuleCoreNature^</nature^>
echo         ^<nature^>org.eclipse.jdt.core.javanature^</nature^>
echo         ^<nature^>org.eclipse.m2e.core.maven2Nature^</nature^>
echo         ^<nature^>org.eclipse.wst.common.project.facet.core.nature^</nature^>
echo     ^</natures^>
echo     ^<linkedResources^>
echo         ^<link^>
echo             ^<name^>MonolithSrc^</name^>
echo             ^<type^>2^</type^>
echo             ^<location^>%temp%/Monolith/src^</location^>
echo         ^</link^>
echo     ^</linkedResources^>
echo ^</projectDescription^>
) > .project

@REM Confirm the .project file has been created
echo .project file created successfully.

cd %dir%

endlocal

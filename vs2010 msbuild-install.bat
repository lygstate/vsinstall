@echo off
call "%~dp0/prepare.bat"
cd /d "%~dp0.."
xcopy /I /C /E /Y MSBuild "%USED_PROGRAM_FILES_32%\MSBuild"
xcopy /I /C /E /Y "Reference Assemblies" "%ProgramFiles%\Reference Assemblies"

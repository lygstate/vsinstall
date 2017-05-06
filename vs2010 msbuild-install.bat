cd /d %~dp0..
call "%~dp0/prepare.bat"

xcopy /I /C /E /Y MSBuild "%USED_PROGRAM_FILES_32%\MSBuild"
xcopy /I /C /E /Y "Reference Assemblies" "%ProgramFiles%\Reference Assemblies"

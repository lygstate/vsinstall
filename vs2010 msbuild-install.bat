cd /d %~dp0..
xcopy /I /C /E /Y MSBuild "%ProgramFiles(x86)%\MSBuild"
xcopy /I /C /E /Y "Reference Assemblies" "%ProgramFiles%\Reference Assemblies"

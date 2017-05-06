@echo off
call "%~dp0/prepare.bat"

set PATH="%VSDIR%\Microsoft SDKs\Windows\v7.1\Bin\NETFX 4.0 Tools";%PATH%
goto :start
cd /d "%VSDIR%\Microsoft Visual Studio 10.0\"
for /R %%i in (*.dll *.exe) do (
call :installSingle "%%i"
)
pause

:start
::call :installAll "%VSDIR%\Microsoft Visual Studio 10.0\Common7\IDE\"
::call :installAll "%VSDIR%\Microsoft Visual Studio 10.0\Common7\IDE\PrivateAssemblies\"
::call :installAll "%VSDIR%\Microsoft Visual Studio 10.0\Common7\IDE\ReferenceAssemblies\"
call :installAll "%VSDIR%\Microsoft Visual Studio 10.0\Common7\IDE\PublicAssemblies\"
call :installAll "%VSDIR%\Microsoft Visual Studio 10.0\Common7\Tools\ProjectComponents\"

call :installSingle "%VSDIR%\Microsoft Visual Studio 10.0\VC\bin\amd64\XDCMake.exe"
call :installSingle "%VSDIR%\Microsoft Visual Studio 10.0\VC\bin\xdcmake.exe"
call :installSingle "%VSDIR%\Microsoft SDKs\Windows\v7.1\Setup\SDKSetup.exe

call :installSingle "%USED_PROGRAM_FILES_32%\MSBuild\Microsoft.Cpp\v4.0\Microsoft.Build.CPPTasks.Common.dll"
call :installSingle "%USED_PROGRAM_FILES_32%\MSBuild\Microsoft.Cpp\v4.0\Platforms\Itanium\Microsoft.Build.CPPTasks.Itanium.dll"
call :installSingle "%USED_PROGRAM_FILES_32%\MSBuild\Microsoft.Cpp\v4.0\Platforms\Win32\Microsoft.Build.CPPTasks.Win32.dll"
call :installSingle "%USED_PROGRAM_FILES_32%\MSBuild\Microsoft.Cpp\v4.0\Platforms\x64\Microsoft.Build.CPPTasks.x64.dll"
call :installSingle "%ProgramFiles%\Reference Assemblies\Microsoft\mmc\v3.0\microsoft.managementconsole.dll"
call :installSingle "%ProgramFiles%\Reference Assemblies\Microsoft\mmc\v3.0\mmcfxcommon.dll"
call :installSingle "%ProgramFiles%\Reference Assemblies\Microsoft\UDDI\v2.1\bin\system32\microsoft.uddi.dll"
call :installSingle "%ProgramFiles%\Reference Assemblies\Microsoft\WindowsMediaServices\v9.6\Microsoft.windowsmediaservices.dll"
call :installSingle "%ProgramFiles%\Reference Assemblies\Microsoft\FSRM\v7.0\srmlib.dll"

goto :eof
:installAll
cd /d "%~1"
for %%i in (*) do (
echo Install %CD%\%%i
gacutil -f -i %%i > nul
)
goto :eof

goto :eof
:installSingle
echo Install %~1
gacutil -f -i "%~1" > nul
goto :eof
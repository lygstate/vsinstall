@echo on
call "%~dp0/prepare.bat"

cd /d %~dp0..
set "VSDIR=%CD%"
set PATH="%VSDIR%\Microsoft SDKs\Windows\v7.1\Bin\NETFX 4.0 Tools";%PATH%

cd /d %~dp0
set VSDIR_REG=%VSDIR:\=\\%
cscript //Nologo replace.vbs "MicrosoftSDKs registry-install.reg.in" "MicrosoftSDKs registry-install.reg" "@VSDIR@" "%VSDIR_REG%"
cscript //Nologo replace.vbs "vs2010 registry-install.reg.in" "vs2010 registry-install.reg" "@VSDIR@" "%VSDIR_REG%"

"%SYSTEM_DIR_32%\regedit.exe" -s "MicrosoftSDKs registry-install.reg"
regedit.exe -s "MicrosoftSDKs registry-install.reg"
"%SYSTEM_DIR_32%\regedit.exe" -s "vs2010 registry-install.reg"

del *.reg
cd /d "%VSDIR%\Microsoft Visual Studio 10.0\Common7\IDE\PublicAssemblies\"
call :installAll
cd /d "%VSDIR%\Microsoft Visual Studio 10.0\Common7\Tools\ProjectComponents\"
call :installAll

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

pause
goto :eof
:installAll
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
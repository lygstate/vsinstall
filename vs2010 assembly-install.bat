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
"%SYSTEM_DIR_32%\regedit.exe" -s "vs2010 registry-install.reg"
del *.reg

gacutil -f -i "%VSDIR%\Microsoft Visual Studio 10.0\Common7\IDE\PublicAssemblies\Microsoft.VisualStudio.VCProjectEngine.dll"
gacutil -f -i "%VSDIR%\Microsoft Visual Studio 10.0\Common7\Tools\ProjectComponents\Microsoft.VisualStudio.ComponentModelHost.dll"
gacutil -f -i "%VSDIR%\Microsoft Visual Studio 10.0\Common7\Tools\ProjectComponents\Microsoft.VisualStudio.Project.Contracts.dll"
gacutil -f -i "%VSDIR%\Microsoft Visual Studio 10.0\Common7\Tools\ProjectComponents\Microsoft.VisualStudio.Project.Contracts.Implementation.dll"
gacutil -f -i "%VSDIR%\Microsoft Visual Studio 10.0\Common7\Tools\ProjectComponents\Microsoft.VisualStudio.Project.Framework.dll"
gacutil -f -i "%VSDIR%\Microsoft Visual Studio 10.0\Common7\Tools\ProjectComponents\Microsoft.VisualStudio.Project.Framework.Implementation.dll"
gacutil -f -i "%VSDIR%\Microsoft Visual Studio 10.0\Common7\Tools\ProjectComponents\Microsoft.VisualStudio.Project.Utilities.v10.0.dll"
gacutil -f -i "%VSDIR%\Microsoft Visual Studio 10.0\Common7\Tools\ProjectComponents\Microsoft.VisualStudio.Project.VisualC.VCProjectEngine.dll"
gacutil -f -i "%VSDIR%\Microsoft Visual Studio 10.0\VC\bin\amd64\XDCMake.exe"
gacutil -f -i "%VSDIR%\Microsoft Visual Studio 10.0\VC\bin\xdcmake.exe"
gacutil -f -i "%VSDIR%\Microsoft SDKs\Windows\v7.1\Setup\SDKSetup.exe

gacutil -f -i "%USED_PROGRAM_FILES_32%\MSBuild\Microsoft.Cpp\v4.0\Microsoft.Build.CPPTasks.Common.dll"
gacutil -f -i "%USED_PROGRAM_FILES_32%\MSBuild\Microsoft.Cpp\v4.0\Platforms\Itanium\Microsoft.Build.CPPTasks.Itanium.dll"
gacutil -f -i "%USED_PROGRAM_FILES_32%\MSBuild\Microsoft.Cpp\v4.0\Platforms\Win32\Microsoft.Build.CPPTasks.Win32.dll"
gacutil -f -i "%USED_PROGRAM_FILES_32%\MSBuild\Microsoft.Cpp\v4.0\Platforms\x64\Microsoft.Build.CPPTasks.x64.dll"
gacutil -f -i "%ProgramFiles%\Reference Assemblies\Microsoft\mmc\v3.0\microsoft.managementconsole.dll"
gacutil -f -i "%ProgramFiles%\Reference Assemblies\Microsoft\mmc\v3.0\mmcfxcommon.dll"
gacutil -f -i "%ProgramFiles%\Reference Assemblies\Microsoft\UDDI\v2.1\bin\system32\microsoft.uddi.dll"
gacutil -f -i "%ProgramFiles%\Reference Assemblies\Microsoft\WindowsMediaServices\v9.6\Microsoft.windowsmediaservices.dll"
gacutil -f -i "%ProgramFiles%\Reference Assemblies\Microsoft\FSRM\v7.0\srmlib.dll"

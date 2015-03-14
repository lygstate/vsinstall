@echo on
cd /d %~dp0..
set "VSDIR=%CD%"
set PATH=%PATH%;%VSDIR%\Microsoft SDKs\Windows\v7.1\Bin\NETFX 4.0 Tools;
cd /d %~dp0

::http://ss64.com/vb/syntax-replace.html
:: NOTE: doesn't support for UTF16
SET VSDIR_REG=%VSDIR:\=\\%
cscript //Nologo replace.vbs "MicrosoftSDKs registry-install-x64.reg.in" "MicrosoftSDKs registry-install-x64.reg" "@VSDIR@" "%VSDIR_REG%"
cscript //Nologo replace.vbs "vs2010 registry-install-x64.reg.in" "vs2010 registry-install-x64.reg" "@VSDIR@" "%VSDIR_REG%"

regedit.exe /S "MicrosoftSDKs registry-install-x64.reg"
regedit.exe /S "vs2010 registry-install-x64.reg"
del *.reg

gacutil -i "%VSDIR%\Microsoft Visual Studio 10.0\Common7\IDE\PublicAssemblies\Microsoft.VisualStudio.VCProjectEngine.dll"
gacutil -i "%VSDIR%\Microsoft Visual Studio 10.0\Common7\Tools\ProjectComponents\Microsoft.VisualStudio.ComponentModelHost.dll"
gacutil -i "%VSDIR%\Microsoft Visual Studio 10.0\Common7\Tools\ProjectComponents\Microsoft.VisualStudio.Project.Contracts.dll"
gacutil -i "%VSDIR%\Microsoft Visual Studio 10.0\Common7\Tools\ProjectComponents\Microsoft.VisualStudio.Project.Contracts.Implementation.dll"
gacutil -i "%VSDIR%\Microsoft Visual Studio 10.0\Common7\Tools\ProjectComponents\Microsoft.VisualStudio.Project.Framework.dll"
gacutil -i "%VSDIR%\Microsoft Visual Studio 10.0\Common7\Tools\ProjectComponents\Microsoft.VisualStudio.Project.Framework.Implementation.dll"
gacutil -i "%VSDIR%\Microsoft Visual Studio 10.0\Common7\Tools\ProjectComponents\Microsoft.VisualStudio.Project.Utilities.v10.0.dll"
gacutil -i "%VSDIR%\Microsoft Visual Studio 10.0\Common7\Tools\ProjectComponents\Microsoft.VisualStudio.Project.VisualC.VCProjectEngine.dll"
gacutil -i "%VSDIR%\Microsoft Visual Studio 10.0\VC\bin\amd64\XDCMake.exe"
gacutil -i "%VSDIR%\Microsoft Visual Studio 10.0\VC\bin\xdcmake.exe"
gacutil -i "%VSDIR%\Microsoft SDKs\Windows\v7.1\Setup\SDKSetup.exe

gacutil -i "C:\Program Files (x86)\MSBuild\Microsoft.Cpp\v4.0\Microsoft.Build.CPPTasks.Common.dll"
gacutil -i "C:\Program Files (x86)\MSBuild\Microsoft.Cpp\v4.0\Platforms\Itanium\Microsoft.Build.CPPTasks.Itanium.dll"
gacutil -i "C:\Program Files (x86)\MSBuild\Microsoft.Cpp\v4.0\Platforms\Win32\Microsoft.Build.CPPTasks.Win32.dll"
gacutil -i "C:\Program Files (x86)\MSBuild\Microsoft.Cpp\v4.0\Platforms\x64\Microsoft.Build.CPPTasks.x64.dll"
gacutil -i "C:\Program Files\Reference Assemblies\Microsoft\mmc\v3.0\microsoft.managementconsole.dll"
gacutil -i "C:\Program Files\Reference Assemblies\Microsoft\mmc\v3.0\mmcfxcommon.dll"
gacutil -i "C:\Program Files\Reference Assemblies\Microsoft\UDDI\v2.1\bin\system32\microsoft.uddi.dll"
gacutil -i "C:\Program Files\Reference Assemblies\Microsoft\WindowsMediaServices\v9.6\Microsoft.windowsmediaservices.dll"
gacutil -i "C:\Program Files\Reference Assemblies\Microsoft\FSRM\v7.0\srmlib.dll"
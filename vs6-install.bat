@echo on
cd /d %~dp0..
::xcopy /I /C /E /Y "Microsoft Visual Studio" "%ProgramFiles(x86)%\Microsoft Visual Studio"
xcopy /I /C /E /Y "vs6 Redistributable" "%windir%\SysWOW64"

set "VSDIR=%CD%"

cd /d %~dp0
set VSDIR_REG=%VSDIR:\=\\%
cscript //Nologo replace.vbs "vc6-install-x64.reg.in" "vc6-install-x64.reg" "@VSDIR@" "%VSDIR_REG%"

regedit.exe /S "vc6-install-x64.reg"
del vc6-install-x64.reg

@echo off
call "%~dp0/prepare.bat"
cd /d %~dp0..
xcopy /I /C /E /Y "vs6 Redistributable" "%SYSTEM_DIR_32%"

set "VSDIR=%CD%"

cd /d %~dp0
set "VSDIR_REG=%VSDIR:\=\\%"
cscript //Nologo replace.vbs vc6-install.reg.in vc6-install.reg "@VSDIR@" "%VSDIR_REG%"

"%SYSTEM_DIR_32%\regedit.exe" -s vc6-install.reg
del vc6-install.reg

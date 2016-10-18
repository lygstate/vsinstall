@echo on
cd /d %~dp0..
set "VSDIR=%CD%"

cd /d %~dp0
set VSDIR_REG=%VSDIR:\=\\%
cscript //Nologo replace.vbs "vc6-install-x64.reg.in" "vc6-install-x64.reg" "@VSDIR@" "%VSDIR_REG%"

regedit.exe /S "vc6-install-x64.reg"
del vc6-install-x64.reg

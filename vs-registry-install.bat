@echo off
call "%~dp0/prepare.bat"

set VSDIR_REG=%VSDIR:\=\\%
cscript //Nologo replace.vbs vc6-install.reg.in vc6-install.reg "@VSDIR@" "%VSDIR_REG%"
cscript //Nologo replace.vbs "visual-studio-registry-install.reg.in" "visual-studio-registry-install.reg" "@VSDIR@" "%VSDIR_REG%"
cscript //Nologo replace.vbs "visual-studio-registry-install.x64.reg.in" "visual-studio-registry-install.x64.reg" "@VSDIR@" "%VSDIR_REG%"
cscript //Nologo replace.vbs "MicrosoftSDKs registry-install.reg.in" "MicrosoftSDKs registry-install.reg" "@VSDIR@" "%VSDIR_REG%"

"%SYSTEM_DIR_32%\regedit.exe" -s vc6-install.reg
"%SYSTEM_DIR_32%\regedit.exe" -s "visual-studio-registry-install.reg"
"%SYSTEM_DIR_32%\regedit.exe" -s "visual-studio-registry-install.x64.reg"
regedit.exe -s "visual-studio-registry-install.x64.reg"

"%SYSTEM_DIR_32%\regedit.exe" -s "MicrosoftSDKs registry-install.reg"
regedit.exe -s "MicrosoftSDKs registry-install.reg"

del *.reg 2>nul

@echo Registry install finished

@echo on

call :GetVSCommonToolsDir

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

goto :eof

@REM -----------------------------------------------------------------------
:GetVSCommonToolsDir
@call :GetVSCommonToolsDirHelper HKLM\SOFTWARE\Microsoft 2>nul
@call :GetVSCommonToolsDirHelper HKCU\SOFTWARE\Microsoft 2>nul
@call :GetVSCommonToolsDirHelper HKLM\SOFTWARE\Wow6432Node\Microsoft 2>nul
@call :GetVSCommonToolsDirHelper HKCU\SOFTWARE\Wow6432Node\Microsoft 2>nul
@exit /B 0

:GetVSCommonToolsDirHelper
@set VC100DIR=
@for /F "tokens=1,2*" %%i in ('reg query "%1\VisualStudio\SxS\VC7" /v "10.0"') do @(
  @if "%%i"=="10.0" (
    @set "VC100DIR=%%k"
  )
)
@call :UpdateVC100Dir %1
@exit /B 0


:UpdateVC100Dir
@echo UpdateVC100Dir %1 %VC100DIR%
@if "%VC100DIR%"=="" exit /B 1
@cd "%VC100DIR%.."
reg delete "%1\VisualStudio\SxS\VS7" /v "10.0" /f
reg add "%1\VisualStudio\SxS\VS7" /v "10.0" /t REG_SZ /f /d "%CD%\\"

@exit /B 0

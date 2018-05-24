@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs" & exit

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------

del /F "%temp%\getadmin.vbs" 2>nul

@echo Install Visual C++ Runtime library

call "%~dp0install_runtime.bat"

@echo Install Visual C++ 6.0 and Visual C++ 2008
call "%~dp0vs-registry-install.bat

@echo Install Daffodil for Visual Studio
call "%~dp0install-msi.bat"

pause
@echo off
set "SYSTEM_DIR=%WinDir%\SysWOW64"
if not exist "%SYSTEM_DIR%" (
set "SYSTEM_DIR=%WinDir%\System32"
)
echo %SYSTEM_DIR%
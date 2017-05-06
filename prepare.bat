@echo off
set "SYSTEM_DIR_32=%WinDir%\SysWOW64"
if not exist "%SYSTEM_DIR_32%" (
  set "SYSTEM_DIR_32=%WinDir%\System32"
)

set "USED_PROGRAM_FILES_32=%ProgramFiles(x86)%"
if not exist "%USED_PROGRAM_FILES_32%" (
  set "USED_PROGRAM_FILES_32=%ProgramFiles%"
)

::echo %SYSTEM_DIR_32% %USED_PROGRAM_FILES_32%
cd /d "%~dp0.."
set "VSDIR=%CD%"
cd /d "%~dp0"

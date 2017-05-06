@echo off
cd /d "%~dp0"
cd ..\..
set _MICROSOFT_VS_ROOT=%CD%
rem
rem Root of Visual Developer Studio Common files.
set VSCommonDir=%_MICROSOFT_VS_ROOT%\Common

rem
rem Root of Visual Developer Studio installed files.
rem
set MSDevDir=%_MICROSOFT_VS_ROOT%\Common\msdev98

rem
rem Root of Visual C++ installed files.
rem
set MSVCDir=%_MICROSOFT_VS_ROOT%\VC98

rem
rem VcOsDir is used to help create either a Windows 95 or Windows NT specific path.
rem
set VcOsDir=WIN95
if "%OS%" == "Windows_NT" set VcOsDir=WINNT

rem
echo Setting environment for using Microsoft Visual C++ tools.
rem

if "%OS%" == "Windows_NT" set PATH=%MSDevDir%\BIN;%MSVCDir%\BIN;%VSCommonDir%\TOOLS\%VcOsDir%;%VSCommonDir%\TOOLS;%PATH%
if "%OS%" == "" set PATH="%MSDevDir%\BIN";"%MSVCDir%\BIN";"%VSCommonDir%\TOOLS\%VcOsDir%";"%VSCommonDir%\TOOLS";"%windir%\SYSTEM";"%PATH%"
set INCLUDE=%MSVCDir%\ATL\INCLUDE;%MSVCDir%\INCLUDE;%MSVCDir%\MFC\INCLUDE;%INCLUDE%
set LIB=%MSVCDir%\LIB;%MSVCDir%\MFC\LIB;%LIB%

set VcOsDir=
set VSCommonDir=


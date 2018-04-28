set VAPSXT_DIR=D:\AVIC615\vaps_xt_321
echo %VAPSXT_DIR%

set QTDIR=C:\Qt\4.8.7-VS2008
echo %QTDIR%

set PATH=%VAPSXT_DIR%\bin;%PATH%

C:
cd "C:\Program Files (x86)\Microsoft Visual Studio 9.0\Common7\IDE\"

start devenv.exe

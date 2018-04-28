set VAPSXT_DIR=D:\AVIC615\vaps_xt_401
echo %VAPSXT_DIR%

set QTDIR=C:\Qt\Qt5.5.1\5.5\msvc2010
echo %QTDIR%

set PATH=%VAPSXT_DIR%\bin;%QTDIR%\bin;%PATH%

cd "C:\Program Files (x86)\Microsoft Visual Studio 10.0\Common7\IDE\"
C:

start devenv.exe

set QTDIR=C:\Qt\Qt5.5.1\5.5\msvc2010

echo %QTDIR%

set PATH=%QTDIR%\bin;%PATH%

cd "C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\IDE\"

start devenv.exe

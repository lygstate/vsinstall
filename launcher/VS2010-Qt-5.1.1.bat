set QTDIR=C:\Qt\Qt5.1.1\5.1.1\msvc2010_opengl

echo %QTDIR%

set PATH=%QTDIR%\bin;%NDDSHOME%\lib\i86Win32VS2010;%PATH%

cd "C:\Program Files (x86)\Microsoft Visual Studio 10.0\Common7\IDE\"

start devenv.exe

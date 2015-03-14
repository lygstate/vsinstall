cd /d %~dp0

cd /d "vs2010 Debug Runtime"
copy /Y "x64\*.dll" %WinDir%\System32\
copy /Y "x86\*.dll" %WinDir%\SysWOW64\

cd /d %~dp0
"vs2008 Debug Runtime\VC_x86Runtime.exe" /q /norestart
"vs2008 Debug Runtime\VC_x64Runtime.exe" /q /norestart

"vs2010 Redistributable\vcredist_x86.exe" /q /norestart
"vs2010 Redistributable\vcredist_x64.exe" /q /norestart


call "%~dp0prepare.bat"

cd /d "%VSDIR%\vs6 Redistributable"
copy /Y "*.dll" "%SYSTEM_DIR_32%"

cd /d "%VSDIR%\vs2010 Debug Runtime"
copy /Y "x64\*.dll" %WinDir%\System32\
copy /Y "x86\*.dll" %WinDir%\SysWOW64\


cd /d "%VSDIR%\"
"vs2008 Debug Runtime\VC_x86Runtime.exe" /q /norestart
"vs2008 Debug Runtime\VC_x64Runtime.exe" /q /norestart

"vs2010 Redistributable\vcredist_x86.exe" /q /norestart
"vs2010 Redistributable\vcredist_x64.exe" /q /norestart

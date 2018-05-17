cd %~dp0..
del ..\vs.7z 2>nul
7z a -t7z ..\vs.7z . -xr@".\vsinstall\excludeList.txt"  -mx1 -mmt=on
pause
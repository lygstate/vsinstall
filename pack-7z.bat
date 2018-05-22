cd %~dp0..
del ..\vs.zip 2>nul
7z a -tzip ..\vs.zip . -xr@".\vsinstall\excludeList.txt"  -mx1 -mmt=on
pause

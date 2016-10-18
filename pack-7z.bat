cd %~dp0..
"%ProgramFiles%\7-Zip\7z" a -t7z ..\vs.7z . -xr@".\vsinstall\excludeList.txt"
pause
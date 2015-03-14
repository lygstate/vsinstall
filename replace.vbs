'usage: cscript replace.vbs inputFilename outputFilename "StringToFind" "stringToReplace"
 
Option Explicit
Dim fso,inputFilename,outputFilename,inFile,outFile
Dim strSearch,strReplace,oldContent,newContent

inputFilename=WScript.Arguments.Item(0)
outputFilename=WScript.Arguments.Item(1)
strSearch=WScript.Arguments.Item(2)
strReplace=WScript.Arguments.Item(3)

'Does file exist?
Set fso=CreateObject("Scripting.FileSystemObject")
if fso.FileExists(inputFilename)=false then
   wscript.echo "file not found!"
   wscript.Quit
end if

'https://msdn.microsoft.com/en-us/library/314cz14s(v=vs.84).aspx
'object.OpenTextFile(filename[, iomode[, create[, format]]])
'Read file
set inFile=fso.OpenTextFile(inputFilename, 1, true, -1)
oldContent=inFile.ReadAll
inFile.Close

'Replace contents
newContent=Replace(oldContent,strSearch,strReplace)

'Write file
set outFile=fso.OpenTextFile(outputFilename, 2, true, -1)
outFile.Write(newContent)
outFile.Close

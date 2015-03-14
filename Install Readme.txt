1. 首先安装
vs 2005 - 2010 Redistributable
2. 安装 vs2008 Debug Runtime
3. 复制 Microsoft Visual Studio 10.0\VC\redist\Debug_NonRedist
   下的文件到相应的目录下
   x86 到 C:\Windows\SysWOW64下，所有dll都要复制到同一层目录
   x64 到 C:\Windows\System32下。
4. 执行 vs2010 安装注册文件
5. 复制MSBuild 覆盖%ProgramFiles(x86)%\MSBuild
6. 复制Reference Assemblies 覆盖%ProgramFiles%\Reference Assemblies
8. 打开 Developer Command Prompt for VS2013
7. 执行vs2010 assembly-install.bat
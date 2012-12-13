%windir%\Microsoft.NET\Framework\v4.0.30319\msbuild.exe ..\Pulsus.sln /t:Clean,Rebuild /p:Configuration=Release /fileLogger

copy ..\Pulsus\bin\Release\Pulsus.dll Packages\Pulsus\lib\net35\
copy ..\Pulsus\bin\Release\Pulsus.pdb Packages\Pulsus\lib\net35\
REM copy ..\Pulsus\bin\Release\Pulsus.xml Packages\Pulsus\lib\net35\

copy ..\Pulsus.Net4\bin\Release\Pulsus.dll Packages\Pulsus\lib\net4\
copy ..\Pulsus.Net4\bin\Release\Pulsus.pdb Packages\Pulsus\lib\net4\
REM copy ..\Pulsus.Net4\bin\Release\Pulsus.xml Packages\Pulsus\lib\net4\

copy ..\Pulsus.Mvc\bin\Release\Pulsus.Mvc.dll Packages\Pulsus.Mvc\lib\net4\
copy ..\Pulsus.Mvc\bin\Release\Pulsus.Mvc.pdb Packages\Pulsus.Mvc\lib\net4\
REM copy ..\Pulsus.Mvc\bin\Release\Pulsus.Mvc.xml Packages\Pulsus.Mvc\lib\net4\

copy ..\Pulsus.Server\bin\Release\Pulsus.Server.dll Packages\Pulsus.Server\lib\net45\
copy ..\Pulsus.Server\bin\Release\Pulsus.Server.pdb Packages\Pulsus.Server\lib\net45\
REM copy ..\Pulsus.Server\bin\Release\Pulsus.Server.xml Packages\Pulsus.Server\lib\net45\

..\..\tools\.nuget\nuget.exe update -self
..\..\tools\.nuget\nuget.exe pack Pulsus.nuspec -BasePath Packages\Pulsus -Output Packages
..\..\tools\.nuget\nuget.exe pack Pulsus.Mvc.nuspec -BasePath Packages\Pulsus.Mvc -Output Packages
..\..\tools\.nuget\nuget.exe pack Pulsus.Server.nuspec -BasePath Packages\Pulsus.Server -Output Packages
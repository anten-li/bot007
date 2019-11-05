echo off
echo -----------------------------  

md %cd%\tmp

%cd%\bin\ml.exe /c /coff /I %cd%\include /Fo %cd%\tmp\okoshki.obj %cd%\source\okoshki.asm
echo -----------------------------
%cd%\bin\Rc.exe /v /I %cd%\include /Fo %cd%\tmp\ANT.RES %cd%\source\ANT.rc
echo -----------------------------
%cd%\bin\Cvtres.exe /machine:ix86 %cd%\tmp\ANT.res
echo -----------------------------
%cd%\bin\link.exe /SUBSYSTEM:WINDOWS /libpath:%cd%\lib %cd%\tmp\okoshki.obj %cd%\tmp\ANT.obj 

rd /s /q %cd%\tmp

pause
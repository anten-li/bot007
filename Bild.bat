echo off

echo -----------------------------  


md tmp 

bin\ml.exe /c /coff /I include /Fo tmp\okoshki.obj source\okoshki.asm 

echo -----------------------------
bin\Rc.exe /v /I include /Fo tmp\ANT.RES source\ANT.rc

echo -----------------------------

bin\Cvtres.exe /machine:ix86 tmp\ANT.res

echo -----------------------------

bin\link.exe /SUBSYSTEM:WINDOWS /libpath:lib tmp\okoshki.obj tmp\ANT.obj 

rd /s /q tmp


pause

@echo compile %1.c for COMX NTSC

@c:\lcc42\bin\lcc.exe "-target=xr18CX" "-Wf-g,;" "-Wf-volatile" -O "-Wp-D nofloats" "-Wa-D LCCNOLONG" -D__COMX__ -S %2 %3 %4 %5 %6 %1.c 
@IF ERRORLEVEL 1 GOTO quit
@c:\lcc42\bin\copt c:\lcc42\include\lcc1806.opt -I %1.asm -O %1.oasm
@c:\lcc42\bin\asw -cpu 1802 -quiet -D LCCCX=1 -D CODELOC=0x4401 -P -x -i ..\..\..\include -L %1.oasm
@c:\lcc42\bin\p2hex -r $-$ %1 %1_comx_pal | more +2
@:quit

@echo compile %1.c for COMX PAL

@c:\lcc42\bin\lcc.exe "-target=xr18CX" "-Wf-g,;" "-Wf-volatile" -O "-Wp-D nofloats" "-Wa-D LCCNOLONG" -D__COMX__ -DNTSC=1 -S %2 %3 %4 %5 %6 %1.c 
@IF ERRORLEVEL 1 GOTO quit
@c:\lcc42\bin\copt c:\lcc42\include\lcc1806.opt -I %1.asm -O %1.oasm
@c:\lcc42\bin\asw -cpu 1802 -quiet -D LCCCX=1 -D CODELOC=0x4401 -P -x -i ..\..\..\include -L %1.oasm
@c:\lcc42\bin\p2hex -r $-$ %1 %1_comx_ntsc | more +2
@:quit

@echo compile %1.c for PECOM

@c:\lcc42\bin\lcc.exe "-target=xr18CX" "-Wf-g,;"  "-Wf-volatile" -O "-Wp-D nofloats" "-Wa-D LCCNOLONG" -D__PECOM__ -S %2 %3 %4 %5 %6 %1.c 
@IF ERRORLEVEL 1 GOTO quit
@c:\lcc42\bin\copt c:\lcc42\include\lcc1806.opt -I %1.asm -O %1.oasm
@c:\lcc42\bin\asw -cpu 1802 -quiet -D LCCCX=1 -D CODELOC=0x201 -P -x -i ..\..\..\include -L %1.oasm
@c:\lcc42\bin\p2hex -r $-$ %1 %1_pecom | more +2
@:quit

@echo compile %1.c for TMC600

@c:\lcc42\bin\lcc.exe "-target=xr18CX" "-Wf-g,;"  "-Wf-volatile" -O "-Wp-D nofloats" "-Wa-D LCCNOLONG" -D__TMC600__ -S %2 %3 %4 %5 %6 %1.c 
@IF ERRORLEVEL 1 GOTO quit
@c:\lcc42\bin\copt c:\lcc42\include\lcc1806.opt -I %1.asm -O %1.oasm
@c:\lcc42\bin\asw -cpu 1802 -quiet -D LCCCX=1 -D CODELOC=0x6300 -P -x -i ..\..\..\include -L %1.oasm
@c:\lcc42\bin\p2hex -r $-$ %1 %1_tmc600 | more +2
@:quit

@echo compile %1.c for CIDELSA DRACO 32K

@c:\lcc42\bin\lcc.exe "-target=xr18CX" "-Wf-g,;"  "-Wf-volatile" -O "-Wp-D nofloats" "-Wa-D LCCNOLONG" -D__CIDELSA__ -D__DRACO__ -S %2 %3 %4 %5 %6 %1.c 
@IF ERRORLEVEL 1 GOTO quit
@c:\lcc42\bin\copt c:\lcc42\include\lcc1806.opt -I %1.asm -O %1.oasm
@c:\lcc42\bin\asw -cpu 1802 -quiet -D NOFILLBSS=1 -D DATALOC=0x8000 -D CODELOC=0 -D STACKLOC=0x83ff -P -x -i ..\..\..\include -L %1.oasm
@c:\lcc42\bin\p2hex -r $-$ %1 %1_draco32k | more +2
@:quit

@echo compile %1.c for CIDELSA ALTAIR 24K

@c:\lcc42\bin\lcc.exe "-target=xr18CX" "-Wf-g,;"  "-Wf-volatile" -O "-Wp-D nofloats" "-Wa-D LCCNOLONG" -D__CIDELSA__ -D__ALTAIR__ -S %2 %3 %4 %5 %6 %1.c 
@IF ERRORLEVEL 1 GOTO quit
@c:\lcc42\bin\copt c:\lcc42\include\lcc1806.opt -I %1.asm -O %1.oasm
@c:\lcc42\bin\asw -cpu 1802 -quiet -D NOFILLBSS=1 -D DATALOC=0x6000 -D CODELOC=0 -D STACKLOC=0x60ff -P -x -i ..\..\..\include -L %1.oasm
@c:\lcc42\bin\p2hex -r $-$ %1 %1_altair24k | more +2
@:quit

@echo compile %1.c for CIDELSA DESTROYER 12K

@c:\lcc42\bin\lcc.exe "-target=xr18CX" "-Wf-g,;"  "-Wf-volatile" -O "-Wp-D nofloats" "-Wa-D LCCNOLONG" -D__CIDELSA__ -D__DESTROYER__ -S %2 %3 %4 %5 %6 %1.c 
@IF ERRORLEVEL 1 GOTO quit
@c:\lcc42\bin\copt c:\lcc42\include\lcc1806.opt -I %1.asm -O %1.oasm
@c:\lcc42\bin\asw -cpu 1802 -quiet -D NOFILLBSS=1 -D DATALOC=0x3000 -D CODELOC=0 -D STACKLOC=0x30ff -P -x -i ..\..\..\include -L %1.oasm
@c:\lcc42\bin\p2hex -r $-$ %1 %1_destroyer12k | more +2
@:quit

@echo compile %1.c for MICRO PAL1 8 Char Lines

@c:\lcc42\bin\lcc.exe "-target=xr18CX" "-Wf-g,;"  "-Wf-volatile" -O "-Wp-D nofloats" "-Wa-D LCCNOLONG" -D__MICRO__ -DPAL=1 -S %2 %3 %4 %5 %6 %1.c 
@IF ERRORLEVEL 1 GOTO quit
@c:\lcc42\bin\copt c:\lcc42\include\lcc1806.opt -I %1.asm -O %1.oasm
@c:\lcc42\bin\asw -cpu 1802 -quiet -D NOFILLBSS=1 -D DATALOC=0x8000 -D CODELOC=0 -D STACKLOC=0x9fff -P -x -i ..\..\..\include -L %1.oasm
@c:\lcc42\bin\p2hex -r $-$ %1 %1_microboard_pal1 | more +2
@:quit

@echo compile %1.c for MICRO PAL2 - 9 lines

@c:\lcc42\bin\lcc.exe "-target=xr18CX" "-Wf-g,;"  "-Wf-volatile" -O "-Wp-D nofloats" "-Wa-D LCCNOLONG" -D__MICRO__ -DPAL=2 -S %2 %3 %4 %5 %6 %1.c 
@IF ERRORLEVEL 1 GOTO quit
@c:\lcc42\bin\copt c:\lcc42\include\lcc1806.opt -I %1.asm -O %1.oasm
@c:\lcc42\bin\asw -cpu 1802 -quiet -D NOFILLBSS=1 -D DATALOC=0x8000 -D CODELOC=0 -D STACKLOC=0x9fff -P -x -i ..\..\..\include -L %1.oasm
@c:\lcc42\bin\p2hex -r $-$ %1 %1_microboard_pal2 | more +2
@:quit

@echo compile %1.c for MICRO NTSC1, 4, 8 - 8 Char Lines

@c:\lcc42\bin\lcc.exe "-target=xr18CX" "-Wf-g,;"  "-Wf-volatile" -O "-Wp-D nofloats" "-Wa-D LCCNOLONG" -D__MICRO__ -DNTSC=1 -S %2 %3 %4 %5 %6 %1.c 
@IF ERRORLEVEL 1 GOTO quit
@c:\lcc42\bin\copt c:\lcc42\include\lcc1806.opt -I %1.asm -O %1.oasm
@c:\lcc42\bin\asw -cpu 1802 -quiet -D NOFILLBSS=1 -D DATALOC=0x8000 -D CODELOC=0 -D STACKLOC=0x9fff -P -x -i ..\..\..\include -L %1.oasm
@c:\lcc42\bin\p2hex -r $-$ %1 %1_microboard_ntsc1_4_8 | more +2
@:quit

@echo compile %1.c for MICRO NTSC2, 9 - 256 Characters

@c:\lcc42\bin\lcc.exe "-target=xr18CX" "-Wf-g,;"  "-Wf-volatile" -O "-Wp-D nofloats" "-Wa-D LCCNOLONG" -D__MICRO__ -DNTSC=2 -S %2 %3 %4 %5 %6 %1.c 
@IF ERRORLEVEL 1 GOTO quit
@c:\lcc42\bin\copt c:\lcc42\include\lcc1806.opt -I %1.asm -O %1.oasm
@c:\lcc42\bin\asw -cpu 1802 -quiet -D NOFILLBSS=1 -D DATALOC=0x8000 -D CODELOC=0 -D STACKLOC=0x9fff -P -x -i ..\..\..\include -L %1.oasm
@c:\lcc42\bin\p2hex -r $-$ %1 %1_microboard_ntsc2_9 | more +2
@:quit

@echo compile %1.c for MICRO NTSC3 - 8 lines

@c:\lcc42\bin\lcc.exe "-target=xr18CX" "-Wf-g,;"  "-Wf-volatile" -O "-Wp-D nofloats" "-Wa-D LCCNOLONG" -D__MICRO__ -DNTSC=3 -S %2 %3 %4 %5 %6 %1.c 
@IF ERRORLEVEL 1 GOTO quit
@c:\lcc42\bin\copt c:\lcc42\include\lcc1806.opt -I %1.asm -O %1.oasm
@c:\lcc42\bin\asw -cpu 1802 -quiet -D NOFILLBSS=1 -D DATALOC=0x8000 -D CODELOC=0 -D STACKLOC=0x9fff -P -x -i ..\..\..\include -L %1.oasm
@c:\lcc42\bin\p2hex -r $-$ %1 %1_microboard_ntsc3 | more +2
@:quit

@echo compile %1.c for MICRO NTSC5, 6, 7 - Char ROM

@c:\lcc42\bin\lcc.exe "-target=xr18CX" "-Wf-g,;"  "-Wf-volatile" -O "-Wp-D nofloats" "-Wa-D LCCNOLONG" -D__MICRO__ -DNTSC=5 -S %2 %3 %4 %5 %6 %1.c 
@IF ERRORLEVEL 1 GOTO quit
@c:\lcc42\bin\copt c:\lcc42\include\lcc1806.opt -I %1.asm -O %1.oasm
@c:\lcc42\bin\asw -cpu 1802 -quiet -D NOFILLBSS=1 -D DATALOC=0x8000 -D CODELOC=0 -D STACKLOC=0x9fff -P -x -i ..\..\..\include -L %1.oasm
@c:\lcc42\bin\p2hex -r $-$ %1 %1_microboard_ntsc5_6_7 | more +2
@:quit

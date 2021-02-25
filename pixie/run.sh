#!/bin/bash
#lcc -v -savetemps -target=xr18DH -DCPUSPEED=1760900 -DCODELOC=0 -DSTACKLOC=0x0BFF -DRES=64 -DVIDMEM=0x0F00 -D__VIP__ pixie.c
#> >(tee -a stdout.log) 2> >(tee -a stderr.log >&2)
rm *.i
rm *.s
rm *.p
rm *.asm
#lcc -v -savetemps -tempdir=. -target=xr18DH -DRES=128 -DVIDMEM=0x0F00 -D__VIP__ -S $1

lcpp -DVIDMEM=0x0F00 -D__VIP__ -I/home/winston/code/RCA1802Toolkit/tools/lcc1802/bin/include -I. $1 out.i
rcc -v -target=xr18CX -pixie  out.i out.s
#copt /home/winston/code/RCA1802Toolkit/tools/lcc1802/bin/include/lcc1806.opt -v -I out.s -O out.os
asl -cpu 1802 -x -P -i /home/winston/code/RCA1802Toolkit/tools/lcc1802/bin/include -i ./ -D CPUSPEED=1760900 -D CODELOC=0 -D STACKLOC=0x0BFF -D RES32 -D PIXIE_TILE -D PIXIE_SPRITE -D LCCPX=1 out.s
p2bin out.p out.bin
mv out.i out.asm
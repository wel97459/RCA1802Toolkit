#!/bin/bash
#lcc -v -savetemps -target=xr18DH -DCPUSPEED=1760900 -DCODELOC=0 -DSTACKLOC=0x0BFF -DRES=64 -DVIDMEM=0x0F00 -D__VIP__ pixie.c
#> >(tee -a stdout.log) 2> >(tee -a stderr.log >&2)
rm *.i
rm *.s
rm *.log
lcc -v -savetemps -tempdir=. -target=xr18DH -DRES=128 -DVIDMEM=0x0F00 -D__VIP__ -S $1

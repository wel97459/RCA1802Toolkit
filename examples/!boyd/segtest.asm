; generated by lcc-xr18DH $Version: 5.0 - XR18DH $ on Wed Jan 24 15:06:02 2018

SP:	equ	2 ;stack pointer
memAddr: equ	14
retAddr: equ	6
retVal:	equ	15
regArg1: equ	12
regArg2: equ	13
	listing off
	include lcc1802proloDH.inc
	listing on
_test:
	db 15
	db 15
	db 15
	db 15
	db 5
	db 0
	db 8
	db 1
_main: ;copt is peeping your size 2 frame with oct 23 rules
;{
;	asm(" req\n seq\n"
 req
 seq
 sex 3
 out 7
 db 0b11010000
 req
 ldad r11,_test
 ldad r10,8
 sex 11
 out 7
 out 7
 out 7
 out 7
 out 7
 out 7
 out 7
 out 7
 br $
;}
L1:
	Cretn

	include lcc1802epiloDH.inc
	include IO1802.inc

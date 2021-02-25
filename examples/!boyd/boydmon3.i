; generated by lcc-xr18NW $Version: 5.0 - XR18NW $ on Mon Apr 10 11:16:15 2017
SP:	equ	2 ;stack pointer
memAddr: equ	14
retAddr: equ	6
retVal:	equ	15
regArg1: equ	12
regArg2: equ	13
	listing off
	RELAXED ON
;definitions and prolog functions needed for smc1802 programs (Hi Bill)
;dec 21 packaged version for the christmas compiler (Ho Ho Ho)
;Dec 24 fixed shift macros to use memaddr as a work register and not corrupt the shift count
;jan 6 fixed shift left macro as above
;jan 11 saving as lcc1802epiloNG.inc for the NG compiler
;jan 12 minor correction to rldmi
;jan 14 minor correction to ldi4
;jan 16 adding shri4I
;jan20 correct error in shl2r
;jan21 moved 4 byte macros to bottom and added shrc4
;Jan 28 archived before beginning work on Birthday Compiler
;Feb 7 adding nointerrupts/interrupts to control interruptability
;Feb 13 changing address mode macros
;Feb 14 removing nointerrupts, adding reserve/release for stack frame, ld2z macro
;Mar 3 changing reserve/release to use inc/dec for 8 or less bytes
;Mar 4 adding incm macro for multiple increments
;mar 5 adding jzi2 macro to speed up if processing
;mar 6 adding ldn1, str1 for register indirect addressing
;mar 17 adding decm macro
;mar 28 adding jumpv macro
;may 15 adding jnzu1, jzu1 macros
;june 21 adding demote macro
;Oct 2, 2013 DH version for dhrystone optimization 
;Oct 2, 2013 added str2 macro 2 byte store at addr pointed to by register
;oct 4,	added st2i 2 byte immediate sore, pushf,pushm,pushl sequences, 
;oct 24, added ldaXs for stack pointed addresses, added mvcn1, mvc1 for 1 byte storage to storage moves, jneu1i for single byte immediate compare
;Feb 17 2014 added "inc sp" to restore stack pointer in jeqI1, affected strncmp.
;Feb 18 2017 added org to LCCCODELOC to allow for non-zero origin
;Feb 19 2017 beginning to adapt for 1806
;17-03-06 remove inc/dec from ccall, cretn6, add inc to popr
;17-03-07 add popf,popm,popl for optimization
;17-03-14 removed savemi, rldmi,cretn6
;17-03-27 added jequ1i
	org	LCCCODELOC	;wjr 17-02-18 allow code relocation
R0:	equ	0
R1:	equ	1
R2:	equ	2
R3:	equ	3
R4:	equ	4
R5:	equ	5
R6:	equ	6
R7:	equ	7
R8:	equ	8
R9:	equ	9
R10:	equ	10
R11:	equ	11
R12:	equ	12
R13:	equ	13
R14:	equ	14
R15:	equ	15
RL0:	equ	1 ;long register pairs are identified by their odd numbered register
RL6:	equ	7 
RL8:	equ	9 ;temp 1
RL10:	equ	11;temp 2
RL12:	equ	13 ;return value register for longs
Rp1p2:	equ	13 ;argument register for longs
Rt1:	equ	8  ;1st temp register
Rt2:	equ	9  ;2nd temp register
RCALL:	equ 	4 ;standard call routine
RRET:	equ 	5 ;standard return register
RPC:	equ 	3 ; standard program counter
;	listing	off
	macexp off	;this seems to have to go before the definitions
;macro definitions
;more natural 1802 macros
	listing	on
	lbr	lcc1802Init
	listing on
_PIN4:
	db 0
;$$function start$$ _ef1
_ef1:		;framesize=2
;unsigned char ef1(){
;	asm(" rldi 15,1\n"
;	return 0; //if the assembly doesn't return, EF1 is not active
 rldi 15,1
 bn1 .ret0
        sret    6
.ret0: ;will drop thru to return 0
        ldi     0
        plo     R15
        phi     R15
L1:
        sret    6
;$$function end$$ _ef1
;$$function start$$ _ef2
_ef2:		;framesize=2
;unsigned char ef2(){
;	asm(" rldi 15,1\n"
;	return 0; //if the assembly doesn't return, EF1 is not active
 rldi 15,1
 bn2 .ret0
        sret    6
.ret0: ;will drop thru to return 0
        ldi     0
        plo     R15
        phi     R15
L3:
        sret    6
;$$function end$$ _ef2
;$$function start$$ _disp1
_disp1:		;framesize=2
;void disp1(unsigned char d){//display a hex digit as two dec digits 00 to 15
;	asm(" glo 12\n smi 10\n bdf $$big\n" //df set means no overflow
 glo 12
 smi 10
 bdf $$big
 ldi 15
 phi 12
 br $$disp
$$big: plo 12
 ldi 1
 phi 12
$$disp:
 dec 2
 glo 12
 str 2
 out 7
 dec 2
 ghi 12
 str 2
 out 7
;}
L5:
        sret    6
;$$function end$$ _disp1
;$$function start$$ _disp2
_disp2:		;framesize=6
        dec sp
        dec sp
        dec sp
        dec sp
        glo     SP
        adi     ((6+1))#256
        plo     MEMADDR
        ghi     SP
        adci    ((6+1))>>8; was/256
        phi     MEMADDR
        ghi     R12
        str     memAddr
        inc     memAddr
        glo     R12
        str     memAddr
;Oct 13 (6+1) added to ldAD call
        glo     SP
        adi     ((6+1))#256
        plo     R11
        ghi     SP
        adci    ((6+1))>>8; was/256
        phi     R11
        glo     SP
        adi     ((6+1))#256
        plo     MEMADDR
        ghi     SP
        adci    ((6+1))>>8; was/256
        phi     MEMADDR
        lda     memAddr
        phi     R10
        ldn     memAddr
        plo     R10
        glo     R10
        str     R11
;void disp2(unsigned char xy){//display a byte as 4 decimal digits xx yy
;	disp1(xy&0x0f);//bottom digit
        glo     SP
        adi     ((6+1))#256
        plo     MEMADDR
        ghi     SP
        adci    ((6+1))>>8; was/256
        phi     MEMADDR
        ldn     memAddr
        plo     R11
        ldi     0
        phi     R11
        glo     R11
        ANI     (15)#256
        plo     R11
        ghi     R11
        ANI     (15)>>8; was/256
        phi     R11
	;removed ?	cpy2 R11,R11
        glo     R11
        plo     R12
        ldi     0
        phi     R12
        SCAL    6
        dw      _DISP1
;	disp1(xy>>4);
        glo     SP
        adi     ((6+1))#256
        plo     MEMADDR
        ghi     SP
        adci    ((6+1))>>8; was/256
        phi     MEMADDR
        ldn     memAddr
        plo     R11
        ldi     0
        phi     R11
        ghi     R11
        shl             ;set DF to the sign
        ghi     R11     ;get the top byte back
        shrc            ;shift one bit extending the sign
        phi     R11
        glo     R11
        shrc
        plo     R11
        ghi     R11
        shl             ;set DF to the sign
        ghi     R11     ;get the top byte back
        shrc            ;shift one bit extending the sign
        phi     R11
        glo     R11
        shrc
        plo     R11
        ghi     R11
        shl             ;set DF to the sign
        ghi     R11     ;get the top byte back
        shrc            ;shift one bit extending the sign
        phi     R11
        glo     R11
        shrc
        plo     R11
        ghi     R11
        shl             ;set DF to the sign
        ghi     R11     ;get the top byte back
        shrc            ;shift one bit extending the sign
        phi     R11
        glo     R11
        shrc
        plo     R11
        glo     R11
        plo     R12
        ldi     0
        phi     R12
        SCAL    6
        dw      _DISP1
;}
L7:
        inc sp
        inc sp
        inc sp
        inc sp
        sret    6
;$$function end$$ _disp2
;$$function start$$ _disp12
_disp12:		;framesize=6
        dec sp
        dec sp
        dec sp
        dec sp
;void disp12(){
;	initleds();
;	out(7,2);
 req
 seq
 dec 2
 out 7
 req
        RLDI    R12,7
        RLDI    R13,2
        SCAL    6
        dw      _OUT
;	out(7,1);
        RLDI    R12,7
        RLDI    R13,1
        SCAL    6
        dw      _OUT
;	out(7,15);out(7,15);out(7,15);out(7,15);out(7,15);out(7,15);
        RLDI    R12,7
        RLDI    R13,15
        SCAL    6
        dw      _OUT
        RLDI    R12,7
        RLDI    R13,15
        SCAL    6
        dw      _OUT
        RLDI    R12,7
        RLDI    R13,15
        SCAL    6
        dw      _OUT
        RLDI    R12,7
        RLDI    R13,15
        SCAL    6
        dw      _OUT
        RLDI    R12,7
        RLDI    R13,15
        SCAL    6
        dw      _OUT
        RLDI    R12,7
        RLDI    R13,15
        SCAL    6
        dw      _OUT
;}
L8:
        inc sp
        inc sp
        inc sp
        inc sp
        sret    6
;$$function end$$ _disp12
;$$function start$$ _disp42
_disp42:		;framesize=6
        dec sp
        dec sp
        dec sp
        dec sp
;void disp42(){
;	initleds();
;	out(7,2);
 req
 seq
 dec 2
 out 7
 req
        RLDI    R12,7
        RLDI    R13,2
        SCAL    6
        dw      _OUT
;	out(7,4);
        RLDI    R12,7
        RLDI    R13,4
        SCAL    6
        dw      _OUT
;	out(7,15);out(7,15);out(7,15);out(7,15);out(7,15);out(7,15);
        RLDI    R12,7
        RLDI    R13,15
        SCAL    6
        dw      _OUT
        RLDI    R12,7
        RLDI    R13,15
        SCAL    6
        dw      _OUT
        RLDI    R12,7
        RLDI    R13,15
        SCAL    6
        dw      _OUT
        RLDI    R12,7
        RLDI    R13,15
        SCAL    6
        dw      _OUT
        RLDI    R12,7
        RLDI    R13,15
        SCAL    6
        dw      _OUT
        RLDI    R12,7
        RLDI    R13,15
        SCAL    6
        dw      _OUT
;}
L10:
        inc sp
        inc sp
        inc sp
        inc sp
        sret    6
;$$function end$$ _disp42
;$$function start$$ _dispbl
_dispbl:		;framesize=8
        RSXD    R7
        dec sp
        dec sp
        dec sp
        dec sp
;void dispbl(){
;	initleds();
;	for (i=8;i>0;i--){
 req
 seq
 dec 2
 out 7
 req
        RLDI    R7,8
L14:
;		out(7,15);
        RLDI    R12,7
        RLDI    R13,15
        SCAL    6
        dw      _OUT
;	}
L15:
;	for (i=8;i>0;i--){
        dec     R7
        glo     R7
        sdi     (0)#256      ;subtract d FROM immediate value
        ghi     R7
        sdbi    (0)>>8; was/256      ;that's a standard signed subtraction (of register FROM immediate)
        ghi     R7 ;
        xri     (0)>>8; was/256      ;sets the top bit if the signs are different
        shlc          ;the original df is now in bit 0 and df=1 if signs were different
        lsnf    ;bypass the df flip if signs were the same
        xri     01     ;invert original df if signs were different
        shrc           ;put it back in df
        LBNF    L14  ;execute 
;}
L12:
        inc sp
        inc sp
        inc sp
        inc sp
        inc     sp
        lda     sp
        phi     R7
        ldn     sp
        plo     R7
        sret    6
;$$function end$$ _dispbl
;$$function start$$ _dispmemloc
_dispmemloc:		;framesize=14
        RSXD    R4
        RSXD    R5
        RSXD    R6
        RSXD    R7
        dec sp
        dec sp
        dec sp
        dec sp
        glo     SP
        adi     ((14+1))#256
        plo     MEMADDR
        ghi     SP
        adci    ((14+1))>>8; was/256
        phi     MEMADDR
        ghi     R12
        str     memAddr
        inc     memAddr
        glo     R12
        str     memAddr
;void dispmemloc(unsigned int loc){
;	register unsigned char* m=0;
        RLDI    R7,0
;	initleds();
;	m1=m[loc]>>4;
 req
 seq
 dec 2
 out 7
 req
        glo     SP
        adi     ((14+1))#256
        plo     MEMADDR
        ghi     SP
        adci    ((14+1))>>8; was/256
        phi     MEMADDR
        lda     memAddr
        phi     R11
        ldn     memAddr
        plo     R11
        glo     R7
        str     sp
        glo     R11
        ADD             ;calculate the low order byte
        plo     R11
        ghi     R7
        str     sp
        ghi     R11
        ADC             ;calculate the high byte
        phi     R11
        ldn     R11
        plo     R11
        ldi     0
        phi     R11
        ghi     R11
        shl             ;set DF to the sign
        ghi     R11     ;get the top byte back
        shrc            ;shift one bit extending the sign
        phi     R11
        glo     R11
        shrc
        plo     R11
        ghi     R11
        shl             ;set DF to the sign
        ghi     R11     ;get the top byte back
        shrc            ;shift one bit extending the sign
        phi     R11
        glo     R11
        shrc
        plo     R11
        ghi     R11
        shl             ;set DF to the sign
        ghi     R11     ;get the top byte back
        shrc            ;shift one bit extending the sign
        phi     R11
        glo     R11
        shrc
        plo     R11
        ghi     R11
        shl             ;set DF to the sign
        ghi     R11     ;get the top byte back
        shrc            ;shift one bit extending the sign
        phi     R11
        glo     R11
        shrc
        plo     R11
        glo     R11
        plo     R6
;	m2=m[loc]&0x0f;
        glo     SP
        adi     ((14+1))#256
        plo     MEMADDR
        ghi     SP
        adci    ((14+1))>>8; was/256
        phi     MEMADDR
        lda     memAddr
        phi     R11
        ldn     memAddr
        plo     R11
        glo     R7
        str     sp
        glo     R11
        ADD             ;calculate the low order byte
        plo     R11
        ghi     R7
        str     sp
        ghi     R11
        ADC             ;calculate the high byte
        phi     R11
        ldn     R11
        plo     R11
        ldi     0
        phi     R11
        glo     R11
        ANI     (15)#256
        plo     R11
        ghi     R11
        ANI     (15)>>8; was/256
        phi     R11
	;removed ?	cpy2 R11,R11
        glo     R11
        plo     R5
;	out(7,m2); out(7,m1);
        RLDI    R12,7
        glo     R5
        plo     R13
        ldi     0
        phi     R13
        SCAL    6
        dw      _OUT
        RLDI    R12,7
        glo     R6
        plo     R13
        ldi     0
        phi     R13
        SCAL    6
        dw      _OUT
;	for (i=6;i!=0;i--) out(7,15);
        RLDI    R4,6
	lbr L23
L20:
        RLDI    R12,7
        RLDI    R13,15
        SCAL    6
        dw      _OUT
L21:
        dec     R4
L23:
        glo     R4
        lbnz    L20
        ghi     R4
        lbnz    L20
;}
L18:
        inc sp
        inc sp
        inc sp
        inc sp
        inc     sp
        RLXA    R7
        RLXA    R6
        RLXA    R5
        lda     sp
        phi     R4
        ldn     sp
        plo     R4
        sret    6
;$$function end$$ _dispmemloc
;$$function start$$ _dispm2
_dispm2:		;framesize=8
        RSXD    R7
        dec sp
        dec sp
        dec sp
        dec sp
        glo     SP
        adi     ((8+1))#256
        plo     MEMADDR
        ghi     SP
        adci    ((8+1))>>8; was/256
        phi     MEMADDR
        ghi     R12
        str     memAddr
        inc     memAddr
        glo     R12
        str     memAddr
;void dispm2(unsigned int loc){
;	initleds();
;	disp2(loc);
 req
 seq
 dec 2
 out 7
 req
        glo     SP
        adi     ((8+1))#256
        plo     MEMADDR
        ghi     SP
        adci    ((8+1))>>8; was/256
        phi     MEMADDR
        lda     memAddr
        phi     R11
        ldn     memAddr
        plo     R11
        glo     R11
        plo     R12
        ldi     0
        phi     R12
        SCAL    6
        dw      _DISP2
;	for (i=6;i!=0;i--) out(7,15);
        RLDI    R7,6
	lbr L29
L26:
        RLDI    R12,7
        RLDI    R13,15
        SCAL    6
        dw      _OUT
L27:
        dec     R7
L29:
        glo     R7
        lbnz    L26
        ghi     R7
        lbnz    L26
;}
L24:
        inc sp
        inc sp
        inc sp
        inc sp
        inc     sp
        lda     sp
        phi     R7
        ldn     sp
        plo     R7
        sret    6
;$$function end$$ _dispm2
;$$function start$$ _main
_main: ;copt is peeping your size 6 frame with oct 23 rules
        dec sp
        dec sp
        dec sp
        dec sp
;{
;	disp42();
        SCAL    6
        dw      _DISP42
;	delay(1000);
        RLDI    R12,1000
        SCAL    6
        dw      _DELAY
;	dispmemloc(0);
        ldi     0
        plo     R12
        phi     R12
        SCAL    6
        dw      _DISPMEMLOC
;	delay(1000);
        RLDI    R12,1000
        SCAL    6
        dw      _DELAY
;	dispm2(0x25);
        RLDI    R12,37
        SCAL    6
        dw      _DISPM2
;	delay(1000);
        RLDI    R12,1000
        SCAL    6
        dw      _DELAY
	lbr L32
L31:
;	while(1){
;		out(1,1); //activate top row of keys
        RLDI    R11,1
        glo     R11
        plo     R12
        ghi     R11
        phi     R12
        glo     R11
        plo     R13
        ghi     R11
        phi     R13
        SCAL    6
        dw      _OUT
;		if(ef1()){ //key 12 pressed
        SCAL    6
        dw      _EF1
        glo     R15
        plo     R11
        ghi     R15
        phi     R11
        ldi     0
        phi     R11
        glo     R11
        lbnz    +
        ghi     R11
        lbz     L34
+
;			disp12();
        SCAL    6
        dw      _DISP12
;		} else if(ef2()){//key 8
	lbr L35
L34:
        SCAL    6
        dw      _EF2
        glo     R15
        plo     R11
        ghi     R15
        phi     R11
        ldi     0
        phi     R11
        glo     R11
        lbnz    +
        ghi     R11
        lbz     L36
+
;			dispmemloc(01);
        RLDI    R12,1
        SCAL    6
        dw      _DISPMEMLOC
;		}else{
	lbr L37
L36:
;			dispmemloc(02);;
        RLDI    R12,2
        SCAL    6
        dw      _DISPMEMLOC
;		}
L37:
L35:
;	}
L32:
;	while(1){
	lbr L31
L38:
;	while(1);
L39:
	lbr L38
;}
L30:
        inc sp
        inc sp
        inc sp
        inc sp
        sret    6
;$$function end$$ _main
;$$function start$$ _delay
_delay:		;framesize=10
        RSXD    R6
        RSXD    R7
        dec sp
        dec sp
        dec sp
        dec sp
        glo     R12
        plo     R7
        ghi     R12
        phi     R7
;void delay(unsigned int howlong){
;	for (i=1;i!=howlong;i++){
        RLDI    R6,1
	lbr L45
L42:
;		oneMs();
        SCAL    6
        dw      _ONEMS
;	}
L43:
;	for (i=1;i!=howlong;i++){
        inc     R6
L45:
        dec     sp
        glo     R7
        str     sp
        glo     R6
        sm
        inc     sp
        lbnz    L42
        dec     sp
        ghi     R7
        str     sp
        ghi     R6
        smb
        inc     sp
        lbnz    L42
;}
L41:
        inc sp
        inc sp
        inc sp
        inc sp
        inc     sp
        RLXA    R7
        lda     sp
        phi     R6
        ldn     sp
        plo     R6
        sret    6
;$$function end$$ _delay
;$$function start$$ _olduinoincluder
_olduinoincluder:		;framesize=2
;void olduinoincluder(){
;	asm("\tinclude olduino.inc\n");
;Feb 8 2013, first version of assembler routines for olduino support	
;may 31 - incredibly, there's an error in digitalWrite.  lda2 changed to ldAD
;digitalWrite(unsigned char n, unsigned char hilo){ //set a bit in the output port on or off
	align 64	;needed to make sure all on same page
_digitalWrite:
	glo regArg1	;get the bit number
	adi $$bvtable&255	;add the table offset
	plo memaddr
	ghi RPC		;get the top byte of the current page
	phi memaddr	
	ldn memaddr	;pick up the bit pattern
	plo rt1		;save it in a temp
        RLDI    MEMADDR,_PIN4
	sex memaddr	;prepare to change it
	glo regArg2	;get on/off switch
	bz $$setbitoff
; here we have the bit pattern in rt1 and we're ready to apply it with OR
	glo rt1		;get the bit value back
	or		;apply it
	str memaddr	;and save it
	br $$outit	;go fnish up
$$setbitoff:
	glo rt1		;get the bit pattern
	xri 0xff	;reverse it
	and		;combine it with the existing pin value
	str memaddr	;and save it
;here we gave set/reset the correct bit in PIN4 and we just have to send it out
$$outit:
	out 4		;X was already set to memaddr
	sex sp		;reset X
        sret    6
$$bvtable db 1,2,4,8,16,32,64,128	;table of bit values
;int digitalRead(unsigned char pin){//for now this will always read ef3
	align 8	;protect jump boundary
_digitalRead:
	ldi 0		;default is false
	plo R15
	phi R15
	b3 +		;i have to reverse the sense of the external line
	inc R15		;if external line is high, supply a 1
        sret    6
;}
L46:
        sret    6
;$$function end$$ _olduinoincluder
;lcc1802Epilog.inc initialization and runtime functions needed for lcc1802 programs
;Dec 21 2012 - out5/putc moved to separate putc.inc for christmas compiler
;this is the version published with the lcc1802121229 release
;jan 1 2013 incleasing stack beginning lcation to 3fff (16K)
;jan 2 removed test routines, moved code not needing short branches to before the align 256
;jan 11 going back to SCRT conventions for NG compiler
;Jan 21 adding _mulu4 32 bit multiplication - really s.b. mulI4
;Jan 28 archived before beginning work on Birthday Compiler
;Feb 5 dubdab algorithm being brought in for ltoa itoa
;Feb 12 fixed bugs in modi2/u2
;feb 27 changed stack to start at 7fff
;mar 3, 2013 saved as epiloNO for optimization round
;mar 28,2013 - LCCepilofl.inc changes scrt to standard big-endian stack
;april 4 adding digit count argument to dubdabx
;Oct 2, 2013 redoing mulu2 for faster results with small arg1 - dhrystone
;oct 12 divu2 redone for faster perf on small numbers, remainder now in regarg1 - modu2/modi2 changed to match
;16-09-20 allow stack relocation 
;16-11-26 calculate onems delay from cpu speed in LCC1802CPUSPEED
;17-03-07 adjusting stack offset for 1805/6 stack discipline
;17-03-13 protecting work areas in divi2,divi4 routines from 1806 SCAL
;17-03-15 onems compensates for reduced subroutine overhead in 1806
;17-04-09 don't include call/return for 1806
rwork	equ	memAddr	;work register
lcc1802init:	
        RLDI    RCALL,$$_DIE
        RLDI    RRET,$$_DIE
        RLDI    SP,LCCSTACKLOC
	sex	SP
        RLDI    RPC,$$_00000
	sep	RPC
$$_00000:
        SCAL    6
        dw      _MAIN
$$_die:	lbr	$$_die		;loop here when main returns
	db	0xde,0xad
;the following routines don't have short jumps and don't need to worry about alignment
_setqOn:
	seq
        sret    6
_setqOff:
	req
        sret    6
_out4:	
	glo	regArg1
	dec	sp
	str	sp
	out	4
        sret    6
;the following routines have short branches so all the code has to stay within the same page
	align 256
_oneMs:		;execute 1ms worth of instructions including call(15)/return(10) sequence. takes about 1 ms
;subroutine overhead soaks up 27 instruction time.
;each loop is 2 instruction times
;so the number of loops needed is 
;CPU speed/16000 less the 27 all divide by two
LCC1802SUBOVHD  EQU 14		;1806 SCAL/SRET subroutine overhead
	ldi	(LCC1802CPUSPEED/1000/16-LCC1802SUBOVHD)/2
$$mslp:	smi	1
	bnz	$$mslp
        sret    6
;IO1802.inc contains input/output runtime routines for LCC1802
;The port is in regArg1, the output byte is in regArg2
	align 64
_putc:
_out5:	
	glo	regArg1
	dec	sp
	str	sp
	out	5
        sret    6
_inp:		;raw port input
		;stores a small tailored program on the stack and executes it
	dec	sp	;work backwards
	ldi	0xD3	;return instruction
	stxd		
	glo	regarg1	;get the port number
	ani	0x07	;clean it
	bz	+	; inp(0) isn't valid
	ori	0x68	;make it an input instruction
	stxd		;store it for execution
        glo     SP
        plo     RT1
        ghi     SP
        phi     RT1
	inc	rt1	;rt1 points to the 6x instruction
	sep	rt1	;execute it
;we will come back to here with the input byte in D
	inc	sp	;step over the work area
	plo	retVal	;save it to return
	ldi	0
	phi	retval	;clear top byte
+	inc	sp	;need to get rid of the 6x instruction
	inc	sp	;and the D3
        sret    6
_out:		;raw port output
		;stores a small tailored program on the stack and executes it
		;this could be bolder:
		;store the program as 6x cc D5 where x is the port number and cc is the char
		;then SEP sp
		;the D5 would return to the calling program and finish fixing the stack.
		;saves 6 instructions but it's a bit tricky.
	dec	sp	;work backwards
	ldi	0xD3	;return instruction
	stxd		
        glo     SP
        plo     RT1
        ghi     SP
        phi     RT1
	glo	regarg1	;get the port number
	ani	0x07	;clean it
	ori	0x60	;make it an out instruction - 60 is harmless
	stxd		;store it for execution
	glo	regarg2	;get the byte to be written
	str	sp	;store it where sp points
	sep	rt1	;execute it
;we will come back to here with sp stepped up by one
+	inc	sp	;need to get rid of the 6x instruction
	inc	sp	;and the D3
        sret    6

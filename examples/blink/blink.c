/*
    blink the q led
*/
#include "test.h"

#include <olduino.h>

void mysetqOn(){
	asm("	seq\n");
}

void main()
{
	int i = TEST;
	while(i == TEST){
		mysetqOn();
		delay(500);
		setqOff();
		delay(500);
	}
}

#include <olduino.c> //for the delay routine

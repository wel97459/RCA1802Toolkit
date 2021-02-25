#line 1 "blink.c"
 
#line 4 "blink.c"
#line 1 "./test.h"


#line 5 "blink.c"

#line 1 "/home/winston/build/lcc1802/bin//include/olduino.h"



	void delay(unsigned int);
	void digitalWrite(unsigned char,unsigned char);
	int digitalRead(unsigned char);
	unsigned char PIN4=0;





#line 7 "blink.c"

void mysetqOn(){
	asm("	seq\n");
}

void main()
{
	int i = 10;
	while(i == 10){
		mysetqOn();

		setqOff();

	}
}

void delay(unsigned int howlong){
	unsigned int i;
	for (i=1;i!=howlong;i++){
		oneMs();
	}
}


void olduinoincluder(){
	asm("\tinclude olduino.inc\n");





}



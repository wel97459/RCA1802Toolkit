/*
    terminal example by Marcel van Tongoren 
*/

#include <stdint.h>
#include <nstdlib.h>
#include <cosmacelf.h>

#include "devkit/video/pixie_video.h"


#define X_SIZE 64
#define Y_SIZE 32

static const uint8_t shape_o[] =
{
	0x04,
	0x80, 0x00, 0x00, 0x00
};

typedef struct
{
  volatile unsigned char vram[256];
} Vram_Pointer;

#define VRAM  ((Vram_Pointer*)(0x0F00))

uint8_t x, y, xd=1, yd=1, delay;

void checkX(){
		if(x < 2)
		xd=1;
		if(x > X_SIZE-5)
		xd=255;
}

void checkY(){
		if(y < 4)
		yd=1;
		if(y > Y_SIZE-5)
		yd=255;	
}

void main(){
	
	initvideo();

	for (x = 0; x < 208; x++)
	{
	 	VRAM->vram[x] = cosmacelfbytes[x];
	}

	x = (int) (X_SIZE/2);
    y = (int) (Y_SIZE/2);                   // Set x and y to middle of screen

	drawsprite(x, y, shape_o);
	while (1) {
		checkX();
		checkY();			
		drawsprite(x, y, shape_o);
		 	x+=xd;
			y+=yd;
		//drawsprite(x, y, shape_o);
	}
}

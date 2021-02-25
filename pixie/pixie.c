/*
    terminal example by Marcel van Tongoren 
*/
#define __VIP__

//#include <stdint.h>
//#include <nstdlib.h>

//#include "devkit/video/pixie_video.h"


#define X_SIZE 16
#define Y_SIZE 8

 #define test 0

 #if test == 1
    void testing()
	{
		int i = 1;
		return;
	}
#endif

// static const uint8_t shape_o[] =
// {
// 	0x66, 0x99, 0x99, 0x66, 0x66, 0x99, 0x99, 0x66, 0x66, 0x99, 0x99, 0x66, 0x66, 0x99, 0x99, 0x66
// };

// static const uint8_t shape_space[] =
// {
// 	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
// };

void main(){
	int x, y, delay;
    unsigned char key;

//	initvideo();

	x = (int) (X_SIZE/2);
    y = (int) (Y_SIZE/2);                   // Set x and y to middle of screen

//	drawtile (x, y, shape_o);

	while (1) {
//		drawtile (x, y, shape_o);
	}
}

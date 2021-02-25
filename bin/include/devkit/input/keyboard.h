#ifndef _KEYBOARD_H
#define _KEYBOARD_H
 
//keyboard_encoder header

#include "devkit/system/flags.h"

#ifdef __CIDELSA__
#include "devkit/input/joystick.h"
#define kbhit() get_stick();  
#else
uint8_t cgetc();
int kbhit();  
#endif

void keyboard_includer(){
asm(" include devkit/input/keyboard.inc\n");
}

#endif // _KEYBOARD_H

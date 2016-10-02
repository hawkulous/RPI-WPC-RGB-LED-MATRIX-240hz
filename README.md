# RPI-WPC-RGB-LED-MATRIX-240hz
Raspberry PI  B+ project for displaying WPC DMD images on RGB LED matrix 
This will only work with RPI B+ , you need 2 32x64 led matrix displays , 1 CD4050 buffer for the DMD signals, and 2 74hct245 buffer chips to change the level of the RPI gpio signals.
PINS are in the .rpi file all signals from WPC pinball machine goes through cd4050 al signals from rpi to RGB LED Matrix goes through 74hct245. You need a 5v psu with 2A and above power. 
Can change brightness and colour in the .rpi file last 3 lines.

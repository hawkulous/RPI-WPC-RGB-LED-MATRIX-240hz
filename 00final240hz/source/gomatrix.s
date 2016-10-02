.globl gomatrix
.include "GPregisters.rpi"
gomatrix:




//r1 is passed from setup to main to here

ldr r8,=DMA0CONBLKAD
str r12,[r8] // store ctrl block address in DMA0CONBLKAD blah 

ldr r8,=DMA0CS
// now let us fire this puppy up
mov r9,#1
ldr r7,[r8]
orr r7,r7,r9 //orr r7 with 1 to set bit 0 to 1
str r7,[r8]
//////////////////////////////////////////////////////////////




mov pc,lr

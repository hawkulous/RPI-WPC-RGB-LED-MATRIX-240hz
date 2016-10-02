.globl gomatrix1
.include "GPregisters.rpi"
gomatrix1:




//r1 is passed from setup to main to here


ldr r8,=DMA1CONBLKAD

str r12,[r8] // store ctrl block address in DMA1CONBLKAD blah 

ldr r8,=DMA1CS
// now let us fire this puppy up
mov r9,#1
ldr r7,[r8]
orr r7,r7,r9 //orr r7 with 1 to set bit 0 to 1
str r7,[r8]




mov pc,lr

.section .data
    .align 4
   DMAFRAME:
    .rept 128
    .word 1024      //GPCLR  clock low
    .word 129024    //GPCLR  clear rgbrgb
    .word 67584     //GPSET --R0 and B1
    .word 1024      //GPSET clock high
    .endr
    .word 1024     //GPCLR clock low
    .word 512      //GPSET oe high
    .word 1966080  //GPCLR ABCD low
    .word 0x60000       //GPSET ABCD row
    .word 256      //GPSET LATCH high
    .word 256      //GPCLR LATCH low
    .word 512      //GPCLR oe low
    .word 512      //GPSET oe high


    DMAFRAME1:
    .rept 128
    .word 1024      //GPCLR  clock low
    .word 129024    //GPCLR  clear rgbrgb
    .word 67584     //GPSET --R0 and B1
    .word 1024      //GPSET clock high
    .endr
    .word 1024     //GPCLR clock low
    .word 512      //GPSET oe high
    .word 1966080  //GPCLR ABCD low
    .word 0x60000       //GPSET ABCD row
    .word 256      //GPSET LATCH high
    .word 256      //GPCLR LATCH low
    .word 512      //GPCLR oe low
    .word 512      //GPSET oe high

    

    DMABUFFER:
    .rept 4096
    .word 0
    .endr
    DMABUFFER1:
    .rept 4096
    .word 0
    .endr

   DMABLOCK:
    .word 0
    
    DMABLOCK1:
    .word 0
   


     .section .init
.globl _start
_start:


b main

.section .text
.include "GPregisters.rpi"
main:

mov sp,#0x8000

/// setup the pins for input

bl setupgpio



//start with OE high so screen is off to start with
ldr r1,=OE
bl bankhigh        



ldr r0,=DMAFRAME
ldr r1,=DMABUFFER
bl matrixdmasetup
//r1 is DMA control block store it to mem for ease
ldr r0,=DMABLOCK
str r1,[r0]

ldr r0,=DMAFRAME1
ldr r1,=DMABUFFER1
bl matrixdmasetup1
//r1 is DMA control block store it to mem for ease
ldr r0,=DMABLOCK1

str r1,[r0]




recur:
ldr r0,=DMABLOCK
ldr r1,[r0]
ldr r0,=DMABLOCK1
ldr r2,[r0]
ldr r0,=DMABUFFER
bl capturedmd



b recur

	

	
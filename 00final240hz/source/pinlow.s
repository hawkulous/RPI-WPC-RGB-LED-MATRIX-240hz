.globl pinlow
.include "GPregisters.rpi"
pinlow:
ldr r0,=GPCLR0
str r1,[r0]
mov pc,lr

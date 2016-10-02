.globl bankhigh
.include "GPregisters.rpi"
bankhigh:
ldr r0,=GPSET0
str r1,[r0]
mov pc,lr

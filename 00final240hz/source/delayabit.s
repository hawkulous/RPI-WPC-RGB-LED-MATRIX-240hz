.globl delayabit
delayabit:

loopmyweer:
sub r3,#1
cmp r3,#1
bne loopmyweer
mov pc,lr

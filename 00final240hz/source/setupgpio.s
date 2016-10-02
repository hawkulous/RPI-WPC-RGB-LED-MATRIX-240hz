.globl setupgpio

setupgpio:
push {lr}
//mov r0,the pinnumber
// mov r1, the function it will be input yeeeah
// PIN2 for clock,PIN3 for DATA,PIN4 for framestart, PIN5,6,7 for the 74hct393 counter q0,q1,q2
// PIN 567 will be redundant when there is no clock glitches
mov r1,#0
mov r0,#2
bl SetGpioFunction
mov r1,#0
mov r0,#3
bl SetGpioFunction
mov r1,#0
mov r0,#4
bl SetGpioFunction
mov r1,#0
mov r0,#5
bl SetGpioFunction
mov r1,#0
mov r0,#6
bl SetGpioFunction
mov r1,#0
mov r0,#7
bl SetGpioFunction

//output for led dispaly pin 8-21
mov r1,#1
mov r0,#8
bl SetGpioFunction

mov r1,#1
mov r0,#9
bl SetGpioFunction

mov r1,#1
mov r0,#10
bl SetGpioFunction

mov r1,#1
mov r0,#11
bl SetGpioFunction

mov r1,#1
mov r0,#12
bl SetGpioFunction

mov r1,#1
mov r0,#13
bl SetGpioFunction

mov r1,#1
mov r0,#14
bl SetGpioFunction

mov r1,#1
mov r0,#15
bl SetGpioFunction

mov r1,#1
mov r0,#16
bl SetGpioFunction

mov r1,#1
mov r0,#17
bl SetGpioFunction

mov r1,#1
mov r0,#18
bl SetGpioFunction

mov r1,#1
mov r0,#19
bl SetGpioFunction

mov r1,#1
mov r0,#20
bl SetGpioFunction

mov r1,#1
mov r0,#21
bl SetGpioFunction


//tada
// pulldown
.equ GPPUD,0x20200094
.equ GPPUDCLK0,0x20200098

ldr r2,=GPPUD
ldr r3,=GPPUDCLK0
mov r1,#1    //pulldown 1 , up is 2
str r1,[r2]
.rept 150
mov r1,#0
.endr
ldr r1,=0xffffffff
str r1,[r3]
.rept 150
mov r1,#0
.endr
mov r1,#0
str r1,[r2]
str r1,[r3]  

pop {lr}
mov pc,lr

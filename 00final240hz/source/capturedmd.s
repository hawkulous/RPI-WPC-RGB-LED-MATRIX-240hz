.section .data
firsthalf:
.rept 2048
.word 0
.endr

.globl capturedmd
.include "GPregisters.rpi"
capturedmd:
mov r10,r2

buffer .req r0
dmablock   .req r1
pinlev0 .req r2
clockpin .req r3
datapin .req r4
fspin .req r5
test .req r6
counter .req r7
counter2 .req r11
counter3 .req r12
rowcounter .req r9
ldr pinlev0,=GPLEV0
ldr clockpin,=PIN2
ldr datapin,=PIN3
ldr fspin,=PIN4

ldr r8,=GPHEN0
ldr test,=PIN5
str test,[r8]

ldr r8,=GPREN0
ldr test,=PIN4
str test,[r8]


///////////////1 st frame capture START 
rinse:



//look framestart high
ldr fspin,=PIN4

/*
 ///normal polling way
lookfspin:
    ldr test,[pinlev0]
    tst test,fspin
    beq lookfspin
*/

 
  
    ldr r8,=GPEDS0
    lookfspin:
    ldr test,[r8]
    tst test,fspin
    beq lookfspin
    str fspin,[r8] 
   
//fspin will be DMD latch now
ldr fspin,=PIN5 
mov counter,#0
mov counter2,#0
mov rowcounter,#0
//clear event detect register
ldr r8,=GPEDS0
str fspin,[r8]

// set control block address
mov counter3,r10    
    
keeplooking:

cmp counter2,#8
bgt clearevent
//clear event detect register
ldr r8,=GPEDS0
str fspin,[r8]

clearevent:

//look high clock      
lookclkhigh:
   ldr test,[pinlev0]
   tst test,clockpin
   beq lookclkhigh
//count tick
   tst test,datapin
   ldrne test,=COLOUR0
   moveq test,#0
   str test,[buffer,counter]

 //load test with GPEDS
   
   ldr r8,=GPEDS0
   ldr test,[r8]
   str fspin,[r8]
   tst test,fspin
   bne nextline
   ////////


  
   add counter2,#1
  cmp counter2,#128
  bne thisline
 
   nextline:
 
  add rowcounter,#1
 push {r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12}
  
 bl gomatrix1 
 //delay for DMA to end before it gets started again

 pop {r12,r11,r10,r9,r8,r7,r6,r5,r4,r3,r2,r1,r0}
 add counter3,#16640
 add counter3,#32
 mov counter2,#0

   
   thisline:
   mov counter,rowcounter
   lsl counter,#9
   mov r8,counter2
   lsl r8,#2
   add counter,r8
   
lookclklow:
   ldr test,[pinlev0]
   tst test,clockpin
   bne lookclklow
  

   
cmp rowcounter,#16
blt keeplooking 

//clear event detect register
ldr r8,=GPEDS0
str fspin,[r8]

//load control block address
 mov counter3,r1
  
 mov counter,#0
 mov rowcounter,#0
keeplooking1:

cmp counter2,#8
bgt clearevent1
//clear event detect register
ldr r8,=GPEDS0
str fspin,[r8]

clearevent1:
   
//look high clock      
lookclkhigh1:
   ldr test,[pinlev0]
   tst test,clockpin
   beq lookclkhigh1
   
//count tick
    tst test,datapin
   ldrne test,=COLOUR1
   moveq test,#0
   ldr r8,[buffer,counter]
   add test,r8
   str test,[buffer,counter]
   
   //load test with GPEDS
   
   ldr r8,=GPEDS0
   ldr test,[r8]
   str fspin,[r8]
   tst test,fspin
   bne newline
   ////////
   
  // add counter,#4
   add counter2,#1
   lookclklow1:
   ldr test,[pinlev0]
   tst test,clockpin
   bne lookclklow1



// look low clock

 cmp counter2,#128
 bne sameline

 newline:
 add rowcounter,#1
 push {r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12}
  
 bl gomatrix 
 //delay for DMA to end before it gets started again

 pop {r12,r11,r10,r9,r8,r7,r6,r5,r4,r3,r2,r1,r0}
 add counter3,#16640
 add counter3,#32
 mov counter2,#0
 sameline:
 
   mov counter,rowcounter
   lsl counter,#9
   mov r8,counter2
   lsl r8,#2
   add counter,r8



 cmp rowcounter,#16
 
 blt keeplooking1
 //////////////////// 1 st frame capture END //////
 add r0,#16384

mov counter,#0
mov counter2,#0
mov rowcounter,#0
//look framestart high

ldr fspin,=PIN4

     
/*
lookfspin2:
    ldr test,[pinlev0]
    tst test,fspin
    beq lookfspin2
*/
    ldr r8,=GPEDS0
    lookfspin2:
    ldr test,[r8]
    tst test,fspin
    beq lookfspin2
    str fspin,[r8] 


//fspin will be DMD latch now
ldr fspin,=PIN5 

//clear event detect register
ldr r8,=GPEDS0
str fspin,[r8]
//load control block address
 mov counter3,r1
    
    
keeplooking2:

cmp counter2,#8
bgt clearevent2
//clear event detect register
ldr r8,=GPEDS0
str fspin,[r8]

clearevent2:

//look high clock      
lookclkhigh2:
   ldr test,[pinlev0]
   tst test,clockpin
   beq lookclkhigh2
//count tick

    tst test,datapin
   ldrne test,=COLOUR0
   moveq test,#0
   str test,[buffer,counter]

  


 //load test with GPEDS
   
   ldr r8,=GPEDS0
   ldr test,[r8]
   str fspin,[r8]
   tst test,fspin
   bne nextline2
   ////////


   //add counter,#4
   add counter2,#1
  cmp counter2,#128
  bne thisline2
 
   nextline2:
  // add rowcounter,#1
  // mov counter2,#0
   
   

 add rowcounter,#1
 push {r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12}
  
 bl gomatrix 
 //delay for DMA to end before it gets started again

 pop {r12,r11,r10,r9,r8,r7,r6,r5,r4,r3,r2,r1,r0}
 add counter3,#16640
 add counter3,#32
 mov counter2,#0

   thisline2:
   mov counter,rowcounter
   lsl counter,#9
   mov r8,counter2
   lsl r8,#2
   add counter,r8
   
lookclklow2:
   ldr test,[pinlev0]
   tst test,clockpin
   bne lookclklow2
  

   
cmp rowcounter,#16
blt keeplooking2 

//clear event detect register
ldr r8,=GPEDS0
str fspin,[r8]

//load control block address
 mov counter3,r10
  
 mov counter,#0
 mov rowcounter,#0
 
keeplooking3:

cmp counter2,#8
bgt clearevent3
//clear event detect register
ldr r8,=GPEDS0
str fspin,[r8]

clearevent3:
   
//look high clock      
lookclkhigh3:
   ldr test,[pinlev0]
   tst test,clockpin
   beq lookclkhigh3
   
//count tick
   tst test,datapin
   ldrne test,=COLOUR1
   moveq test,#0
   ldr r8,[buffer,counter]
   add test,r8
   str test,[buffer,counter]
   
   //load test with GPEDS
   
   ldr r8,=GPEDS0
   ldr test,[r8]
   str fspin,[r8]
   tst test,fspin
   bne newline3
   ////////
   
  // add counter,#4
   add counter2,#1
   lookclklow3:
   ldr test,[pinlev0]
   tst test,clockpin
   bne lookclklow3



// look low clock

 cmp counter2,#128
 bne sameline3

 newline3:
 add rowcounter,#1
 push {r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12}
  
 bl gomatrix1 
 //delay for DMA to end before it gets started again

 pop {r12,r11,r10,r9,r8,r7,r6,r5,r4,r3,r2,r1,r0}
 add counter3,#16640
 add counter3,#32
 mov counter2,#0
 sameline3:
 
   mov counter,rowcounter
   lsl counter,#9
   mov r8,counter2
   lsl r8,#2
   add counter,r8



 cmp rowcounter,#16
 
 blt keeplooking3

sub r0,#16384
b rinse
 
mov pc,lr

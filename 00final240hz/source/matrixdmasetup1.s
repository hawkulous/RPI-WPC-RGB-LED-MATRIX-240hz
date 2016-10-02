.section .data

 .balign 32
      DMAPIXELS1:
     .rept 8500
     .word 0x200000    //ti transfer information 2d mode,no inc
     .word 0   // source fill in later
     .word 0x7E20001c   // GPSET0PHYS
     .word 0x4    //transfer length 1 word
     .word 0    //stride
     .word 0 //DMA04   //next control block
     .word 0    // no care
     .word 0    //no care
     .endr
     
     ROWCOUNT1:
     .word 0
     .word 0x20000
     .word 0x40000
     .word 0x60000
     .word 0x80000  
     .word 0xA0000
     .word 0xC0000
     .word 0xE0000
     .word 0x100000
     .word 0x120000
     .word 0x140000
     .word 0x160000
     .word 0x180000
     .word 0x1A0000
     .word 0x1C0000
     .word 0x1E0000
     
    TIMEWASTER11:
    .rept 2048
    .word 0
    .endr

   TIMEWASTER21:
    .rept 2048
    .word 0
    .endr


.globl matrixdmasetup1
.include "GPregisters.rpi"
matrixdmasetup1:




//r0 will be DMAFRAME1 from main



//buffer passed from main
mov r10,r1
mov r11,r1
 
ldr r1,=DMAPIXELS1
ldr r4,=ROWCOUNT1
mov r5,#0
loadmemore:
push {r0}
mov r3,#0
   loadmeup:
    ldr r2,=0x0000000   //ti transfer information no need to get fancy
    str r2,[r1]
    add r1,#4
    
    mov r2,r0            // source 
    str r2,[r1]
    add r1,#4
    add r0,#4

    ldr r2,=0x7E200028   // GPCLR0PHYS
    str r2,[r1]
    add r1,#4

     ldr r2,=0x4   //transfer length word
     str r2,[r1]
     add r1,#4

     ldr r2,=0    //stride
     str r2,[r1]
     add r1,#4

     mov r2,r1  //next control block
     add r2,#12
     str r2,[r1]
     add r1,#4

     ldr r2,=0    // no care
     str r2,[r1]
     add r1,#4

     ldr r2,= 0    //no care
     str r2,[r1]
     add r1,#4

      
     ldr r2,=0x0000000   //ti transfer information no need to get fancy
     str r2,[r1]
     add r1,#4

     mov r2,r0           // source 
     str r2,[r1]
     add r1,#4
     add r0,#4

     ldr r2,=0x7E200028   // GPCLR0PHYS
     str r2,[r1]
     add r1,#4

     ldr r2,=0x4    //transfer length word
     str r2,[r1]
     add r1,#4

     ldr r2,=0    //stride
     str r2,[r1]
     add r1,#4

     mov r2,r1  //next control block
     add r2,#12
     str r2,[r1]
     add r1,#4

     ldr r2,=0    // no care
     str r2,[r1]
     add r1,#4

     ldr r2,= 0    //no care
     str r2,[r1]
     add r1,#4


     
     ldr r2,=0x0000000  //ti transfer information no need to get fancy
     str r2,[r1]
     add r1,#4

     mov r2,r10            // source 
     str r2,[r1]
     add r1,#4
     add r0,#4
     add r10,#4
     
     ldr r2,=0x7E20001C  // GPSET0PHYS
     str r2,[r1]
     add r1,#4

     ldr r2,=0x4    //transfer length word
     str r2,[r1]
     add r1,#4

     ldr r2,=0    //stride
     str r2,[r1]
     add r1,#4

     mov r2,r1  //next control block
     add r2,#12
     str r2,[r1]
     add r1,#4

     ldr r2,=0    // no care
     str r2,[r1]
     add r1,#4

     ldr r2,= 0    //no care
     str r2,[r1]
     add r1,#4


      
    ldr r2,=0x0000000    //ti transfer information no need to get fancy
     str r2,[r1]
     add r1,#4

     mov r2,r0            // source 
     str r2,[r1]
     add r1,#4
     add r0,#4

     ldr r2,=0x7E20001C   // GPSET0PHYS
     str r2,[r1]
     add r1,#4

     ldr r2,=0x4    //transfer length word
     str r2,[r1]
     add r1,#4

     ldr r2,=0    //stride
     str r2,[r1]
     add r1,#4

     mov r2,r1  //next control block
     add r2,#12
     str r2,[r1]
     add r1,#4

     ldr r2,=0    // no care
     str r2,[r1]
     add r1,#4

     ldr r2,=0    //no care
     str r2,[r1]
     add r1,#4

add r3,#1
cmp r3,#128
bne loadmeup

/////// loadmeuppt2

    ldr r2,=0x0000000    //ti transfer information no need to get fancy
    str r2,[r1]
    add r1,#4
    
    mov r2,r0            // source 
    str r2,[r1]
    add r1,#4
    add r0,#4

    ldr r2,=0x7E200028   // GPCLR0PHYS
    str r2,[r1]
    add r1,#4

     ldr r2,=0x4    //transfer length word
     str r2,[r1]
     add r1,#4

     ldr r2,=0    //stride
     str r2,[r1]
     add r1,#4

     mov r2,r1  //next control block
     add r2,#12
     str r2,[r1]
     add r1,#4

     ldr r2,=0    // no care
     str r2,[r1]
     add r1,#4

     ldr r2,= 0    //no care
     str r2,[r1]
     add r1,#4


      ldr r2,=0x0000000   //ti transfer information no need to get fancy
     str r2,[r1]
     add r1,#4

     mov r2,r0            // source 
     str r2,[r1]
     add r1,#4
     add r0,#4

     ldr r2,=0x7E20001C   // GPSET0PHYS
     str r2,[r1]
     add r1,#4

     ldr r2,=0x4   //transfer length word
     str r2,[r1]
     add r1,#4

     ldr r2,=0    //stride
     str r2,[r1]
     add r1,#4

     mov r2,r1  //next control block
     add r2,#12
     str r2,[r1]
     add r1,#4

     ldr r2,=0    // no care
     str r2,[r1]
     add r1,#4

     ldr r2,= 0    //no care
     str r2,[r1]
     add r1,#4


      ldr r2,=0x0000000   //ti transfer information no need to get fancy
    str r2,[r1]
    add r1,#4
    
    mov r2,r0            // source 
    str r2,[r1]
    add r1,#4
    add r0,#4

    ldr r2,=0x7E200028   // GPCLR0PHYS
    str r2,[r1]
    add r1,#4

     ldr r2,=0x4    //transfer length word
     str r2,[r1]
     add r1,#4

     ldr r2,=0    //stride
     str r2,[r1]
     add r1,#4

     mov r2,r1  //next control block
     add r2,#12
     str r2,[r1]
     add r1,#4

     ldr r2,=0    // no care
     str r2,[r1]
     add r1,#4

     ldr r2,= 0    //no care
     str r2,[r1]
     add r1,#4


      ldr r2,=0x0000000    //ti transfer information no need to get fancy
     str r2,[r1]
     add r1,#4
    
     mov r2,r4
     add r4,#4            // source 
     str r2,[r1]
     add r1,#4
     add r0,#4




     ldr r2,=0x7E20001C   // GPSET0PHYS
     str r2,[r1]
     add r1,#4

     ldr r2,=0x4   //transfer length word
     str r2,[r1]
     add r1,#4

     ldr r2,=0    //stride
     str r2,[r1]
     add r1,#4

     mov r2,r1  //next control block
     add r2,#12
     str r2,[r1]
     add r1,#4

     ldr r2,=0    // no care
     str r2,[r1]
     add r1,#4

     ldr r2,= 0    //no care
     str r2,[r1]
     add r1,#4


      ldr r2,=0x000000    //ti transfer information no need to get fancy
     str r2,[r1]
     add r1,#4

     mov r2,r0            // source 
     str r2,[r1]
     add r1,#4
     add r0,#4

     ldr r2,=0x7E20001C   // GPSET0PHYS
     str r2,[r1]
     add r1,#4

     ldr r2,=0x4    //transfer length word
     str r2,[r1]
     add r1,#4

     ldr r2,=0    //stride
     str r2,[r1]
     add r1,#4

     mov r2,r1  //next control block
     add r2,#12
     str r2,[r1]
     add r1,#4

     ldr r2,=0    // no care
     str r2,[r1]
     add r1,#4

     ldr r2,= 0    //no care
     str r2,[r1]
     add r1,#4


      ldr r2,=0x0000000    //ti transfer information no need to get fancy
    str r2,[r1]
    add r1,#4
    
    mov r2,r0            // source 
    str r2,[r1]
    add r1,#4
    add r0,#4

    ldr r2,=0x7E200028   // GPCLR0PHYS
    str r2,[r1]
    add r1,#4

     ldr r2,=0x4    //transfer length word
     str r2,[r1]
     add r1,#4

     ldr r2,=0    //stride
     str r2,[r1]
     add r1,#4

     mov r2,r1  //next control block
     add r2,#12
     str r2,[r1]
     add r1,#4

     ldr r2,=0    // no care
     str r2,[r1]
     add r1,#4

     ldr r2,= 0    //no care
     str r2,[r1]
     add r1,#4


    ldr r2,=0x0000000    //ti transfer information no need to get fancy
    str r2,[r1]
    add r1,#4
    
    mov r2,r0            // source 
    str r2,[r1]
    add r1,#4
    add r0,#4

    ldr r2,=0x7E200028   // GPCLR0PHYS
    str r2,[r1]
    add r1,#4

     ldr r2,=0x4    //transfer length word
     str r2,[r1]
     add r1,#4

     ldr r2,=0    //stride
     str r2,[r1]
     add r1,#4

     mov r2,r1  //next control block
     add r2,#12
     str r2,[r1]
     add r1,#4

     ldr r2,=0    // no care
     str r2,[r1]
     add r1,#4

     ldr r2,= 0    //no care
     str r2,[r1]
     add r1,#4
//timewaste
ldr r2,=0x0000000    //ti transfer information no need to get fancy
     str r2,[r1]
     add r1,#4

     ldr r2,=TIMEWASTER11           // source 
     str r2,[r1]
     add r1,#4
    

     ldr r2,=TIMEWASTER21   // GPSET0PHYS
     str r2,[r1]
     add r1,#4

     ldr r2,=BRIGHTNESS  //transfer length word
     str r2,[r1]
     add r1,#4

     ldr r2,=0    //stride
     str r2,[r1]
     add r1,#4

     mov r2,r1  //next control block
     add r2,#12
     str r2,[r1]
     add r1,#4


     ldr r2,=0    // no care
     str r2,[r1]
     add r1,#4

     ldr r2,= 0    //no care
     str r2,[r1]
     add r1,#4

//time
       
     ldr r2,=0x0000000    //ti transfer information no need to get fancy
     str r2,[r1]
     add r1,#4

     mov r2,r0            // source 
     str r2,[r1]
     add r1,#4
     add r0,#4

     ldr r2,=0x7E20001C   // GPSET0PHYS
     str r2,[r1]
     add r1,#4

     ldr r2,=0x4    //transfer length word
     str r2,[r1]
     add r1,#4

     ldr r2,=0    //stride
     str r2,[r1]
     add r1,#4

    // mov r2,r1  //next control block
    // add r2,#12
   //  str r2,[r1]
   //  add r1,#4
   
      mov r2,#0 //next control block
     // add r2,#12
      str r2,[r1]
      add r1,#4


     ldr r2,=0    // no care
     str r2,[r1]
     add r1,#4

     ldr r2,= 0    //no care
     str r2,[r1]
     add r1,#4
     
pop {r0}

add r5,#1
cmp r5,#16
bne loadmemore

       




///////
//last control block redo
     sub r1,#12
     mov r2,#0
     str r2,[r1]
     


/////


// enable dma 0+1 

ldr r8,=DMAENABLE
mov r9,#3
str r9,[r8]
/////////////////////////////////////////////////////////////


//pass address of DMA control block to main
ldr r1,=DMAPIXELS1

mov pc,lr

.text

      main:

       la  $t0,0xFFFF0011  

       la  $a0,contador    
       lw  $t1,0($a0)
 
       li  $t9,0       


       la  $t2, digitos    

     loop:
          lw  $t3,0($t2)
          sb  $t3, 0($t0)         
          addi    $t9,$t9,1   
          addi    $t2,$t2,4   

          blt     $t9,$t1,loop


.data
        digitos:    .word 0x3F,0x6,0x5B,0x4F,0x66,0x6D,0x7D,0x7,0x7F,0x67,0x77,0x7F,0x39,0x3F,0x79,0x71
        contador:   .word 0xf

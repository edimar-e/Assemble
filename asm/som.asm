.text 
   li $a1,10000  # tempo
   li $a0,60     # frequencia
   li $a2,127   # instrumento
   li $a3,125    # volume
   li $v0,31
   syscall 
   
   
   
   
   lb $a0,str
   add $a0,$a0,32
   li $v0, 11
   syscall 
   
   
 
 

.data
    str: .space 20
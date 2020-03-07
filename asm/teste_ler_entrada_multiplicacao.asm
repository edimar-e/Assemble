.data

.text
       
   R.1:
       
       li $v0, 5   #  le inteiro
       syscall 
       bge  $v0,5,F_mul  # comparador em teste
       j fim
   F_mul:
       mul $s0, $v0, 2
       li $v0, 1
       move $a0, $s0
       syscall 
   fim:
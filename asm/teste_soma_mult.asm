.text
  
  multiplica:
    li $v0,5        #load imediata sevi�o 5 ler inteiro
    syscall           
    sw $v0,A        #store word valor de entrada que esta em $v0 em A
    
    li $v0,5        # le outro numero e armazena me B
    syscall
    
    lw $s0,A        # para fezer uma multiplica�ao de A  � nescessario collocar o seu valore em registrador      
    mul $s3,$s0,$v0  # coloca o resultado da multiplica��o em $s3
    
    la $a0,($s3)      #para imprimir $s3 coloca-se o seu endere�o em $a0
    li $v0,1          
    syscall     
     
 teste:      
    li $v0,5
    syscall
    mul $s5,$v0,2
    la $a0,($s5)
    li $v0,1
    syscall
    


.data
    A: .word 
    B: .word 
    C: .word 
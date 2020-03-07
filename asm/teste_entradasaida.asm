.text
     test:
          li $v0,4      #  serviso imprimir mensagem
          la $a0,text
          syscall       #chamaada para serviço 4, carregado em $a0 o endereço da mensagem                
          
          
          li $v0,5     #serviço 5 ler inteiro.
          syscall 
          move $s0,$v0
          
          li $v0,5     #serviço 5 ler inteiro.
          syscall 
          move $s1,$v0
          
          li $v0,5     #serviço 5 ler inteiro.
          syscall 
          move $s2,$v0
          
          li $v0,5     #serviço 5 ler inteiro.
          syscall 
          move $s3,$v0
          
          li $v0,5     #serviço 5 ler inteiro.
          syscall 
          move $s4,$v0
          
          li $v0,5     #serviço 5 ler inteiro.
          syscall 
          move $s5,$v0
          
          li $v0,5     #serviço 5 ler inteiro.
          syscall 
          move $s6,$v0
          
          li $v0,5     #serviço 5 ler inteiro.
          syscall 
          move $s7,$v0
          
          li $v0,5     #serviço 5 ler inteiro.
          syscall 
          move $t8,$v0
          
          

          
         
.data  
    text: .asciiz "Digite 10 numeros.\n "
    

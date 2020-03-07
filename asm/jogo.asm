.text
    
     li $s7,9       # numero oculto.      
     li $s4,3       # $s4 recebe 3 para comparar com o numero de tentativas($s3) . 
     li $s5,2       # $s5 recebe 2 para comparar com o numero de tentativas ($s3).
     li $s6,0       # $s6 é o numero de tentativas e começa em zero.
     
     comeco:
            
           li $v0,4      # imprimir texto de entrada e anucia primeira chance.
           la $a0,text1
           syscall       
            
     inserir_numero:        
           li $v0,5        #serviço 5 ler inteiro le o numero digitado pelo usuario. 
           syscall       
           sw $v0,A 
          
           
     compara:
           lw $v0,A
           add $s6,$s6,1         # complementa o numero de tentativas($s3)
           beq $s7,$v0,venceu    # se o numero de entrada $vo for igual ao numero oculto($s7=9) vai para venceu e logo após para o fim.
           beq $s6,$s5,perdeu2   # se o numero de tentatias for dois e ainda não acertou o numero oculto então vai para perdeu2.  
           beq $s6,$s4,perdeu_definitivo   # se o numero de tentativas for três e ainda não acertou o numero oculto vai para perdeu_definitivo.           
           j perdeu1                       # se o numero de tentativas for um então vai para perdeu1. 
           
     perdeu1:            # mensagem segunda chance e vai para nova inserção de umero.
           li $v0,4
           la $a0,textper1
           syscall
           j inserir_numero
           
     perdeu2:            # mensagem de ultima chance e vai para ova inserção de numero.
           li $v0,4
           la $a0,textper2
           syscall
           j inserir_numero
          
     perdeu_definitivo:  # mensagem de perdeu definitivamente, as chances se acabaram então vai para o fim do programa.
           
          
           li $a1,10000  # tempo
           li $a0,18     # frequencia
           li $a2,0      # instrumento
           li $a3,125    # volume
           li $v0,31
           syscall 
           
           li $v0,4
           la $a0,textper3
           syscall
           j fim         

           
     venceu:
                       
           li $v0,4 
           la $a0,textven
           syscall      
   
     fim: 
        
                          
        
           
.data
     A:        .space 4
     text1:    .asciiz "Bem vino ao jogo de adivinhação!!!\nVocê tem três chances para acertar o numero oculto.\nEle é inteiro e está entre 1 e 10 \nUse sua primeira chance.\n "
     textper1: .asciiz "Você errou\nUse sua segunda chance.\n"
     textper2: .asciiz "Você errou.\nUse sua ultima chance\n"
     textper3: .asciiz "Você perdeu suas chances acabaram\n"
     textven:  .asciiz "Parabéns você venceu\n"

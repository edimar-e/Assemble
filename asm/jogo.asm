.text
    
     li $s7,9       # numero oculto.      
     li $s4,3       # $s4 recebe 3 para comparar com o numero de tentativas($s3) . 
     li $s5,2       # $s5 recebe 2 para comparar com o numero de tentativas ($s3).
     li $s6,0       # $s6 � o numero de tentativas e come�a em zero.
     
     comeco:
            
           li $v0,4      # imprimir texto de entrada e anucia primeira chance.
           la $a0,text1
           syscall       
            
     inserir_numero:        
           li $v0,5        #servi�o 5 ler inteiro le o numero digitado pelo usuario. 
           syscall       
           sw $v0,A 
          
           
     compara:
           lw $v0,A
           add $s6,$s6,1         # complementa o numero de tentativas($s3)
           beq $s7,$v0,venceu    # se o numero de entrada $vo for igual ao numero oculto($s7=9) vai para venceu e logo ap�s para o fim.
           beq $s6,$s5,perdeu2   # se o numero de tentatias for dois e ainda n�o acertou o numero oculto ent�o vai para perdeu2.  
           beq $s6,$s4,perdeu_definitivo   # se o numero de tentativas for tr�s e ainda n�o acertou o numero oculto vai para perdeu_definitivo.           
           j perdeu1                       # se o numero de tentativas for um ent�o vai para perdeu1. 
           
     perdeu1:            # mensagem segunda chance e vai para nova inser��o de umero.
           li $v0,4
           la $a0,textper1
           syscall
           j inserir_numero
           
     perdeu2:            # mensagem de ultima chance e vai para ova inser��o de numero.
           li $v0,4
           la $a0,textper2
           syscall
           j inserir_numero
          
     perdeu_definitivo:  # mensagem de perdeu definitivamente, as chances se acabaram ent�o vai para o fim do programa.
           
          
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
     text1:    .asciiz "Bem vino ao jogo de adivinha��o!!!\nVoc� tem tr�s chances para acertar o numero oculto.\nEle � inteiro e est� entre 1 e 10 \nUse sua primeira chance.\n "
     textper1: .asciiz "Voc� errou\nUse sua segunda chance.\n"
     textper2: .asciiz "Voc� errou.\nUse sua ultima chance\n"
     textper3: .asciiz "Voc� perdeu suas chances acabaram\n"
     textven:  .asciiz "Parab�ns voc� venceu\n"

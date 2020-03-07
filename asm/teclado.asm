.text

.globl main

main:  
	iniciaColunas:
	li $t0, 1                   # t0 <- conta a coluna
	
	proximaColuna:
	sb $t0, 0XFFFF0012          # aciona a coluna
	lb $a0, 0xFFFF0014          # recebe coluna.linha
	beqz $a0, atualizaColuna    # se nenhuma tecla for pressionada, desvia para atualiza coluna
	jal escreveValor            # tecla pressionada, va para escreveValor
	
	esperaLiberarTecla:
	sb $t0, 0xFFFF0012             # aciona coluna
	lb $a0, 0xFFFF0014             # recebe coluna lida
	bnez $a0, esperaLiberarTecla   # se tecla continua pressionada continue no laço
	
	atualizaColuna:
	sll $t0, $t0,1                                # aciona proxima coluna   desloca o bit 1 uma posicao para esq.
	and $t1, $t0, 0x00000010                      # isola o bit 4
	bnez $t1, iniciaColunas                       # Se 1, acabou as colunas 
	j proximaColuna                               # nao acabou colunas, va para proxima coluna
	
	escreveValor:
	sub $sp, $sp,4                     # ajusta pilha para receber 1 item de 4 bytes
	sw $ra, 0($sp)                     # guarda o endereço de retorno
	la $t2, valorLido                  # t2 <- endereço base da tabela valorLido
	la $t4, caracterTeclado            # t4 <- endereço base da tabela com os caracteres do teclado
	
	procuraCodigo:
	lb, $t3, 0($t2)                     # t3 <- byte da tabela valorLido
	beqz $t3, restauraPilha             # se t3=0, chegou o fim da tabela, desvia para restaura pilha
	beq $t3, $a0, apresentaTecla        # apresenta a tecla pressionada
	add $t2, $t2, 1                     # aponta para procimo codigo
	add $t4, $t4, 1                     # aponta para o proximo caracter de caracterTeclado
	j procuraCodigo
	
	apresentaTecla:
	li $v0, 11        # serviço 11 imprime caracter
	lb $t4, 0($t4)    # t4 <- caracter databela de caracteres
	move $a0, $t4     # $a0 recebe caracter a ser apresentado 
	syscall           # chamada ao sistema
	
	restauraPilha:
	lw $ra, 0($sp)   # restaura endereço de retorno
	add $sp,$sp, 4   # liberar memoria
	jr $ra           # retorna para funcao chamadora
	
.data
    
    valorLido:
	.byte 0x11, 0x21, 0x41, 0x81
	.byte 0x12, 0x22, 0x42, 0x82
	.byte 0x14, 0x24, 0x44, 0x84
	.byte 0x18, 0x28, 0x48, 0x88
	.byte 0x00
		
    caracterTeclado:
	
 	.byte '0', '1', '2', '3'
 	.byte '4', '5', '6', '7'
 	.byte '8', '9', 'A', 'B'
 	.byte 'C', 'D', 'E', 'F'

.text                
    la  $s0,str      # load adress de [uma variavel-> string ou vetor] em $s0. SE VETOR, PARA DESLOCAR UMA POZIÇÃO (DE)COMPLEMENTA-SE 4; SE STRING CADA POSIÇÃO, SÓ SE PODE SOMAR APAGANDO AS PRIMEIRAS, UMA UNIDADE VALE UMA LETRA. 
    addi $s0,$s0,0   # complemena o poneiro para de 4 em 4 bits para selecionar o elemento do vetor 
    li $v0,4         # carrega o serviço 4 imprimir string
    la $a0,0($s0)    # carregar em $s0 para imprimir com load adress porque é string 
    syscall 
   
   
    la  $s0,vet      # load adress d vet que é um vetor            
    addi $s0,$s0,4   # tem-se o controle desse vetor com o (de)complemento de 4 de seu endereço.  
    li $v0,1         # serviço 1 imprimir interiro
    lw $a0,0($s0)    # carrega o coonteudo localizado em data .word do endereço  {[0($S0)]SIGNIFICA ENDEREÇO DE $S0}
    syscall             
    
.data
     vet: .word     1,2,3,4,,5,6                  #VETOR
     str: .ascii   "string1  Strin2\n"            #STRING  
        
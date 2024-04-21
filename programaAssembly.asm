;;1) ler 3 numeros inteiros e imprime o maior e menor deles

.LC0:
        .string "%d"                         ;; tipo dos valores recebidos
.LC1:
        .string "o Maior : %d, o menor: %d"  ;;   
main:                                        
        push    rbp                          ;; armazenar valor rbp para stack
        mov     rbp, rsp                     ;; rbp atualiza rsp
        sub     rsp, 32                      ;; reserva 32 bytes
        lea     rax, [rbp-12]                ;; rax=&a
        mov     rsi, rax                     ;; rsi = rax(&a)
        mov     edi, OFFSET FLAT:.LC0        ;; move a string da .LC0 para edi
        mov     eax, 0                       
        call    __isoc99_scanf               ;; scanf(.LC0, &a)
        lea     rax, [rbp-16]                ;; rax=&b
        mov     rsi, rax                     ;; rsi = rax(&b)
        mov     edi, OFFSET FLAT:.LC0        ;; move a string da .LC0 para edi
        mov     eax, 0                       
        call    __isoc99_scanf               ;; scanf(.LC0, &b)
        lea     rax, [rbp-20]                ;; rax=&c
        mov     rsi, rax                     ;; rsi = rax(&c)
        mov     edi, OFFSET FLAT:.LC0        ;; move a string da .LC0 para edi
        mov     eax, 0                       
        call    __isoc99_scanf               ;; scanf(.LC0, &c)
        mov     eax, DWORD PTR [rbp-12]      ;; eax=a
        mov     DWORD PTR [rbp-4], eax       ;; move maior para o "a"
        mov     eax, DWORD PTR [rbp-16]      ;; eax=b
        cmp     DWORD PTR [rbp-4], eax       ;; compara b com maior
        jge     .L2                          ;; pula pra .L2 se b for maior. Caso não seja ele, continua
        mov     eax, DWORD PTR [rbp-16]      ;; eax=b
        mov     DWORD PTR [rbp-4], eax       ;; move maior para o b
.L2:                                         ;;
        mov     eax, DWORD PTR [rbp-20]      ;; eax=c
        cmp     DWORD PTR [rbp-4], eax       ;; move maior para o c
        jge     .L3                          ;; pula pra .L3 se c for maior. Caso não seja ele,continua
        mov     eax, DWORD PTR [rbp-20]      ;; eax=c
        mov     DWORD PTR [rbp-4], eax       ;; move maior para o c
.L3:                                         ;;
        mov     eax, DWORD PTR [rbp-12]      ;; eax=a
        mov     DWORD PTR [rbp-8], eax       ;; move menor para o "a"
        mov     eax, DWORD PTR [rbp-16]      ;; eax=b
        cmp     DWORD PTR [rbp-8], eax       ;; compara valor b com menor
        jle     .L4                          ;; pula pra .L4 se b for menor. Caso não seja ele, continua
        mov     eax, DWORD PTR [rbp-16]      ;; eax=b
        mov     DWORD PTR [rbp-8], eax       ;; move menor para o b
.L4:                                      
        mov     eax, DWORD PTR [rbp-20]      ;; eax=c
        cmp     DWORD PTR [rbp-8], eax       ;; compara valor c com menor
        jle     .L5                          ;; pula pra .L5 se c for maior. Caso não seja ele, continua
        mov     eax, DWORD PTR [rbp-20]      ;; eax=c
        mov     DWORD PTR [rbp-8], eax       ;; move menor para o c
.L5:                                         ;;
        mov     edx, DWORD PTR [rbp-8]       ;; move menor pro edx
        mov     eax, DWORD PTR [rbp-4]       ;; move maior pro eax
        mov     esi, eax                     ;; esi=eax
        mov     edi, OFFSET FLAT:.LC1        ;; move a string do .LC1 para edi
        mov     eax, 0                       
        call    printf                       ;; chama a função printf
        mov     eax, 0                       
        leave                                
        ret                                  


;;2) imprime a potencia de x^y

.LC0:                                        
        .string "%d"                         ;; tipo dos valores recebidos
.LC1:                                        
        .string "a potencia e %d"            
main:                                        
        push    rbp                          ;; armazenar valor rbp para stack
        mov     rbp, rsp                     ;; rbp atualiza rsp
        sub     rsp, 16                      ;; reserva 16 bytes
        mov     DWORD PTR [rbp-4], 1         ;; pot recebe 1
        lea     rax, [rbp-12]                ;; rax=&x
        mov     rsi, rax                     ;; rsi = rax(&x)
        mov     edi, OFFSET FLAT:.LC0        ;; move a string da .LC0 para edi
        mov     eax, 0                       
        call    __isoc99_scanf               ;; scanf(.LC0, &x)
        lea     rax, [rbp-16]                ;; rax=&y
        mov     rsi, rax                     ;; rsi = rax(&y)
        mov     edi, OFFSET FLAT:.LC0        ;; move a string da .LC0 para edi
        mov     eax, 0                       
        call    __isoc99_scanf               ;; scanf(.LC0, &y)
        mov     DWORD PTR [rbp-8], 1         ;; adiciona 1 no i do for
        jmp     .L2                          ;; pula pra .L2
.L3:                                         ;;
        mov     eax, DWORD PTR [rbp-12]      ;; eax=x
        mov     edx, DWORD PTR [rbp-4]       ;; move o pot pro edx 
        imul    eax, edx                     ;; eax *= edx
        mov     DWORD PTR [rbp-4], eax       ;; pot recebe eax   
        add     DWORD PTR [rbp-8], 1         ;; adiciona 1 no i do for
.L2:                                         ;;
        mov     eax, DWORD PTR [rbp-16]      ;; eax=y
        cmp     DWORD PTR [rbp-8], eax       ;; move for para eax
        jle     .L3                          ;; pula pra .L3
        mov     eax, DWORD PTR [rbp-4]       ;; move pot pro eax  
        mov     esi, eax                     ;; esi=eax
        mov     edi, OFFSET FLAT:.LC1        ;; move a string da .LC1 para edi
        mov     eax, 0                       
        call    printf                       ;; chama a função printf
        mov     eax, 0                       
        leave                                
        ret  


;;3) soma de vetores (estaticos)

;;Primeiro programa

main:
        push    rbp
        mov     rbp, rsp
        mov     DWORD PTR [rbp-48], 1
        mov     DWORD PTR [rbp-44], 2
        mov     DWORD PTR [rbp-40], 3
        mov     DWORD PTR [rbp-36], 4
        mov     DWORD PTR [rbp-32], 5
        mov     DWORD PTR [rbp-28], 6
        mov     DWORD PTR [rbp-24], 6
        mov     DWORD PTR [rbp-20], 7
        mov     DWORD PTR [rbp-16], 8
        mov     DWORD PTR [rbp-12], 9
        mov     DWORD PTR [rbp-4], 0
        mov     DWORD PTR [rbp-8], 0
        jmp     .L2
.L3:
        mov     eax, DWORD PTR [rbp-4]
        cdqe
        mov     eax, DWORD PTR [rbp-48+rax*4]
        add     DWORD PTR [rbp-8], eax
        add     DWORD PTR [rbp-4], 1
.L2:
        cmp     DWORD PTR [rbp-4], 9
        jle     .L3
        mov     eax, 0
        pop     rbp
        ret



;;Segundo programa

main:
        push    rbp
        mov     rbp, rsp
        mov     DWORD PTR [rbp-4], 0
        mov     DWORD PTR [rbp-8], 0
        jmp     .L2
.L3:
        mov     eax, DWORD PTR [rbp-4]
        cdqe
        mov     eax, DWORD PTR numInt.0[0+rax*4]
        add     DWORD PTR [rbp-8], eax
        add     DWORD PTR [rbp-4], 1
.L2:
        cmp     DWORD PTR [rbp-4], 9
        jle     .L3
        mov     eax, 0
        pop     rbp
        ret
numInt.0:
        .long   1
        .long   2
        .long   3
        .long   4
        .long   5
        .long   6
        .long   6
        .long   7
        .long   8
        .long   9


;;4) verificar se o numero é positivo ou negativo

.LC0:
.string "Digite um numero inteiro"
.LC1:
.string "%d"
.LC2:
.string "Contando %d ..."
.LC3:
.string "Total: %d"
main:
push %rbp
mov %rbp, %rsp
sub %rsp, 16
mov %edi, OFFSET FLAT:.LC0
call puts
lea %rsi, [%rbp-12] 
mov %edi, OFFSET FLAT:.LC1
mov %eax, 0
call scanf
mov %esi, DWORD PTR [%rbp-12]	  ;;rbp-12 = y
mov %edi, OFFSET FLAT:.LC2
mov %eax, 0
call printf
;;inicio do for
mov DWORD PTR [%rbp-8], 0 	  ;;i=0
mov DWORD PTR [%rbp-4], 0 	  ;;x=0
jmp .L2				  ;; pula pra .L2
.L3:
mov %eax, DWORD PTR [%rbp-12]
and %eax, 1			  ;; y & 1
add DWORD PTR [%rbp-4], %eax	  ;; x += eax
mov %eax, DWORD PTR [%rbp-12]
sar %eax			  ;; eax >>
mov DWORD PTR [%rbp-12], %eax
inc DWORD PTR [%rbp-8]		  ;; i++
.L2:
mov %eax, DWORD PTR [%rbp-8]	  ;; eax = i
cmp %eax, 31			  ;; compara eax com 31
jbe .L3
mov %esi, DWORD PTR [%rbp-4]	 
mov %edi, OFFSET FLAT:.LC3
mov %eax, 0			 
call printf
mov %eax, 0
leave
ret


;;5) descobrindo senha do codigo em assembly

main:
push %rbp
mov %rbp, %rsp
sub %rsp, 240
mov DWORD PTR [%rbp-24], 0
mov DWORD PTR [%rbp-16], 20122020
mov BYTE PTR [%rbp-10], 0
mov %rax, QWORD PTR .LC0[%rip]
mov QWORD PTR [%rbp-224], %rax
mov %rax, QWORD PTR .LC0+8[%rip]
mov QWORD PTR [%rbp-216], %rax
mov %rax, QWORD PTR .LC0+16[%rip]
mov QWORD PTR [%rbp-208], %rax
mov %rax, QWORD PTR .LC0+24[%rip]
mov QWORD PTR [%rbp-200], %rax
mov %rax, QWORD PTR .LC0+32[%rip]
mov QWORD PTR [%rbp-192], %rax
mov %rax, QWORD PTR .LC0+40[%rip]
mov QWORD PTR [%rbp-184], %rax
mov %eax, DWORD PTR .LC0+48[%rip]
mov DWORD PTR [%rbp-176], %eax
lea %rdi, [%rbp-172]
mov %edx, 148
mov %esi, 0
call memset
mov %edi, OFFSET FLAT:.LC1
call getpass				;;rax = senha digitada					
mov QWORD PTR [%rbp-8], %rax		;;ecx = &(rax(i+senha))
jmp .L2
.L3:
inc DWORD PTR [%rbp-24]		
.L2:
mov %eax, DWORD PTR [%rbp-24]		
cdqe					;; rax = eax((i<<2)+1)
add %rax, QWORD PTR [%rbp-8]
movzx %ecx, BYTE PTR [%rax]		;; ecx = &(rax(i+senha))
mov %edx, DWORD PTR [%rbp-24]
mov %eax, %edx
sal %eax, 2				;; eax(i)<<2
add %eax, %edx				;;eax(i<<2) += edx(i)
cdqe					;;rax = eax((i<<2)+1)
movzx %eax, BYTE PTR [%rbp-224+%rax]
cmp %cl, %al
je .L3
cmp DWORD PTR [%rbp-24], 9
jle .L5
mov BYTE PTR [%rbp-225], 1
jmp .L7
.L5:
mov BYTE PTR [%rbp-225], 0
.L7:
movzx %eax, BYTE PTR [%rbp-225]
mov BYTE PTR [%rbp-10], %al
cmp BYTE PTR [%rbp-10], 1
jne .L8
mov %eax, DWORD PTR [%rbp-16]
mov %esi, %eax
sar %esi, 2
mov %edi, OFFSET FLAT:.LC2
mov %eax, 0
call printf
jmp .L10
.L8:
mov %edi, OFFSET FLAT:.LC3		;; printf("NOK")
mov %eax, 0
call printf
.L10:
mov %eax, 1
leave
ret
.LC1:
.string "Digite a senha: "
.LC2:
.string "(%d)"
.LC3:
.string "NOK"
.LC0:
.string "ypatorapadura#@bisturi$%@eguastitianaostaqui!c)(*&a"
.zero 148


;;a) A senha é "yrubretnaca". Basta editar o jump do .L2(je .L3) para jne .L3 e adicionar as linhas a seguir no início do L3:

mov eax, DWORD PTR [rbp-4]
lea edx, [0+rax*4]
mov eax, DWORD PTR [rbp-4]
add eax, edx
cdqe
movzx eax, BYTE PTR string[rax]
movsx eax, al
mov edi, eax
call putchar

;;b) Editando o jmp no final do .L2(je .L3) para jne .L3. O código é que aparecerá será (5030505)

;;c) A String com a senha é "ypatorapadura#@bisturi$%@eguastitianaostaqui!c)(*&a". Os caracteres da senha iniciam em 0 e depois são sempre múltiplos de 5(0,5,10,15,20,25,30,35,40,45,50). Então para mudar pra “computadores” é preciso seguir a lógica “c****o****m****p****u****t****a****d****o****r****e****s”. Sabemos que o limite da comparação "memset(&string[52],0 , 148);"em C e "lea %rdi, [%rbp-172] em assembly. A letra “s” vai ser substituída por um “ “. Para corrigir é necessário modificar o valor pra 56, ficando assim: “lea %rdi, [%rbp-168]” no assembly e no C memset(&string[56], 0 , 144);

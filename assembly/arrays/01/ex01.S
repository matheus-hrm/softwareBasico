.data

.globl vet
.align 2
vet: .short 50, 10, 67, 42

.globl max
.align 2
max: .short 0

.text

.globl ex01

ex01:
    pushq %rbp
    movq %rsp, %rbp

    movb $0, %al     # (short) i = 0
    

loop:
    cmpb $4, %al    # i < 4
    jge fim
    
    movq $vet, %rdx  # rdx = &vet[0]
    movsbq %al, %rcx # i = (long) i
    imulq $2, %rcx   # i = i * 2
    addq %rcx, %rdx  # rdx = &vet[i]
    
    movw (%rdx), %di # max = vet[i]
    
    cmpw max, %di   # vet[i] > max
    jle next

    movw %di, max # max = vet[i]
    
next:

    incb %al         # i++
    jmp loop

fim:

    leave

    ret 


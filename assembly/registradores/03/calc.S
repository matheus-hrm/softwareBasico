    .data    

    .globl v 
    .align 2 
v: .word 1, 2, 3, 4, 5    

    .globl max 
    .align 2
max: .word 0

    .section .rodata
calcfmt: .string "%d: sum = %ld\n"
mainfmt: .string "retorno = %ld\n"

    .text

    .globl calc
calc:

    pushq %rbp
    movq %rsp, %rbp

    subq $32, %rsp
    movq %rdi, -8(%rbp) // short *vet
    movl %esi, -12(%rbp) // int size 
    movl %edx, -16(%rbp) // int factor
    movq %rcx, -24(%rbp) // short *max
    movb %r8b, -25(%rbp) // char option
    movl $0, %ebx // int i
    movq $0, %r10 // long sum

loop:
    cmpl -12(%rbp), %ebx
    jge L1
    movl -8(%rbp), %eax // vet
    movq (%rax), %rax // vet[0]
    movl %ebx, %r12d // i
    movl %ebx, %edx // salva i em edx
    movslq %edx, %rdx // converte i para long
    imulq $2, %rdx // multiplica i por 2
    addq %rax, %rdx // soma i com o endereço de vet
    movw (%rdx), %ax // vet[i]

    movq -24(%rbp), %rdx // max
    movw (%rdx), %dx // max

    cmpw %dx, %ax // vet[i] > max
    jge endif
    movw %ax, (%rdx) // max = vet[i]
endif:
    movl -16(%rbp), %ebx // factor
    imulw %bx, %ax // max * factor
    movq %rax, %r10 // sum
    movl %r12d, %esi // i
    movq %r10, %rcx // sum
    movq $calcfmt, %rdi // calcfmt
    movl $0, %eax // 0
    call printf
    addl $1, %ebx // i++
    jmp loop
L1:
    movb -25(%rbp), %al // option
    cmpb $1, %al // option == 1
    jne L2
    movq %r10, %rax // sum
    // return sum
    movq %rbp, %rsp
    popq %rbp
    ret
L2:
    movq %rbp, %rsp
    popq %rbp
    leave
    ret

    .globl main
main:
    pushq %rbp
    movq %rsp, %rbp
    
    movq $v, %rdi // v
    movq $5, %rsi // 5
    movq $2, %rdx // 2
    movq $max, %rcx // max
    movb $1, %r8b // 1
    call calc
    movq %rax, %rdi // retorno
    movq $mainfmt, %rsi // mainfmt
    movl $0, %eax // 0
    call printf

    movq $0, %rax
    movq %rbp, %rsp
    popq %rbp

    leave
    ret






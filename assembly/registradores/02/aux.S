.data
    .globl x
    .align 8
x: .quad 10

.section .rodata
fmt: .string "Valor: x = %ld, i = %d\n"

.text

.globl aux
aux:

    pushq  %rbp
    movq   %rsp, %rbp
    subq   $16, %rsp
    movq   $5, %r10

    movq %rdi , -8(%rbp) // i
    movq %rsi , -16(%rbp) // ptr
    
    movq %r10 , %rsi 
    
    movq %rdi, %rdx

    movq $fmt, %rdi
    movq $0, %rax
    call printf

    movq -8(%rbp), %rax
    movq -16(%rbp), %rdx

    // return x + i + *ptr
    addq (%rdx), %rax
    addq $5, %rax

    leave
    ret

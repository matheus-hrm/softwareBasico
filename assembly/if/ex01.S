.section .rodata

.data

.globl a
.align 4
a: .long 30

.globl b
.align 4
b: .long 45

.globl c
.align 4
c: .long -60

.globl d
.align 4
d: .long 25

.text

.globl ex01

ex01:

    pushq %rbp
    movq  %rsp, %rbp

    movl a, %eax
    movl b, %ecx

    cmpl %ecx, %eax
    jle .endif

    negl c 

    movl c, %eax
    cltd
    movl $3, %edi
    idiv %edi

    movl %eax, d

.endif:
    movl a, %eax
    movl b, %ecx
    cmpl %eax, %ecx
    jl .end2

    movl a, %eax
    addl b, %eax
    imull c, %eax
    movl %eax, c
    
    movl $1024, d

.end2:

   leave

   ret
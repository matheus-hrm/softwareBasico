.data

.globl c
.align 1
c: .byte -20

.globl i
.align 4
i: .long -256

.globl j
.align 4
j: .long 512

.globl l
.align 8
l: .quad 128

.globl us
.align 2
us: .word 111

.globl ui
.align 4
ui: .long 1024

.globl ul
.align 8
ul: .quad 2048

.text


.globl foo

foo:


    # Se necessário, usar apenas os registradores (ou suas variações) abaixo:

    # %rax, %rcx, %rdx, %rdi, %rsi, %r8, %r9, %r10, %r11


    movl $68000, j
    # movq $4096, l 
    movl j, %eax
    movl %eax, i

    movl i, %eax
    addl $10, %eax
    subl $5, %eax
    movl %eax, j

    movl i, %eax
    imull $2, %eax
    movl j, %ecx
    addl $5, %ecx
    subl %ecx, %eax
    movl %eax, i

    movl i, %eax
    movl %eax, ui

    movb c, %al
    movsbl %al, %eax
    movl %eax, j

    movl ui, %eax
    movq %rax, ul

    movq ul, %rax
    movw %ax, us

    movl i, %eax
    addl j, %eax
    movb %al, c
        
    movq $l, %rcx
    movq $128, (%rcx)

    # j = j + *iptr

    movl $i, %edx
    movl (%edx), %eax
    addl j, %eax
    movl %eax, j
    

    leave

    ret

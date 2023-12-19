.section .rodata
fmt: .string "color: %ld, filled: %d\n"
.data

    .globl c1
    .align 8
c1:
    .long 0 # x: +0
    .long 0 # y: +4
    .byte 0 # f: +8
    .zero 7 # +9 (padding)
    .quad 0 # color: +16

.text

.globl main
main:
    pushq %rbp
    movq %rsp, %rbp

    movq $c1, %rax
    movl $10, (%rax)
    movl %rax, %edx
    imull $2, %edx
    movl %edx, 4(%rax)
    movb $1, 8(%rax)

    cmpl $15, 4(%rax)
    jle else

    movq $2, 16(%rax)
    jmp end
else:
    movq $1, 16(%rax)
    
end:

    # printf("color: %ld, filled: %d\n", c1.color, (int)c1.filled);
    movq $fmt, %rdi
    movq c1 + 16, %rsi
    movsbl c1 + 8, %edx
    movl $0, %eax
    call printf

    movl $0, %eax
    leave
    ret
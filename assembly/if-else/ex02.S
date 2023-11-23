.data

.globl a
.align 4
a: .long 0

.globl b
.align 8
b: .quad 2

.text

.globl ex02

ex02:
    pushq  %rbp
    movq   %rsp, %rbp

    movl a, %eax
    cmpl $0, %eax
    je end

    movq b, %rax
    cmpq $5, %rax
    jge else

    # (a = a << 1)
    movl a, %eax
    shll $1, %eax
     
    # ((long) a * (long) b)
    movslq a, %rdx
    imulq b, %rdx
    
    # ((long) a * (long) b + b)
    movslq %eax, %rax
    addq %rdx, %rax

    # (b = a + b)
    movq %rax, b

    jmp end
else: 
    # (a(int) = b ^ 0x1FL)
    movq b, %rax
    xorq $0x1F, %rax
    movl %eax, a

end:

    leave
    ret

    .section .rodata
    fmt: .string "Fail: sum = %f, limit = %f, count = %d\n"
    
    .data
    .align 4
    zero: .float 0.0
    .text

    .globl collect
collect:
// float collect(struct Data *ptr, float limit, int count)
    pushq %rbp
    movq %rsp, %rbp
    subq $64, %rsp

    movq %rbx, -40(%rbp)
    movss $zero, %xmm7 // float sum = 0;
    movl $0, %ebx  // int i = 0;

    movq %rdi, -48(%rbp)
    movss %xmm7, -32(%rbp)
    movss %xmm0, -52(%rbp)
    movl %esi, -56(%rbp)
    
    leaq -24(%rbp), %rdi
    call t_init

    movq  -48(%rbp), %rdi
    movss -32(%rbp), %xmm7
    movss -52(%rbp), %xmm0
    movl  -56(%rbp), %esi

while:
    cmpl %esi, %ebx     // while (i < count)
    jge endwhile

    movq %rdi, %r8
    movslq %ebx, %r9
    imulq $8, %r9
    addq %rdx, %r9

    movss (%r11), %xmm2  // float val = ptr[i];

    ucomiss %xmm0, %xmm2   // if (ptr[i] < limit)
    jp else
    jae else
    
    leaq -24(%rbp), %r8
    cvtsi2ss 16(%r8), %xmm4
    mulss %xmm3, %xmm4
    addss %xmm4, %xmm7     // sum += ptr[i] * i;
    
else:

    movq %rdi, -48(%rbp)
    movss %xmm7, -32(%rbp)
    movss %xmm0, -52(%rbp)
    movl %esi, -56(%rbp)
    
    movq $fmt, %rdi
    cvtss2sd %xmm0, %xmm1 // double limit
    cvtss2sd %xmm3, %xmm0 // double sum

    movl $2, %eax
    call printf

    movq  -48(%rbp), %rdi
    movss -32(%rbp), %xmm7
    movss -52(%rbp), %xmm0
    movl  -56(%rbp), %esi

    movq %rdi, %r8
    movslq %ebx, %r9
    imulq $8, %r9
    addq %rdx, %r9

    incl 4(%r9)        // ptr[i].fail++    

    incl %ebx           // i++;
    jmp while
endwhile:

    movss %xmm7, %xmm0
    movq -40(%rbp), %rbx
    leave
    ret


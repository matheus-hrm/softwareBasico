    .section .rodata 
fmt: .string "a = %f, b = %f, e = %f\n"

    .text

    .data
    .globl calc2
calc2: //float calc2(float a, float b)
    pushq %rbp
    movq %rsp, %rbp

    subq $16, %rsp

    movss %xmm0, -4(%rbp) // a
    movss %xmm1, -8(%rbp) // b

    cvtss2sd %xmm1, %xmm0        
    call cos // cos(b)
    movsd %xmm0, %xmm3
    
    movss -4(%rbp), %xmm1
    cvtss2sd %xmm1, %xmm1 // double(a)
    
    addsd %xmm1, %xmm3 // a + cos(b) 
    movsd %xmm3, %xmm2 // double(a + cos(b))
    
    movss -8(%rbp), %xmm1 
    movss -4(%rbp), %xmm0

    cvtss2sd %xmm1, %xmm1 // double(b)
    cvtss2sd %xmm0, %xmm0 // double(a)
    movq $fmt, %rdi
    movl $3, %eax
    
    call printf //printf(fmt, a, b, e);

    movss %xmm3, %xmm0
    
    leave
    // return b
    ret

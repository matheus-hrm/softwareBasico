    .text

    .globl calc1
calc1: 
    pushq %rbp 
    movq  %rsp, %rbp

    cvtss2sd %xmm1, %xmm3
    addsd %xmm0, %xmm3

    cvtss2sd %xmm1, %xmm4
    subsd %xmm4, %xmm0

    mulsd %xmm3, %xmm0

    leave 
    ret

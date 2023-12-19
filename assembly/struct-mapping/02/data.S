.section .rodata
fmt: .string "%ld\n"

.text

.globl show
show:
    pushq  %rbp
    movq   %rsp, %rbp
    subq   $32, %rsp
    
    movq %rdi,%r8 # long *ptr = d->elems
    addq $8, %r8  # r8 = elems

    movl $0, %ecx # i = 0
loop:
    cmpl (%rdi), %ecx 
    jge end
    
    movq %rdi, -8(%rbp)
    movq %rcx, -16(%rbp)
    movq %r8,  -24(%rbp)

    movq $fmt, %rdi
    
    movslq %ecx, %r9
    imulq $8, %r9
    addq %r8, %r9
    movq (%r9), %rsi

    movl $0 , %eax
    call printf

    movq -8(%rbp), %rdi
    movq -16(%rbp), %rcx
    movq -24(%rbp), %r8
    
    incl %ecx
    jmp loop
end: 
    leave
    ret

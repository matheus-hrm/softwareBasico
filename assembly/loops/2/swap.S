.data

.globl last
.align 8
last: .quad 0

.globl values
.align 8
values: .quad 50, -10, 60, -20, 70

.text

.globl swap

swap:

    pushq  %rbp
    movq   %rsp, %rbp

    #j = 4
    movl $4, %r9d
    movl $0, %r8d
loop:
    cmpl  %r9d, %r8d
    jge fim

    movq $values, %rdx  # tmp = values[i]
    movslq %r8d, %rcx   # rcx = (long) i
    imulq $8, %rcx      # rcx 8*i
    addq %rdx,%rcx      # tmp += j
    movq (%rcx), %r10    # tmp = values[i]  

    movq %rcx, %rax    # values[i] = values[j]

    movq $values, %rdx   # values[i] = values[j]
    movslq %r9d, %rcx   # j = (long) i 
    imulq $8, %rcx      # j *= 8
    addq %rdx, %rcx      # values += j
    movq (%rcx), %r11     # values[i] = values[j]
    
    
    movq %r11, (%rax)     # values[j] = tmp

    movq %r10, (%rcx)     # values[j] = tmp
    incl %r8d
    decl %r9d
    jmp loop
fim:

    movq $values, %rax
    movq $4 , %rcx
    imulq $8, %rcx
    addq %rax, %rcx
    movq (%rcx), %rdx
    movq %rdx, last

    leave
    
    ret 

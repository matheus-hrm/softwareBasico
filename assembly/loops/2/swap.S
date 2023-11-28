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

    movl  $0, %eax
    movl  $4, %ecx

loop:
    cmpl  %ecx, %eax
    jge fim

    movq $values, %r8  # tmp = values[i]
    movslq %eax, %rcx   # j = (long) i
    imulq $8, %rcx      # j *= 8
    addq %rcx, %r8      # tmp += j
    movq (%r8), %rdx    # tmp = values[i]  
    
    movq $values, %r11   # values[i] = values[j]
    movslq %ecx, %rcx   # j = (long) i 
    imulq $8, %rcx      # j *= 8
    addq %rcx, %r11      # values += j
    movq (%r11), %r9     # values[i] = values[j]
    
    
    movq (%rdx),%r11      # values[j] = tmp

    
    addl $1, %eax       # i++
    subl $1, %ecx       # j--
    jmp loop
fim:

    movq $values, %rax
    movq $4 , %rcx
    imulq $8, %rcx
    addq %rcx, %rax
    movq (%rax), %rdx
    movq %rdx, last

    leave
    
    ret 

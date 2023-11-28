.data

.globl s
.align 4
s: .long 0

.globl nums
.align 8
nums: .long 65, -105, 111, 34

.text

.globl ex01

ex01:

    pushq %rbp
    movq  %rsp, %rbp

    movl $0, %eax

    loop:
        cmpl $4, %eax
        jge fim
        
        movq $nums, %rcx  # rcx = nums
        movslq %eax, %rdi # rdi = (long) i
        imulq $4, %rdi    # rdi = i * sizeOf
        addq %rcx, %rdi   # rcx = nums + i * sizeOf
    
        movl (%rdi), %ebx # ebx = nums[i]
        addl %ebx, s 
        incl %eax
        jmp loop
    fim:


    leave

    ret
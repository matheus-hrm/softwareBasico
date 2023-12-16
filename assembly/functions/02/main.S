.section .rodata


.data

.globl i
.align 4
i: .long 0

.globl bias
.align 8
bias: .quad 256

.globl vet
vet: .byte 12, 3, 20, 8

.text


.globl main

main:
   pushq %rbp
   movq  %rsp, %rbp
   

loop:
   movl i, %ecx
   cmpl $4, %ecx
   jge fim 
   
   movq $vet, %rax
   movl %ecx, %r9d
   imulq $1, %r9
   addq %rax, %r9

   movq (%r9), %rdi
   movl $10, %esi
   movq bias(%rip), %rdx
   call filtro

   movl %eax, bias(%rip)
    

   incl i
   jmp loop 
fim:   

   movl $0, %eax

   leave

   ret
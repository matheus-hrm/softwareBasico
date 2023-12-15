.section .data
.globl val
val: .long 432
.globl age
age: .word 4
.globl r
r: .long 0
.globl err
err: .quad 2048

.section .text
.globl main
main:
   pushq %rbp
   movq  %rsp, %rbp

   movq $str, %rdi
   movl val(%rip), %esi
   movw age(%rip), %dx
   movq $r, %rcx
   call sum

   # Chamada para a função show
   movq err(%rip), %rdi
   movl val(%rip), %esi
   movl r(%rip), %edx
   call show

   # Retorno da função main
   movl $0, %eax
   leave
   ret

.section .rodata
str: .string "Hello"
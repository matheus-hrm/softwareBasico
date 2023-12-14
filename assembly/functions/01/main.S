.section .rodata

.data

.globl val
val: .long 432

.globl age
age: .word 4

.globl r
r: .long 0

.globl err
err: .quad 2048


.text


.globl main

main:

   pushq %rbp

   movq  %rsp, %rbp
   
   

   # Seu código aqui...
   
   movq $str, %rdi
   movl val, %esi
   movw age, %dx
   movq r, %rcx

   call sum #sum("Hello", val, age, err)
   movq %rax, val 
   # Faça o "return"

   movq err, %rdi
   movq val, %rsi 
   movq r, %rdx
   call show #show(err, val, r)
   
   movl $0, %eax

   leave

   ret

.section .rodata
str: .string "Hello"
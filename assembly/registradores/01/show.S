.data

.section .rodata
fmt: .string "%d\n"

.text


.globl show

show:

    pushq %rbp
    movq %rsp, %rbp
    subq $32, %rsp
    movq $0, %r13
    movq %rdi, %rbx //rbx = array
    movq %rsi, %r12 //r12 = size

forloop:

    cmpq %r12, %r13 //r13 = i
    jge endfor

    movq %rbx, -8(%rbp)
    movq %r13, -16(%rbp)
    movq %r12, -24(%rbp)

    movq %r13, %r10
    imulq $8, %r10
    addq %rbx, %r10
    movq (%r10), %rsi
   
    movq $fmt, %rdi
    movq $0, %rax
    call printf

    movq -8(%rbp), %rbx
    movq -16(%rbp), %r13
    movq -24(%rbp), %r12

    incq %r13
    jmp forloop
endfor:

    leave

    ret
d.data

.globl letters
.align 1
letters: .string "abcdefghij"

.globl even
.align 4
even: .long 0

.globl odd
.align 4
odd: .long 0

.text

.globl ex02

ex02:
    pushq %rbp
    movq %rsp, %rbp
    
    movl $0, %ecx
    
    movq $letters, %rax
    movl %ecx, %r9d
    imulq $1, %r9
    addq %rax, %r9
    
loop:
    cmpb $0, (%r9)
    je end

    movl %ecx, %eax

    movq $letters, %r8
    movl %ecx, %r9d
    imulq $1, %r9
    addq %r8, %r9
    
    incl %ecx
    # letters[count++] & 1
    movzbl (%r9), %eax
    inc %r9
    test $1, %eax
    jz else

    incl odd
    jmp loop
else:
    incl even
    jmp loop
end:
    leave

    ret
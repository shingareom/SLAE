global _start
section .text
_start:

    cld
    mov rax, 0x12121212123223
    lea rdi, [var1]
    scasq

    lea rdi, [var2]
    scasq

    cld

    lea rsi, [var1]
    lea rdi, [var2]
    cmpsq

    mov rax, 0x3c
    mov rdi, 0
    syscall

section .data
    var1: dq 0x12121212123223
    var2: dq 0x12312312312312
    
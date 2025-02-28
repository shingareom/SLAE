global _start

section .text

helloWorldPrintProc:

    mov rax, 1
    mov rdi, 1
    mov rsi, message
    mov rdx, messageLen
    syscall
    ret

_start:
    mov rcx, 5

loopup:
    push rcx
    call helloWorldPrintProc
    pop rcx
    loop loopup

    mov rax, 60
    mov rdi, 0
    syscall
    
section .data
    message: db "I Love You Myself, Means Om Shingare!", 0x0a
    messageLen equ $-message
global _start
section .text


_start:


    ; Print Sting

    mov al, 1
    ; File Discripter
    mov rdi, 1
    mov rsi, hello_world
    mov rdx, length
    syscall
    
    mov rax, [var1]
    mov rbx, [var2]
    ; Exit Peacefully
    mov rax, 60
    mov rdi, 2
    syscall



section .data
    hello_world: db 'Hello World to this course and this repo'
    length: equ $-hello_world
    var1: db 0x00, 0x12, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77
    var2: db 0x77, 0x66, 0x55, 0x44, 0x33, 0x22, 0x11, 0x00

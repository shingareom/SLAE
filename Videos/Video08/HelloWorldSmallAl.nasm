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

    ; Exit Peacefully
    mov rax, 60
    mov rdi, 2
    syscall



section .data
    hello_world: db 'Hello World to this course and this repo'
    length: equ $-hello_world

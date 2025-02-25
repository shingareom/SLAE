global _start
section .text


_start:


    ; Print Sting

    xor rax, rax
    mov al, 1
    ; Here we have used the AL, But Now we are gonna use the xor as well so if there are already any content in the rax will become zero so make it shellcoding safe
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

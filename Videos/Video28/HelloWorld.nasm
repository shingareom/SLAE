global _start
section .text
default rel

_start:

    jmp real_start
    hello_world: db 'Hello Om', 0xa
real_start:


    xor rax, rax
    add rax, 1
    mov rdi, rax
    lea rsi, [hello_world]
    xor rdx, rdx
    add rdx, 9
    syscall

    xor rax, rax
    add rax, 60
    xor rdi, rdi
    syscall

global _start
section .text
_start:

    ; Copy full string byte-by-byte
    cld
    lea rsi, [var1]
    lea rdi, [Copy]
    mov rcx, len      ; Move all bytes
    rep movsb         ; Copy byte-by-byte

    ; Store a quadword in var2
    cld
    mov rax, 0x1231231231212322
    lea rdi, [var2]
    stosq

    ; Zero out var2
    mov qword [var2], 0  

    mov rax, 60         ; Exit syscall
    xor rdi, rdi        ; Exit status 0
    syscall

section .data
    var1: db "Hello World"
    len: equ $-var1
        
section .bss
    Copy: resb len
    var2: resq 1  ; Allocate 8 bytes properly

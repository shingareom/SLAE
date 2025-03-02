; movsq
; stosq
; lodsq


global _start
section .text
_start:

    cld
    lea rsi, [var1]
    lea rdi, [Copy]
    rep movsb

    cld
    mov rax, 0x1231231231212322
    lea rdi, [var2]
    stosq


    mov qword [var2], 0  
   
    mov rax, 60         ; Exit syscall
    xor rdi, rdi        ; Exit status 0
    syscall
section .data
    var1:  db "Hello World"
    len: equ $-var1
        
section .bss
    Copy: resb len
    var2: resq 1
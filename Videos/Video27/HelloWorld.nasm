global _start

section .text
_start:
    xor rax, rax          ; Clear RAX
    push rax              ; Null terminator (\x00) for safety

    push 0x0a21646c       ; "\nld!"
    push 0x726f5720       ; " Wo"
    push 0x6c6c6548       ; "Hell"

    mov rsi, rsp          ; RSI -> Pointer to "Hello World!\n"
    mov rdx, 13           ; Length of string (including newline)

    ; sys_write (syscall 1)
    mov rax, 1            ; syscall: sys_write
    mov rdi, 1            ; stdout
    syscall

    ; sys_exit (syscall 60)
    mov rax, 60           
    xor rdi, rdi          ; exit(0)
    syscall

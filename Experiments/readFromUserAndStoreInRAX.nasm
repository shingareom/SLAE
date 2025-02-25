global _start
section .text


_start:
    ; Read input from stdin (file descriptor 0)
    mov rax, 0          ; syscall number for sys_read
    mov rdi, 0          ; file descriptor 0 (stdin)
    mov rsi, buffer     ; pointer to the buffer
    mov rdx, 128        ; number of bytes to read
    syscall

    ; Store the number of bytes read in RAX
    ; (RAX already contains the return value from sys_read)
    mov rax, [buffer]
    ; Exit the program
    mov rax, 60         ; syscall number for sys_exit
    xor rdi, rdi        ; exit code 0
    syscall

    section .bss
    buffer resb 128  ; Reserve 128 bytes for the input buffer


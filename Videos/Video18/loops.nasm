global _start

section .text
_start:
        
    mov rcx, 10
    ; IN GDB SEE THE Value of the rcx coz after the syscall the rcx is updating so we need to save it first otherwise it will be an infinite looppppppppppppppppppppppppppp
    ; AS you can see the valur of rcx its 
    ; lets update it manually
    ; it will not work coz after syscall it is updating again.

loophere:

    push rcx

    mov rax, 1
    mov rdi, 1
    mov rsi, message
    mov rdx, messageLen
    syscall

    pop rcx
    ; TO save the state of rcx
    ; DOne...
    loop loophere
    
    
    mov rax, 60
    mov rdi, 0
    syscall



section .data
    message: db "I Love You Myself, Means Om Shingare!", 0x0a
    messageLen equ $-message
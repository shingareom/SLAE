global _start
section .text

_start:
    jmp short call_data

shellcode:
    pop rsi              ; RSI = address of "msg"
    mov al, 1            ; sys_write
    mov dil, al          ; stdout (1)
    mov dl, 39           ; length
    syscall              ; write(1, msg, 39)

    mov al, 60           ; sys_exit
    xor edi, edi         ; exit(0)
    syscall              ; _exit(0)

call_data:
    call shellcode
    msg: db 'Hello World to this course and this repo'

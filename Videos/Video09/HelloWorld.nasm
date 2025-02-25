	global  _start
	section .text
	global 
_start:
	
	; Print String
	mov rax, 1           ; syscall number for sys_write
	mov rdi, 1           ; file descriptor (stdout)
	mov rsi, hello_world ; pointer to string
	mov rdx, length      ; string length
	syscall

	mov rax, var4
	mov rax, [var4]
	; gdb ./HelloWorld 
	; -q is for quiet mode in gdb
	; set disassembly-flavor intel is for intel syntax in gdb
	; info variables is for listing all variables in gdb
	; break _start
	; run
	; x/4xg &var4
	; x/4xg var4


	
	; Exit Peacefully
	mov rax, 60 ; syscall number for sys_exit
	mov rdi, 0  ; exit status
	syscall
	
	section .data
hello_world: db  'Hello World to this course and this repo', 0x0A ; Added newline for proper output
length:      equ $ - hello_world
	
var1:        db  0x11, 0x22
var2:        dw  0x3344
var3:        dd  0xaabbccdd                                       ; Fixed incorrect syntax
var4:        dq  0xaabbccdd11223344
repeat_buffer: times 128 db 0xAA ; Fixed label name (underscore removed)
	
	section .bss
buffer: resb 64

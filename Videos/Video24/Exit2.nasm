global _start 

section .text

_start:

	; exit gracefully 
	xor rax, rax
	mov al, 60
	
	xor rdi, rdi
	syscall



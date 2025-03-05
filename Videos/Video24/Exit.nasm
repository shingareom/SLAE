global _start 

section .text

_start:

	; exit gracefully 
	
	mov rax, 60
	mov rdi, 11
	syscall



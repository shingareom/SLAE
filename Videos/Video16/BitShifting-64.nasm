; Filename: Arithmetic.nasm
; Author:  Vivek Ramachandran
; Website:  http://securitytube.net
; Training: http://securitytube-training.com 
;
;
; Purpose: Arithmetic Instructions 

global _start			

section .text
_start:

	mov rax, 0x00000000ffffffff
	sal rax, 32
	sal rax, 1

	clc	
	mov rax, 0x00000000ffffffff
	shr rax, 1
	shr rax, 31

	clc
	mov rax, 0x00000000ffffffff
	sar rax, 1
	clc
	mov rax, 0xffffffffffffffff
	sar rax, 1

	clc
	mov rax, 0x0123456789abcdef
	ror rax, 8
	ror rax, 12
	ror rax, 44


	; exit the program gracefully  

	mov rax, 0x3c
	mov rdi, 0		
	syscall

section .data

	var1 dq 0x1111111111111111
	var2 dq 0x0



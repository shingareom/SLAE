; Filename: Loops.nasm
; Author:  Vivek Ramachandran
; Website:  http://securitytube.net
; Training: http://securitytube-training.com 
;
;
; Purpose: Loop Statements 

global _start			

section .text
_start:

	mov rcx, 20 

PrintHW:

	push rcx 

	; print on screen
	
	mov rax, 1
	mov rdi, 1
	mov rsi, message 
	mov rdx, mlen
	syscall

	pop rcx 

	loop PrintHW

	; exit gracefully 
	
	mov rax, 60
	mov rdi, 11
	syscall




section .data

	message: db "Hello World! ", 0x0a
	mlen     equ $-message



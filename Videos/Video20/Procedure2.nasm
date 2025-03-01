; Filename: Procedure2.nasm
; Author:  Vivek Ramachandran
; Website:  http://securitytube.net
; Training: http://securitytube-training.com 
;
;
; Purpose: Frame Pointers and Procedures

global _start			

section .text

HelloWorldProc:

	push rbp
	mov rbp, rsp

	; Print hello world using write syscall
	
	mov rax, 1
	mov rdi, 1
	mov rsi, hello_world 
	mov rdx, length
	syscall

	; mov rsp, rbp
	; pop rbp

	leave
	ret   ; signifies end of procedure 


_start:

	mov rcx, 0x10

PrintHelloWorld:
	
	push rcx
	call HelloWorldProc
	pop rcx
	loop PrintHelloWorld


	; exit gracefully 
	
	mov rax, 60
	mov rdi, 11
	syscall


section .data

	hello_world: db "Hello World!", 0x0a
	length     equ $-hello_world



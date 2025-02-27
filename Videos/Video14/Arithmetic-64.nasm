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

	; register based addition 

	mov rax, 0x01
	add rax, 0x01

	mov rax, 0xffffffffffffffff
	add rax, 0x01

	mov rax, 0x09
	sub rax, 0x04


	; memory based addition 

	mov rax, qword [var1]
	add qword [var4], rax

	add qword [var4], 0x02


	;  set / clear / complement carry flag 

	clc
	stc
	cmc

	; add with carry 

	mov rax, 0
	stc
	adc rax, 0x1
	stc
	adc rax, 0x2

	; subtract  with borrow

	mov rax, 0x10
	sub rax, 0x5
	stc
	sbb rax, 0x4
	
	; increment and decrement 

	inc rax
	dec rax
	
	; exit the program gracefully  

	mov rax, 0x3c
	mov rdi, 0		
	syscall

section .data

	var1	dq	0x1
	var2	dq	0x1122334455667788
	var3	dq	0xffffffffffffffff
	var4    dq      0x0



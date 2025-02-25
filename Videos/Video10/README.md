### **Little Endian vs Big Endian**  

#### **1. What is Endianness?**  
Endianness refers to how bytes are ordered in memory. There are two types:  
- **Little Endian:** Least significant byte (LSB) is stored at the lowest memory address.  
- **Big Endian:** Most significant byte (MSB) is stored at the lowest memory address.  

#### **2. Example Representation**  
Consider the 32-bit hexadecimal number `0x12345678` stored in memory:  

| Address  | Big Endian  | Little Endian  |
|----------|------------|---------------|
| 0x1000   | 12         | 78            |
| 0x1001   | 34         | 56            |
| 0x1002   | 56         | 34            |
| 0x1003   | 78         | 12            |

- **Big Endian:** Stores the MSB at the lowest address.  
- **Little Endian:** Stores the LSB at the lowest address.  

#### **3. Simple NASM Hello World Program**
```assembly
section .data
    message db "Hello, World!", 0

section .text
    global _start

_start:
    mov rax, 1          ; syscall: write
    mov rdi, 1          ; file descriptor: stdout
    mov rsi, message    ; address of string
    mov rdx, 13         ; length of string
    syscall

    mov rax, 60         ; syscall: exit
    xor rdi, rdi        ; status 0
    syscall
```

#### **4. Debugging with GDB**  
Assemble and run the code in GDB:  
```bash
nasm -f elf64 hello.asm -o hello.o
ld hello.o -o hello
gdb hello
```

##### **Checking Endianness in GDB**  
Use the `x` command to inspect memory:  
```gdb
(gdb) x/4xb &message
0x600100:   0x48  0x65  0x6c  0x6c  ; 'H', 'e', 'l', 'l'
```
Since it prints bytes in the correct order, x86-64 follows **little-endian** format.  

#### **5. Summary**
- **Little Endian:** Stores LSB first. Used by x86, ARM (default), RISC-V (default).  
- **Big Endian:** Stores MSB first. Used by some network protocols, older architectures like PowerPC.  
- **In GDB, `x/xb` shows memory in the order stored, confirming little-endian behavior on x86-64.**

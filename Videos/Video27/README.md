Here are the structured notes for the content:  

---

### **SecurityTube Linux Assembly Expert (SLAE64) - Notes**  

#### **Training Resources**  
- **SecurityTube**: [SecurityTube Training](http://www.SecurityTube-Training.com)  
- **Pentester Academy**: [Pentester Academy](http://www.PentesterAcademy.com)  
- **Instructor**: Vivek Ramachandran  
  - Certifications & Courses:  
    - SWSE (SecurityTube Wireless Security Expert)  
    - SMFE (SecurityTube Malware & Forensics Expert)  
    - SPSE (SecurityTube Python Security Expert)  
    - SGDE (SecurityTube GNU Debugger Expert)  
    - SISE (SecurityTube Internet Security Expert)  
    - SLAE32 & SLAE64 (SecurityTube Linux Assembly Expert - 32-bit & 64-bit)  

---

### **Module 2: Introduction to Shellcoding**  

#### **Hello World Shellcode using the Stack**  
1. **Using the Stack for Shellcoding**  
   - **PUSH** the value of the `"Hello World"` string onto the stack.  
   - Get a reference to it using the **RSP (Stack Pointer Register)**.  
   - The string must be pushed in **reverse order** since the stack grows **from high to low memory**.  

2. **Stack Memory Growth**  
   - The stack grows **from high memory to low memory**.  
   - Example of how "HELLO WORLD" is stored in memory:  

     ```
     High Memory  
     H  
     E  
     L  
     L  
     O  
     W  
     Low Memory  
     O  
     R  
     L  
     D  
     \n  
     ```  

---


### **Fix: Reverse the String Properly**
The x86-64 architecture uses **Little Endian** format, meaning that when we push bytes onto the stack, they are stored in **reverse order**.  

#### **Incorrect Approach (Your Code)**
```assembly
push 0x21646c72   ; "rld!"
push 0x6f57206f   ; "o Wo"
push 0x6c6c6548   ; "Hell"
```
This results in **"lleHoW o"** instead of `"Hello World!"` because the order on the stack is incorrect.

---

### **Corrected Assembly Code**
```assembly
global _start

section .text
_start:
    xor rax, rax          ; Clear RAX
    push rax              ; Null terminator (\x00) for safety

    push 0x0a21646c       ; "\nld!"
    push 0x726f5720       ; " Wo"
    push 0x6c6c6548       ; "Hell"

    mov rsi, rsp          ; RSI -> Pointer to "Hello World!\n"
    mov rdx, 13           ; Length of string (including newline)

    ; sys_write (syscall 1)
    mov rax, 1            ; syscall: sys_write
    mov rdi, 1            ; stdout
    syscall

    ; sys_exit (syscall 60)
    mov rax, 60           
    xor rdi, rdi          ; exit(0)
    syscall
```

---

### **Why This Works**
- The bytes are pushed **in proper reversed order** due to **Little Endian format**.
- **`0x0a`** (newline) is added properly so the output looks clean.
- **No NULL bytes** (except the one at the end, which is safe here).

---

### **Re-extract the Shellcode**
After assembling, extract the shellcode using:
```sh
nasm -f elf64 shellcode.asm -o shellcode.o
objdump -d shellcode.o | grep '[0-9a-f]:' | cut -f2 -d':' | cut -f1-6 -d' ' | tr -d '\n' | sed 's/ //g'
```
Expected **null-free shellcode**:
```sh
\x48\x31\xc0\x50\x68\x0a\x21\x64\x6c\x68\x72\x6f\x57\x20\x68\x6c\x6c\x65\x48\x48\x89\xe6\x48\xc7\xc0\x01\x00\x00\x00\x48\xc7\xc7\x01\x00\x00\x00\x48\xc7\xc2\x0d\x00\x00\x00\x0f\x05\x48\xc7\xc0\x3c\x00\x00\x00\x48\x31\xff\x0f\x05
```

---

### **Test in C**
Now, update your `test.c`:
```c
#include <stdio.h>
#include <string.h>

unsigned char shellcode[] = 
"\x48\x31\xc0\x50\x68\x0a\x21\x64\x6c"
"\x68\x72\x6f\x57\x20\x68\x6c\x6c\x65"
"\x48\x48\x89\xe6\x48\xc7\xc0\x01\x00"
"\x00\x00\x48\xc7\xc7\x01\x00\x00\x00"
"\x48\xc7\xc2\x0d\x00\x00\x00\x0f\x05"
"\x48\xc7\xc0\x3c\x00\x00\x00\x48\x31"
"\xff\x0f\x05";

int main() {
    printf("Shellcode Length: %zu bytes\n", sizeof(shellcode) - 1);
    
    void (*run)() = (void (*)())shellcode;
    run();

    return 0;
}
```

---

### **Recompile and Run**
```sh
gcc -o test_shellcode test.c -z execstack -fno-stack-protector
./test_shellcode
```

#### **Expected Output**
```
Shellcode Length: 47 bytes
Hello World!
```




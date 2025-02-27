# **Logical Operations in x86_64 Assembly (SLAE64)**

## **Logical Operations**
Logical operations in assembly manipulate binary values at the bit level. Common logical instructions are:  
- **AND** (`and dest, src`) → Performs bitwise AND operation  
- **OR** (`or dest, src`) → Performs bitwise OR operation  
- **XOR** (`xor dest, src`) → Performs bitwise XOR operation  
- **NOT** (`not dest`) → Performs bitwise NOT operation  

---

## **Assembly Code Breakdown**
```assembly
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

    ; Exit program
    mov rax, 0x3c   ; syscall number for exit
    mov rdi, 0      ; return code 0
    syscall

section .data
    var1 dq 0x1111111111111111
    var2 dq 0x0
```
---

## **GDB Debugging Steps**
### **Step 1: Assemble and Link**
```bash
nasm -f elf64 logical.asm -o logical.o
ld logical.o -o logical
```
### **Step 2: Run in GDB**
```bash
gdb ./logical
```
### **Step 3: Set Breakpoints & Run**
```gdb
break _start
run
```
### **Step 4: Step Through Instructions**
```gdb
si  ; Step through each instruction
info registers  ; Check register values
```

---

## **GDB Output Analysis**
1. **NOT Operation (`not rax`)**
   - `rax = 0x0`
   - After `not rax`, `rax = 0xFFFFFFFFFFFFFFFF`
   - `rbx = 0x1111111111111111`
   - After `not rbx`, `rbx = 0xEEEEEEEEEEEEEEEE`

2. **AND Operation (`and rbx, rax`)**
   - `rbx = 0x1111111111111111`
   - `rax = 0x0`
   - `rbx & rax = 0x0`

3. **OR Operation (`or rbx, rax`)**
   - `rbx = 0x1111111111111111`
   - `rax = 0x0`
   - `rbx | rax = 0x1111111111111111`

4. **XOR Operation (`xor rax, rbx`)**
   - `rax = 0x0101010101010101`
   - `rbx = 0x1010101010101010`
   - `rax ⊕ rbx = 0x1111111111111111`
   - `xor rax, rax` → `rax = 0x0`

---

## **Conclusion**
- **NOT** inverts all bits.  
- **AND** is used for bit masking (zeroes out unwanted bits).  
- **OR** is used for setting specific bits.  
- **XOR** is used for bit toggling and clearing values.  


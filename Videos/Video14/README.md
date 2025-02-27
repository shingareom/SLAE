## **Arithmetic Operations in x86_64 Assembly**
Arithmetic operations in x86_64 assembly include basic addition, subtraction, increment, and decrement instructions. These operations modify the **EFLAGS** register, which contains important flags like **carry flag (CF), zero flag (ZF), sign flag (SF), and overflow flag (OF)**.

---

## **Instructions Covered**
- **ADD**: Adds source operand to destination.
- **ADC**: Adds source operand and carry flag to destination.
- **SUB**: Subtracts source operand from destination.
- **SBB**: Subtracts source operand and borrow flag from destination.
- **INC**: Increments the operand by 1.
- **DEC**: Decrements the operand by 1.

---

## **Assembly Code (arith.asm)**
```assembly
section .text
    global _start

_start:
    mov rax, 10      ; RAX = 10
    mov rbx, 5       ; RBX = 5

    add rax, rbx     ; RAX = RAX + RBX (10 + 5 = 15)
    
    sub rax, 2       ; RAX = RAX - 2 (15 - 2 = 13)

    inc rax          ; RAX = RAX + 1 (13 + 1 = 14)
    
    dec rax          ; RAX = RAX - 1 (14 - 1 = 13)

    adc rax, 4       ; RAX = RAX + 4 + CF (if CF=0, then 13 + 4 = 17)

    mov rax, 60      ; syscall: exit
    xor rdi, rdi
    syscall
```

---

## **Assembling, Linking, and Debugging with GDB**
### **Step 1: Assemble and Link**
```bash
nasm -f elf64 arith.asm -o arith.o
ld arith.o -o arith
```

### **Step 2: Debugging with GDB**
Run GDB:
```bash
gdb ./arith
```

Set a breakpoint and run:
```gdb
break _start
run
```

Step through instructions:
```gdb
si
info registers
```

---

## **GDB Execution and Output Trace**
After executing **info registers**, we can observe changes in **RAX**, **RBX**, and **EFLAGS**.

```gdb
(gdb) si
(gdb) info registers
```

### **Register Trace**
| Instruction | RAX  | RBX  | EFLAGS | Description |
|------------|------|------|--------|-------------|
| `mov rax,10` | 10 | - | - | Load 10 into RAX |
| `mov rbx,5` | 10 | 5 | - | Load 5 into RBX |
| `add rax,rbx` | 15 | 5 | - | 10 + 5 = 15 |
| `sub rax,2` | 13 | 5 | - | 15 - 2 = 13 |
| `inc rax` | 14 | 5 | - | 13 + 1 = 14 |
| `dec rax` | 13 | 5 | - | 14 - 1 = 13 |
| `adc rax,4` | 17 | 5 | CF=0 | 13 + 4 = 17 |

---

## **Summary**
1. **ADD** performs simple addition.
2. **SUB** performs subtraction.
3. **INC/DEC** modify values by 1.
4. **ADC** includes the carry flag in the addition.

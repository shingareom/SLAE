### **1. 64-bit Operand (Full Register)**
**Example:**
```assembly
mov rax, 0xFFFFFFFFFFFFFFFF  ; Load full 64-bit value
mov rbx, 0x1234567890ABCDEF  ; Load another 64-bit value
mov rax, rbx                 ; RAX now holds 0x1234567890ABCDEF
```
📌 **What happens?**  
- Since `rax` and `rbx` are 64-bit registers, the full 64-bit value is copied.
- The previous value in `rax` is completely replaced.

---

### **2. 32-bit Operand (Zero-Extension)**
**Example:**
```assembly
mov rax, 0xFFFFFFFFFFFFFFFF  ; Load full 64-bit value
mov eax, 0x12345678          ; Load 32-bit value into EAX
```
📌 **What happens?**  
- `eax` (the lower 32 bits of `rax`) is updated to `0x12345678`.  
- The **upper 32 bits of `rax` are zeroed** (set to `0`).  

🛑 **Final Value of `rax`:**  
```
0x0000000012345678
```
✔ **Key Rule:**  
- Writing to `eax` **automatically clears the upper 32 bits** of `rax`.

---

### **3. 8-bit and 16-bit Operand (Partial Update, Upper Bits Unchanged)**
#### **8-bit Example:**
```assembly
mov rax, 0x1122334455667788  ; Load a full 64-bit value
mov al, 0x99                 ; Modify only the lowest 8 bits
```
📌 **What happens?**  
- `al` (lowest byte of `rax`) is changed to `0x99`.  
- The **upper 56 bits remain unchanged**.

🛑 **Final Value of `rax`:**  
```
0x1122334455667799
```

---

#### **16-bit Example:**
```assembly
mov rax, 0x1122334455667788  ; Load a full 64-bit value
mov ax, 0xAAAA               ; Modify only the lowest 16 bits
```
📌 **What happens?**  
- `ax` (lowest 16 bits of `rax`) is changed to `0xAAAA`.  
- The **upper 48 bits remain unchanged**.

🛑 **Final Value of `rax`:**  
```
0x112233445566AAAA
```

✔ **Key Rule:**  
- Writing to `al` or `ax` **does NOT affect upper bits**.

---

### **4. Address Calculation Issue (Sign-Extension Required)**
**Wrong Example (Bug!):**
```assembly
mov rax, 0                   ; Clear RAX
mov al, -1                   ; AL = 0xFF (unsigned 255, but should be -1)
```
📌 **Problem?**  
- `al` = `0xFF`, but **upper bits remain unchanged**!  
- **If RAX is used for memory addressing, it might behave incorrectly.**

🛑 **Wrong Value of `rax`:**  
```
0x00000000000000FF  ; Expected: 0xFFFFFFFFFFFFFFFF (-1)
```

✔ **Correct Way (Sign-Extend):**
```assembly
movsx rax, al  ; Sign-extend AL to 64 bits
```
🛑 **Now Correct Value of `rax`:**  
```
0xFFFFFFFFFFFFFFFF  ; (-1 correctly sign-extended)
```

---

### **5. Switching from 64-bit Mode to 32-bit Mode (Upper 32 Bits Lost)**
```assembly
mov rax, 0x1234567890ABCDEF  ; Load full 64-bit value
jmp to_32bit_mode            ; Switch to 32-bit mode
```
📌 **Problem?**  
- In **32-bit mode**, only `eax` is valid.  
- The upper 32 bits (`0x12345678`) are **lost** and become **undefined**.  
- When switching back to 64-bit, `rax` **may not have the same upper bits as before**.

---

### **Final Summary**
1. **64-bit operations (`mov rax, rbx`) update the full register.**
2. **32-bit operations (`mov eax, ebx`) zero the upper 32 bits.**
3. **8-bit and 16-bit operations (`mov al, bl` or `mov ax, bx`) do not affect upper bits.**
4. **When using 8-bit/16-bit values for addresses, explicitly sign-extend (`movsx`).**
5. **Switching from 64-bit to 32-bit mode loses the upper 32 bits of registers.**


## 1. MOV Instruction

**What it does:**  
MOV is the most common instruction used to transfer (copy) data. It can move data:
- Between registers  
- From memory to a register (and vice versa)  
- From an immediate (constant) value to a register or memory

**Example: Moving Data from Memory and Immediate Values**

```assembly
section .data
    var1 dd 0x12345678    ; A 32-bit value stored in memory

section .text
    global _start
_start:
    mov eax, [var1]       ; Load the 32-bit value at address 'var1' into EAX.
    mov ebx, eax          ; Copy the value in EAX to EBX.
    mov ecx, 0x10         ; Load immediate value 0x10 into ECX.
    ; ... further code or a system exit call
```

**Output Explanation:**  
- After the first instruction, register EAX contains 0x12345678.  
- After the second, EBX also contains 0x12345678.  
- ECX is set to 0x10.  
These moves are purely transfers; the content of memory or registers is copied but not altered by the move.

---

## 2. LEA (Load Effective Address) Instruction

**What it does:**  
LEA calculates the effective address of a memory operand and loads that address into a register. It is often used for pointer arithmetic rather than fetching data.

**Example: Loading an Address**

```assembly
section .data
    var1 dd 0x12345678    ; Data stored in memory

section .text
    global _start
_start:
    lea eax, [var1]       ; EAX gets the memory address of 'var1'.
    ; ... further code or a system exit call
```

**Output Explanation:**  
- EAX will contain the address (a pointer) where `var1` is stored, not the value 0x12345678.  
- This is useful for calculations with addresses or for indirect memory accesses.

---

## 3. XCHG (Exchange) Instruction

**What it does:**  
XCHG swaps the contents of two registers or a register and a memory location.

**Example: Swapping Register Values**

```assembly
section .text
    global _start
_start:
    mov eax, 10           ; EAX = 10
    mov ebx, 20           ; EBX = 20
    xchg eax, ebx         ; Swap the values: now EAX = 20, EBX = 10
    ; ... further code or a system exit call
```

**Output Explanation:**  
- After executing `xchg eax, ebx`, the register values are swapped:  
  - EAX becomes 20  
  - EBX becomes 10  
This instruction provides a quick way to swap values without needing a temporary register.

---

### Summary

- **MOV**: Transfers data from one location to another.  
- **LEA**: Calculates and loads an effective address into a register without accessing memory content.  
- **XCHG**: Swaps data between registers or between a register and memory.
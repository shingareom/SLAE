# **Bitwise Shift and Rotate Instructions in x86-64 Assembly**
Bitwise shift and rotate operations are essential in low-level programming, cryptography, optimization, and binary manipulation. These instructions help in **multiplication, division, sign extension, circular shifts**, and **bitwise operations**.

---

## **1. Classification of Instructions**
### **A. Shift Instructions**
Shifting moves bits left or right within a register.
| **Instruction** | **Operation** | **Effect on CF (Carry Flag)** |
|---------------|-------------|---------------------------|
| `SAL/SHL` | Shift left (logical and arithmetic) | Last shifted-out bit stored in CF |
| `SHR` | Shift right (logical) | Last shifted-out bit stored in CF |
| `SAR` | Shift right (arithmetic) | Last shifted-out bit stored in CF |

### **B. Rotate Instructions**
Rotations **do not lose bits**; they circulate within a register.
| **Instruction** | **Operation** | **Effect on CF (Carry Flag)** |
|---------------|-------------|---------------------------|
| `ROL` | Rotate left | Last rotated-out bit moves to CF |
| `ROR` | Rotate right | Last rotated-out bit moves to CF |
| `RCL` | Rotate left through CF | CF is included in the rotation |
| `RCR` | Rotate right through CF | CF is included in the rotation |

---

## **2. Detailed Explanation with Examples**
### **A. Shift Left (SAL / SHL)**
- **Operation**: Moves bits left, fills `0` on the right.
- **Effect**: Equivalent to multiplying by `2^n`.
- **Example:**
  ```assembly
  mov rax, 0x00000000ffffffff
  shl rax, 32
  shl rax, 1
  ```
  **Before:** `0x00000000ffffffff`  
  **After SHL 32:** `0xffffffff00000000`  
  **After SHL 1:** `0xfffffffe00000000`  

---

### **B. Shift Right Logical (SHR)**
- **Operation**: Moves bits right, fills `0` on the left.
- **Effect**: Equivalent to dividing by `2^n`.
- **Example:**
  ```assembly
  mov rax, 0x00000000ffffffff
  shr rax, 1
  shr rax, 31
  ```
  **Before:** `0x00000000ffffffff`  
  **After SHR 1:** `0x000000007fffffff`  
  **After SHR 31:** `0x0000000000000000`  

---

### **C. Shift Right Arithmetic (SAR)**
- **Operation**: Moves bits right while preserving the **sign bit**.
- **Effect**: Used for signed division.
- **Example:**
  ```assembly
  mov rax, 0xffffffffffffffff  ; -1 in signed representation
  sar rax, 1
  ```
  **Before:** `0xffffffffffffffff` (-1 in two’s complement)  
  **After SAR 1:** `0xffffffffffffffff` (remains -1)  

---

### **D. Rotate Left (ROL)**
- **Operation**: Moves bits left, **MSB wraps to LSB**.
- **Example:**
  ```assembly
  mov rax, 0x0123456789abcdef
  rol rax, 8
  ```
  **Before:** `0x0123456789abcdef`  
  **After ROL 8:** `0x23456789abcdef01`  

---

### **E. Rotate Right (ROR)**
- **Operation**: Moves bits right, **LSB wraps to MSB**.
- **Example:**
  ```assembly
  mov rax, 0x0123456789abcdef
  ror rax, 8
  ```
  **Before:** `0x0123456789abcdef`  
  **After ROR 8:** `0xef0123456789abcd`  

---

### **F. Rotate Through Carry Left (RCL)**
- **Operation**: Similar to `ROL` but **includes CF (Carry Flag)** in the rotation.
- **Example:**
  ```assembly
  clc
  mov rax, 0x89abcdef01234567
  rcl rax, 4
  ```
  **Before:** `0x89abcdef01234567`  
  **After RCL 4:** `0x9abcdef012345678` (MSB into CF)  

---

### **G. Rotate Through Carry Right (RCR)**
- **Operation**: Similar to `ROR` but **includes CF (Carry Flag)** in the rotation.
- **Example:**
  ```assembly
  clc
  mov rax, 0x89abcdef01234567
  rcr rax, 4
  ```
  **Before:** `0x89abcdef01234567`  
  **After RCR 4:** `0xf89abcdef0123456` (CF affects MSB)  

---

## **3. GDB Debugging & Tracing**
### **A. Assemble and Link the Program**
```bash
nasm -f elf64 Arithmetic.nasm -o Arithmetic.o
ld Arithmetic.o -o Arithmetic
```
### **B. Run GDB**
```bash
gdb ./Arithmetic
```
### **C. Set a Breakpoint**
```gdb
break _start
run
```
### **D. Step Through Instructions**
```gdb
si
info registers rax
```
### **E. Print Memory**
```gdb
x/5xg $rax
```

---

## **4. Summary Table**
| **Instruction** | **Effect** | **Use Case** |
|---------------|-----------|--------------|
| `SHL` / `SAL` | Multiplies by `2^n` | Left shifts, efficient multiplication |
| `SHR` | Divides by `2^n` (zero-fill) | Bit extraction, unsigned division |
| `SAR` | Divides by `2^n` (sign-preserving) | Signed division |
| `ROL` | Circular left shift | Cryptography, hash functions |
| `ROR` | Circular right shift | Cryptography, hash functions |
| `RCL` | Circular left with CF | Special bit manipulations |
| `RCR` | Circular right with CF | Carry-aware bit rotations |

---

## **5. Real-World Applications**
- **Cryptography** → Bitwise shifts in hash functions, encryption.
- **Performance Optimization** → Multiplication/division using shifts.
- **Embedded Systems** → Efficient bit manipulations.
- **Low-Level Programming** → Bootloaders, kernel programming.

---

## **6. Example Program with All Instructions**
```assembly
global _start			

section .text
_start:
    mov rax, 0x0123456789abcdef
    shl rax, 4
    shr rax, 4
    sar rax, 4
    rol rax, 4
    ror rax, 4
    rcl rax, 4
    rcr rax, 4

    mov rax, 60    ; Exit syscall
    xor rdi, rdi
    syscall
```

## **Understanding RCL (Rotate Through Carry Left) and RCR (Rotate Through Carry Right) in Assembly**

RCL (Rotate Through Carry Left) and RCR (Rotate Through Carry Right) are **bitwise rotation instructions** that use the **Carry Flag (CF)** in addition to the bits in the register. This makes them **different from ROL and ROR**, which only operate within the register.

---

## **1. What is the Carry Flag (CF)?**
The **Carry Flag (CF)** is a special flag in the CPU that holds the last bit that was shifted out during shift/rotate operations. 

- If a bit is "pushed out" from the left or right, it goes into `CF`.
- Similarly, the bit **previously stored in CF** is "pushed into" the other side.

---

## **2. RCL (Rotate Through Carry Left)**
### **How it Works:**
- The **most significant bit (MSB)** of the register moves into **CF**.
- The **previous value of CF** moves into the **least significant bit (LSB)**.
- The rest of the bits shift left by 1.

### **Example 1: Simple RCL on an 8-bit Value**
#### **Before RCL (Rotate Through Carry Left)**
```
Register AL =  1 0 0 1 1 0 1 0    (0x9A)
Carry Flag CF =  1
```
#### **After `RCL AL, 1`**
```
Register AL =  0 0 1 1 0 1 0 1    (0x35)
Carry Flag CF =  1  (MSB was shifted into CF)
```
- The **leftmost bit (`1`) moves into CF**.
- The **previous value of CF (`1`) moves into LSB**.

### **Example 2: RCL in Assembly**
```assembly
mov al, 0x9A  ; 10011010 in binary
stc           ; Set carry flag (CF = 1)
rcl al, 1     ; Rotate AL left through carry
```
**Before:**
```
AL  =  10011010  (0x9A)
CF  =  1
```
**After RCL 1:**
```
AL  =  00110101  (0x35)
CF  =  1
```
---

## **3. RCR (Rotate Through Carry Right)**
### **How it Works:**
- The **least significant bit (LSB)** of the register moves into **CF**.
- The **previous value of CF** moves into the **most significant bit (MSB)**.
- The rest of the bits shift right by 1.

### **Example 1: Simple RCR on an 8-bit Value**
#### **Before RCR (Rotate Through Carry Right)**
```
Register AL =  1 0 0 1 1 0 1 0    (0x9A)
Carry Flag CF =  1
```
#### **After `RCR AL, 1`**
```
Register AL =  1 1 0 0 1 1 0 1    (0xCD)
Carry Flag CF =  0 (LSB was shifted into CF)
```
- The **rightmost bit (`0`) moves into CF**.
- The **previous value of CF (`1`) moves into MSB**.

### **Example 2: RCR in Assembly**
```assembly
mov al, 0x9A  ; 10011010 in binary
stc           ; Set carry flag (CF = 1)
rcr al, 1     ; Rotate AL right through carry
```
**Before:**
```
AL  =  10011010  (0x9A)
CF  =  1
```
**After RCR 1:**
```
AL  =  11001101  (0xCD)
CF  =  0
```
---

## **4. Difference Between ROL/ROR and RCL/RCR**
| **Instruction** | **CF Involvement?** | **Effect** |
|---------------|----------------|--------------|
| `ROL` | ❌ No | Normal circular left shift. |
| `ROR` | ❌ No | Normal circular right shift. |
| `RCL` | ✅ Yes | MSB goes to CF, CF goes to LSB. |
| `RCR` | ✅ Yes | LSB goes to CF, CF goes to MSB. |

---

## **5. When to Use RCL and RCR?**
- **Handling multi-byte values** (e.g., shifting a large number across multiple registers).
- **Bitwise encryption and decryption** (in cryptography).
- **Arithmetic operations that require carry bit usage**.
- **Optimizing division/multiplication when carry bits are important**.

---

## **6. Summary**
- **RCL (Rotate Through Carry Left)**
  - Shifts bits **left** while **including the carry flag** in rotation.
  - The **previous CF** moves into the **rightmost bit (LSB)**.
  - The **leftmost bit (MSB)** moves into **CF**.
- **RCR (Rotate Through Carry Right)**
  - Shifts bits **right** while **including the carry flag** in rotation.
  - The **previous CF** moves into the **leftmost bit (MSB)**.
  - The **rightmost bit (LSB)** moves into **CF**.

Understanding these instructions will help in **bitwise manipulations, optimizations, and low-level security research**. 🚀

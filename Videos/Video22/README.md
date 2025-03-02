# **64-Bit Assembly (ASM) on Linux – String Operations**  

### **1. String Operations in x86_64 Assembly**  
String operations involve **loading, storing, and moving data** efficiently using specialized instructions.

### **A. Load (Lodsb, Lodsw, Lodsd, Lodsq)**  
Used to load a value from memory into **`AL, AX, EAX, or RAX`** while advancing `RSI`.  

| Instruction | Size Loaded | Destination Register |
|------------|------------|----------------------|
| `lodsb` | 1 byte | `AL` |
| `lodsw` | 2 bytes | `AX` |
| `lodsd` | 4 bytes | `EAX` |
| `lodsq` | 8 bytes | `RAX` |

**Example Usage:**  
```assembly
cld             ; Clear direction flag (process forward)
lea rsi, [src]  ; Load address of source
lodsq           ; Load 8 bytes from [RSI] into RAX
```
- Moves `src[0:7]` into `RAX`.  
- `RSI` is **automatically incremented** by `8` bytes.  

---

### **B. Store (Stosb, Stosw, Stosd, Stosq)**  
Stores a value from **`AL, AX, EAX, or RAX`** into memory at `[RDI]`, advancing `RDI`.  

| Instruction | Size Stored | Source Register |
|------------|------------|-----------------|
| `stosb` | 1 byte | `AL` |
| `stosw` | 2 bytes | `AX` |
| `stosd` | 4 bytes | `EAX` |
| `stosq` | 8 bytes | `RAX` |

**Example Usage:**  
```assembly
cld             ; Clear direction flag (process forward)
mov rax, 0x1234567890ABCDEF
lea rdi, [dst]  ; Load address of destination
stosq           ; Store RAX value into [RDI] and increment RDI by 8
```
- Moves `RAX` into `dst[0:7]`.  
- `RDI` advances by `8` bytes.  

---

### **C. Move (Movsb, Movsw, Movsd, Movsq)**  
Copies data from `[RSI]` to `[RDI]`, advancing both registers.  

| Instruction | Size Moved | |
|------------|------------|----------------|
| `movsb` | 1 byte | `[RSI] → [RDI]` |
| `movsw` | 2 bytes | `[RSI] → [RDI]` |
| `movsd` | 4 bytes | `[RSI] → [RDI]` |
| `movsq` | 8 bytes | `[RSI] → [RDI]` |

**Example Usage:**  
```assembly
cld             ; Clear direction flag (process forward)
lea rsi, [src]  ; Load source address
lea rdi, [dst]  ; Load destination address
movsq           ; Copy 8 bytes from [RSI] to [RDI], increment both
```
- Moves `src[0:7]` into `dst[0:7]`.  
- `RSI` and `RDI` advance by `8` bytes.  

**For multiple moves, use `rep` (Repeat Prefix):**  
```assembly
cld
lea rsi, [src]  
lea rdi, [dst]  
mov rcx, 5      ; Copy 5 quadwords (40 bytes)
rep movsq       ; Copy multiple 8-byte blocks
```
- Repeats `movsq` **RCX** times.  
- `RSI` and `RDI` both advance by `40` bytes.  

---

### **3. Summary of Key Instructions**
| Operation | Instruction | Effect |
|-----------|------------|--------|
| **Load** | `lodsb, lodsw, lodsd, lodsq` | Load from `[RSI]` into `AL, AX, EAX, RAX` and advance `RSI` |
| **Store** | `stosb, stosw, stosd, stosq` | Store from `AL, AX, EAX, RAX` into `[RDI]` and advance `RDI` |
| **Move** | `movsb, movsw, movsd, movsq` | Move data from `[RSI]` to `[RDI]` and advance both |

---
### **4. Additional Notes**
- **Direction Flag (`DF`)**  
  - `cld` (Clear Direction Flag) → **Moves forward (increment RSI & RDI)**  
  - `std` (Set Direction Flag) → **Moves backward (decrement RSI & RDI)**  
- **Use `rep` for loops:**  
  - `rep movsb` → Copies `RCX` bytes  
  - `rep stosq` → Fills memory with `RAX` values  

---

### **5. Practical Use Cases**
- **Fast memory copy (like `memcpy`)**
- **String manipulation**
- **Buffer initialization**
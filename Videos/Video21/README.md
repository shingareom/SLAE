### **Simple Notes: 64-bit Assembly on Linux (SLAE64) – String Operations**  

#### **1. String Comparison Instructions**  
- **SCAS (Scan String)**: Compares a memory value with a register.  
  - **Instructions**:  
    - `scasb` (Byte) → Compares with `AL`  
    - `scasw` (Word) → Compares with `AX`  
    - `scasd` (Double Word) → Compares with `EAX`  
    - `scasq` (Quad Word) → Compares with `RAX`  

#### **2. Memory-to-Memory Comparison**  
- **CMPS (Compare String Operands)**: Compares values at two memory locations.  
  - **Instructions**:  
    - `cmpsb` (Byte) → Compares `[RSI]` with `[RDI]`  
    - `cmpsw` (Word) → Compares `[RSI]` with `[RDI]`  
    - `cmpsd` (Double Word) → Compares `[RSI]` with `[RDI]`  
    - `cmpsq` (Quad Word) → Compares `[RSI]` with `[RDI]`  

### **Key Concepts**  
- **RSI** → Source string (memory)  
- **RDI** → Destination string (memory)  
- **RAX/AL** → Register for comparison  
- **Used in**: Malware analysis, shellcoding, pentesting  


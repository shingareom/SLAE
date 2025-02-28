# **Assembly Loops - Notes from PDF**

## **Understanding `LOOP` Instruction**  
The `LOOP` instruction is a simple **counter-based looping mechanism** in x86-64 assembly.

### **How `LOOP` Works**
1. **Decrements `ECX/RCX`** (loop counter).
2. **If `ECX/RCX != 0`, it jumps** to the specified label.
3. **If `ECX/RCX == 0`, it exits** the loop.

---

## **Important Considerations**
- **Always preserve `ECX/RCX`**, as some operations (like `syscall`) may modify it.
- If `ECX/RCX` is altered during execution, it may cause **infinite loops or premature exits**.

---

## **Variations of `LOOP`**
1. **`LOOPE` (Loop While Equal)**  
   - Continues looping **while `ZF = 1`** (zero flag set).
   
2. **`LOOPNE` (Loop While Not Equal)**  
   - Continues looping **while `ZF = 0`** (zero flag clear).

---

## **Key Takeaways**
✔ `LOOP` uses `ECX/RCX` as a counter.  
✔ It **automatically decrements** `ECX/RCX`.  
✔ Always **preserve `ECX/RCX`** before system calls.  
✔ Use `LOOPE` or `LOOPNE` for **conditional loops**.  

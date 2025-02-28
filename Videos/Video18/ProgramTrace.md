# **Tracing the `LOOP` Instruction in GDB**  

This guide explains how to debug an **assembly loop using `LOOP`** in GDB while ensuring `RCX` is preserved correctly to avoid infinite loops.

---

## **Code Analysis**
```assembly
global _start

section .text
_start:
    mov rcx, 10  ; Loop counter (print message 10 times)

loophere:
    push rcx      ; Save rcx (important for preserving the loop counter)

    mov rax, 1    ; syscall: sys_write
    mov rdi, 1    ; file descriptor: stdout
    mov rsi, message  ; message to print
    mov rdx, messageLen  ; message length
    syscall       ; call sys_write

    pop rcx       ; Restore rcx after syscall
    loop loophere ; Decrement rcx, loop if rcx > 0

    mov rax, 60   ; syscall: sys_exit
    mov rdi, 0    ; exit status 0
    syscall

section .data
    message: db "I Love You Myself, Means Om Shingare!", 0x0a
    messageLen equ $-message
```

### **Key Features**
1. **Uses `LOOP`** to print the message **10 times**.
2. **Preserves `RCX`** before `syscall` (which modifies it) using `push rcx` and `pop rcx`.
3. **Avoids Infinite Loop** caused by unexpected `RCX` changes after `syscall`.

---

## **Compiling and Running in GDB**
### **Step 1: Assemble & Link**
```sh
nasm -f elf64 loop.nasm -o loop.o
ld loop.o -o loop
```

### **Step 2: Start GDB**
```sh
gdb ./loop
```

---

## **Debugging with GDB**
### **Step 3: Set Breakpoints**
```gdb
break _start       # Start of program
break loophere     # Inside the loop
break syscall      # Watch syscalls
break loop         # Watch loop execution
```

### **Step 4: Run the Program**
```gdb
run
```

---

### **Step 5: Check `RCX` Before and After Syscall**
#### **Before Syscall**
```gdb
info registers
```
- Expected output:
  ```
  RCX: 0xA  (10 in decimal)
  ```

#### **Step Through Syscall**
```gdb
si
info registers
```
- Expected **RCX change**:
  ```
  RCX: 0x0  (May be modified by syscall)
  ```
- If `RCX` is lost, the loop **breaks or continues indefinitely**.

#### **Restore `RCX` & Continue**
```gdb
si
info registers
```
- Expected:
  ```
  RCX: 0x9  (Loop decremented properly)
  ```

---

### **Step 6: Observe `LOOP` Execution**
```gdb
x/s message  # Display the message
info registers  # Check RCX after each loop
```
- After 10 iterations:
  ```
  RCX: 0x0  (Loop exits)
  ```
- Execution jumps to `sys_exit`.

---

## **Expected Output**
```
I Love You Myself, Means Om Shingare!
I Love You Myself, Means Om Shingare!
I Love You Myself, Means Om Shingare!
I Love You Myself, Means Om Shingare!
I Love You Myself, Means Om Shingare!
I Love You Myself, Means Om Shingare!
I Love You Myself, Means Om Shingare!
I Love You Myself, Means Om Shingare!
I Love You Myself, Means Om Shingare!
I Love You Myself, Means Om Shingare!
```

---

## **Key Debugging Takeaways**
✔ **Breakpoints on `syscall`, `loophere`, and `loop` help track execution.**  
✔ **Syscalls modify `RCX`**, so we **push and pop `RCX`** to prevent issues.  
✔ **Use `info registers` frequently** to track `RCX` changes.  
✔ **Expected `RCX` behavior:** Starts at `10`, decrements on each loop, reaches `0`, exits loop.  

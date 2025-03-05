### **JMP-CALL-POP Technique in Shellcoding**
The **JMP-CALL-POP** technique is a way to dynamically retrieve the address of a string or shellcode without using hardcoded memory addresses. This is crucial in shellcoding to ensure portability and avoid null bytes (`0x00`), which can break execution.

---

## **How JMP-CALL-POP Works**
### **Step 1: JMP (Jump)**
- The shellcode starts by jumping to a `CALL` instruction.
- This is used to move execution forward.

### **Step 2: CALL (Call)**
- The `CALL` instruction pushes the address of the next instruction (which contains the actual data) onto the stack.
- Then, it jumps to the target label (which is often the main shellcode logic).

### **Step 3: POP (Pop)**
- The `POP` instruction retrieves the address of the stored data (e.g., the "Hello World" string) from the stack into a register.
- This allows the shellcode to use this address dynamically without hardcoding it.

---

## **Example of JMP-CALL-POP in Assembly**
```assembly
section .text
    global _start

_start:
    jmp short call_shellcode

shellcode:
    pop rsi                ; Pop address of "Hello World" into RSI
    mov rax, 0x1           ; Syscall: sys_write
    mov rdi, 0x1           ; File descriptor: stdout
    mov rdx, 13            ; Message length
    syscall                ; Invoke syscall

    mov rax, 0x3C          ; Syscall: sys_exit
    xor rdi, rdi           ; Exit status 0
    syscall                ; Invoke syscall

call_shellcode:
    call shellcode         ; Push address of "Hello World" onto stack
    db "Hello World!", 0xA ; Message string (newline included)
```

---

## **Explanation**
1. **`jmp short call_shellcode`** → Jumps over the shellcode to the `call_shellcode` label.
2. **`call shellcode`** → Pushes the address of the next instruction (string `"Hello World!"`) onto the stack and jumps to `shellcode`.
3. **`pop rsi`** → Retrieves the stored address of `"Hello World!"` into the `RSI` register.
4. **Use `sys_write`** to print the message to `stdout`.
5. **Exit using `sys_exit`**.

---

## **Advantages of JMP-CALL-POP**
✅ **Avoids Hardcoded Addresses** – Makes shellcode more flexible.  
✅ **Removes Null Bytes** – Helps prevent string termination issues.  
✅ **Compatible with ASLR** – Works even when memory locations change dynamically.  

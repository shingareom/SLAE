# **Assembly Control Instructions - Notes & GDB Trace**

## **Control Instructions Overview**
Control instructions **alter the flow of execution** in a program. These instructions decide which part of the code runs based on conditions or jumps.

### **Types of Control Instructions**
1. **Unconditional Jump (`JMP`)**
   - Similar to the `GOTO` statement in C.
   - Directly jumps to another part of the program.
   
2. **Conditional Jumps (`JXX`)**
   - Takes decisions based on flags set by previous operations.
   - Examples:
     - `JZ` (Jump if Zero)
     - `JNZ` (Jump if Not Zero)
     - `JA` (Jump if Above)
     - `JAE` (Jump if Above or Equal)
     - `JC` (Jump if Carry)
     - `JNC` (Jump if No Carry)

---

## **Example Code Analysis (`Control.nasm`)**
```assembly
global _start			

section .text
_start:
	jmp Begin

NeverExecute:
	mov rax, 0x10
	xor rbx, rbx

Begin:
	mov rax, 0x5

PrintHW:
	push rax

	mov rax, 1
	mov rdi, 1
	mov rsi, message 
	mov rdx, mlen
	syscall

	pop rax
	dec rax
	jnz PrintHW

	mov rax, 60
	mov rdi, 11
	syscall

section .data
	message: db "Hello World! ", 0x0a
	mlen     equ $-message
```
### **Code Behavior**
1. **Jump Over Unused Code**
   - `jmp Begin` **skips** `NeverExecute`.
   
2. **Loop for Printing**
   - Starts with `rax = 5`.
   - Pushes `rax` onto stack.
   - Prints `"Hello World!"`.
   - Restores `rax`, decrements it.
   - If `rax ≠ 0`, jumps back to print again (`jnz PrintHW`).
   - Runs **5 iterations**.

3. **Exit the Program**
   - `syscall 60` terminates the program.

---

## **GDB Debugging & Tracing**
### **1. Assemble & Link the Program**
```sh
nasm -f elf64 Control.nasm -o Control.o
ld Control.o -o Control
```

### **2. Run GDB**
```sh
gdb ./Control
```

### **3. Set Breakpoints**
```gdb
break _start
break PrintHW
break sys_exit
```

### **4. Start Execution**
```gdb
run
```

### **5. Step Through Execution**
```gdb
disas _start  # Show assembly code
si            # Step into instructions
info registers  # Check register values
```

### **6. Observe `rax` Decrementing**
```gdb
x/s message    # Check message
```

### **7. Exit when `rax` = 0**
```gdb
continue
```

---

## **GDB Execution Trace**
### **Initial State**
```
(gdb) info registers
RAX: 0x5  RBX: 0x0  RCX: 0x0  RDX: 0xd  
```

### **Loop Iterations**
1. `rax = 5`
2. `rax = 4`
3. `rax = 3`
4. `rax = 2`
5. `rax = 1`
6. `rax = 0` → **Exit condition met, jumps out of loop.**

### **Exit**
```
(gdb) info registers
RAX: 0x3C  RDI: 0xB  
```
- `RAX = 60` (exit syscall)
- `RDI = 11` (exit code)

---

## **Key Takeaways**
- **JMP**: Unconditionally jumps, skipping `NeverExecute`.
- **JNZ**: Runs the loop 5 times before exiting.
- **Syscalls**: `write (1)` prints output, `exit (60)` terminates.
- **GDB Debugging** helps trace register changes.


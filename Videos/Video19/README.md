### **Assembly Procedures in Linux (64-bit)**
#### **What is a Procedure?**
- A procedure is a set of operations grouped together.
- It is called multiple times from different places in the code.
- In NASM, procedures are defined using **labels** and called using `CALL Procedure_Name`.

#### **Format of a Procedure in NASM**
```assembly
ProcedureName:
    ; Code inside procedure
    ...
    RET
```
- Procedures must end with a `RET` instruction to return control to the caller.

#### **Passing Arguments to Procedures**
Arguments can be passed:
1. **Via Registers** – Common method in assembly.
2. **On the Stack** – Push parameters onto the stack before calling the procedure.
3. **Via Memory** – Data structures stored in memory, referenced using registers or the stack.

---

### **Understanding the Given Assembly Code**
#### **Code Overview**
```assembly
global _start

section .text

helloWorldPrintProc:
    mov rax, 1          ; syscall number for sys_write
    mov rdi, 1          ; file descriptor 1 (stdout)
    mov rsi, message    ; pointer to message
    mov rdx, messageLen ; length of message
    syscall
    ret                 ; return from procedure

_start:
    mov rcx, 5          ; loop counter set to 5

loopup:
    push rcx            ; save rcx (loop counter) on stack
    call helloWorldPrintProc  ; call the print procedure
    pop rcx             ; restore rcx
    loop loopup         ; decrement rcx and loop if not zero

    mov rax, 60         ; syscall number for exit
    mov rdi, 0          ; exit status 0
    syscall             ; terminate program

section .data
    message: db "I Love You Myself, Means Om Shingare!", 0x0a
    messageLen equ $-message
```

---

### **Step-by-Step Execution**
#### **1. The `_start` Label**
- This is the entry point.
- It initializes `rcx = 5`, which will control the loop.

#### **2. The `loopup` Label**
- Saves `rcx` (loop counter) on the stack.
- Calls `helloWorldPrintProc` (which prints the message).
- Restores `rcx` after the function call.
- Uses `loop` instruction, which:
  - Decrements `rcx`
  - Jumps to `loopup` if `rcx != 0`

#### **3. The `helloWorldPrintProc` Procedure**
- Uses `sys_write` to print the message.
- Returns back to the caller after execution.

#### **4. Program Termination**
- When `rcx` reaches 0, it exits by calling `sys_exit`.

---

### **Tracing Execution Using `gdb`**
#### **Step 1: Assemble and Link**
```bash
nasm -f elf64 program.asm -o program.o
ld program.o -o program
```
#### **Step 2: Run `gdb`**
```bash
gdb ./program
```
#### **Step 3: Set Breakpoints**
```gdb
break _start
break helloWorldPrintProc
break loopup
run
```
#### **Step 4: Step Through Execution**
```gdb
si      # Step instruction
info registers   # Check register values
disas   # View disassembled code
```
#### **Expected GDB Output**
```text
Breakpoint 1, _start ()
=> 0x0000000000401000 <_start>: mov rcx,0x5
(gdb) si
0x0000000000401005 <loopup>: push rcx
(gdb) si
0x0000000000401006 <loopup+1>: call 0x40100c <helloWorldPrintProc>
(gdb) si
```
- `rcx` starts at 5.
- Calls `helloWorldPrintProc`.
- Prints `"I Love You Myself, Means Om Shingare!"` 5 times.
- Exits when `rcx` reaches 0.


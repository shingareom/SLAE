### **Understanding `hook-stop` in GDB**
In **GDB (GNU Debugger)**, `hook-stop` is a user-defined command that executes **automatically** every time the debugger stops (e.g., at a breakpoint, after a `step`, or `next` instruction). It allows you to display useful debugging information automatically without typing additional commands.

### **How to Use `hook-stop` in GDB**
You can define `hook-stop` inside GDB to print registers, memory values, or any other useful debugging information.

#### **Example: Using `hook-stop` in GDB**
Consider the following simple assembly code (`hookstop.asm`), which moves a value into a register and stops execution:

```assembly
section .text
global _start
_start:
    mov rax, 0x12345678  ; Load value into RAX
    mov rbx, 0x87654321  ; Load value into RBX
    int 3               ; Software breakpoint for debugging
```

### **Step 1: Assemble and Run with GDB**
Assemble and link the code:
```bash
nasm -f elf64 hookstop.asm -o hookstop.o
ld hookstop.o -o hookstop
gdb ./hookstop
```

### **Step 2: Define `hook-stop` Inside GDB**
Run GDB and enter the following:

```gdb
define hook-stop
    printf "Stopped at address: %p\n", $pc
    printf "RAX: 0x%lx\n", $rax
    printf "RBX: 0x%lx\n", $rbx
end
```

### **Step 3: Set a Breakpoint and Run**
Inside GDB:
```gdb
break _start
run
step
```
At this point, GDB will **automatically** execute `hook-stop` whenever it stops.

### **Expected Output:**
```
Breakpoint 1, 0x0000000000401000 in _start ()
Stopped at address: 0x401000
RAX: 0x12345678
RBX: 0x87654321
```

### **How It Works**
1. Every time GDB stops, it prints:
   - The current **instruction address** (`$pc`).
   - The **RAX** and **RBX** register values.
2. This helps automate debugging, saving time when checking register/memory values.


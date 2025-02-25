# Data Types in 64-bit Systems (SLAE/Videos/Video09)

## Overview

This explains the use of various data types in a 64-bit system using an example program `HelloWorld` in assembly, disassembled and examined using `gdb` (GNU Debugger).

## Setup Instructions

Lets get started...

## Debugging with GDB

### Step 1: Starting GDB
Start GDB with the compiled `HelloWorld` binary:

```bash
gdb ./HelloWorld -q
```

This will load the program into GDB, where you can begin debugging.

### Step 2: Disassembling the `_start` function
In this program, we focus on the `_start` function, which is the entry point of the program. To disassemble the code:

```bash
disassemble _start
```

This provides a detailed view of the assembly instructions executed at the entry point. Here's an example of what you might see:

```
+ (0x0000000000401000 <+0>:     mov    eax,0x1)
0x0000000000401005 <+5>:     mov    edi,0x1
0x000000000040100a <+10>:    movabs rsi,0x402000
0x0000000000401014 <+20>:    mov    edx,0x29
0x0000000000401019 <+25>:    syscall
0x000000000040101b <+27>:    movabs rax,0x402031
0x0000000000401025 <+37>:    mov    rax,QWORD PTR ds:0x402031
0x000000000040102d <+45>:    mov    eax,0x3c
0x0000000000401032 <+50>:    mov    edi,0x0
0x0000000000401037 <+55>:    syscall
```

This sequence of instructions handles writing the string and exiting the program.

### Step 3: Exploring Variables
Use the `info variables` command to list the variables defined in the program:

```bash
info variables
```

The output shows non-debugging symbols like `hello_world`, `var1`, `var2`, and `repeat_buffer`. These correspond to data stored in memory.

### Step 4: Examining Memory

To view the contents of the memory at a specific address, use the `x` (examine) command with appropriate format specifiers. For example:

```bash
x/2xb &var1
```

This shows two bytes starting from the address of `var1`:

```
0x402029:       0x11    0x22
```

Similarly, you can use `x/xg` to examine a larger memory region:

```bash
x/xg &var4
```

This displays a 64-bit value:

```
0x402031:       0xaabbccdd11223344
```

### Step 5: Setting Breakpoints and Stepping Through Code
To analyze the program flow, set breakpoints at key locations:

```bash
break *0x0000000000401000  # Set a breakpoint at _start
```

Then, use `r` to run the program and `nexti` or `stepi` to step through the instructions one by one.

### Step 6: Inspecting Registers
You can inspect the registers using the `info registers` command. This provides a snapshot of the current state of the CPU registers:

```bash
info registers
```

The output includes register values such as `rax`, `rbx`, `rcx`, `rdi`, `rsi`, etc. These are crucial when debugging low-level programs and understanding how data is passed between registers.

For example:

```
rax            0x29                41
rbx            0x0                 0
rdi            0x1                 1
rsi            0x402000            4202496
```

### Step 7: Memory Analysis

Using `x/128xb &repeat_buffer`, you can examine larger buffers and see how data is stored in memory. For instance:

```bash
x/128xb &repeat_buffer
```

Output might show memory values like this:

```
0x402039:       0xaa    0xaa    0xaa    0xaa    0xaa    0xaa    0xaa    0xaa
...
```

This demonstrates how data is repeated in memory.

## Key Data Types in 64-bit Assembly

Here are some key data types and their size representations in a 64-bit system:

- **Bytes (b)**: 8 bits.
- **Halfwords (h)**: 16 bits.
- **Words (w)**: 32 bits.
- **Double words (g)**: 64 bits.

These data types are fundamental in understanding how data is moved between registers and memory in assembly language.

## Conclusion

By stepping through the program using GDB, you can see how data is represented and manipulated in memory. This provides a deeper understanding of the data types in a 64-bit system and how they are used in low-level programming.
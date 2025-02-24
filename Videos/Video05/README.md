in this video we are looking forward the CPU registors for 64 system

### **General-Purpose Registers Overview**
A **register** is a small storage location inside the CPU, used for fast calculations and memory operations. These registers come in different sizes:  
- **8-bit (Byte)**
- **16-bit (Word)**
- **32-bit (Doubleword)**
- **64-bit (Quadword)**

### **Register Naming Without and With REX Prefix**
#### **1. Byte (8-bit) Registers**
- **Without REX (old style)**: AL, BL, CL, DL, AH, BH, CH, DH
- **With REX (new style)**: AL, BL, CL, DL, DIL, SIL, BPL, SPL, R8L-R15L (adds extra registers)

#### **2. Word (16-bit) Registers**
- **Without REX**: AX, BX, CX, DX, DI, SI, BP, SP
- **With REX**: AX, BX, CX, DX, DI, SI, BP, SP, R8W-R15W

#### **3. Doubleword (32-bit) Registers**
- **Without REX**: EAX, EBX, ECX, EDX, EDI, ESI, EBP, ESP
- **With REX**: EAX, EBX, ECX, EDX, EDI, ESI, EBP, ESP, R8D-R15D

#### **4. Quadword (64-bit) Registers**
- **With REX only**: RAX, RBX, RCX, RDX, RDI, RSI, RBP, RSP, R8-R15  

---

### **Limitations in 64-bit Mode**
1. **No Mixing of Legacy High-Byte Registers (AH, BH, CH, DH) and New Registers**  
   - Example (❌ Not allowed): Using `AH` and `R8L` in the same instruction.
   - Example (✅ Allowed): Using `AL` and `R8L` together.

2. **REX Prefix Changes High Byte Registers**  
   - If you use the REX prefix, registers like AH, BH, CH, DH are replaced by newer ones like BPL, SPL, DIL, and SIL.

---

### **How Register Sizes Affect the Result**
- **64-bit operations**: The full 64-bit result is stored in the register.
- **32-bit operations**: The result is stored in the lower 32 bits, and the upper 32 bits are automatically set to 0.
- **8-bit & 16-bit operations**: The result affects only the lower 8 or 16 bits, and the remaining bits stay unchanged.

**Important Note:** If you're doing 64-bit memory calculations, you might need to manually extend an 8-bit or 16-bit result to a full 64-bit value.

---

### **Why This Matters?**
- If you're writing low-level code, assembly, or working with exploits, understanding register behavior helps in debugging and optimization.
- The introduction of the REX prefix in 64-bit mode gives access to more registers but also introduces restrictions (e.g., no AH, BH, CH, DH when using new registers).


### Many more in notes refer the pdf brohhh

### Registers From GDB

<pre>
<font color="#2AA1B3"><b>Videos/Video03/GDB_Test</b></font> on <font color="#A347BA"><b> master</b></font> <font color="#C01C28"><b>[!]</b></font> via <font color="#AFD75F"><b>C v13.3.0-gcc </b></font>on <font color="#A2734C"><b>☁️  (ap-southeast-1) </b></font>
<font color="#26A269"><b>❯</b></font> <font color="#12488B">gdb</font> <font color="#2AA1B3"><u style="text-decoration-style:solid">./gdb_test</u></font>
<font color="#A347BA"><b>GNU gdb (Ubuntu 15.0.50.20240403-0ubuntu1) 15.0.50.20240403-git</b></font>
Copyright (C) 2024 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later &lt;<font color="#26A269">http://gnu.org/licenses/gpl.html</font>&gt;
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
Type &quot;show copying&quot; and &quot;show warranty&quot; for details.
This GDB was configured as &quot;x86_64-linux-gnu&quot;.
Type &quot;show configuration&quot; for configuration details.
For bug reporting instructions, please see:
<font color="#26A269">&lt;https://www.gnu.org/software/gdb/bugs/&gt;</font>.
Find the GDB manual and other documentation resources online at:
    &lt;<font color="#26A269">http://www.gnu.org/software/gdb/documentation/</font>&gt;.

For help, type &quot;help&quot;.
Type &quot;apropos word&quot; to search for commands related to &quot;word&quot;...
Reading symbols from <font color="#26A269">./gdb_test</font>...
(No debugging symbols found in <font color="#26A269">./gdb_test</font>)
(gdb) break *main
Breakpoint 1 at <font color="#12488B">0x1169</font>
(gdb) r admin
Starting program: <font color="#26A269">/home/tyrell/Desktop/SLAE/Videos/Video03/GDB_Test/gdb_test</font> admin
[Thread debugging using libthread_db enabled]
Using host libthread_db library &quot;<font color="#26A269">/lib/x86_64-linux-gnu/libthread_db.so.1</font>&quot;.

Breakpoint 1, <font color="#12488B">0x0000555555555169</font> in <font color="#A2734C">main</font> ()
(gdb) info registers 
rax            0x555555555169      93824992235881
rbx            0x7fffffffe538      140737488348472
rcx            0x555555557db8      93824992247224
rdx            0x7fffffffe550      140737488348496
rsi            0x7fffffffe538      140737488348472
rdi            0x2                 2
rbp            0x7fffffffe4b0      0x7fffffffe4b0
rsp            0x7fffffffe418      0x7fffffffe418
r8             0x0                 0
r9             0x7ffff7fca380      140737353917312
r10            0x7fffffffe130      140737488347440
r11            0x203               515
r12            0x2                 2
r13            0x0                 0
r14            0x555555557db8      93824992247224
r15            0x7ffff7ffd000      140737354125312
rip            0x555555555169      0x555555555169 &lt;main&gt;
eflags         0x246               [ PF ZF IF ]
cs             0x33                51
ss             0x2b                43
ds             0x0                 0
es             0x0                 0
fs             0x0                 0
gs             0x0                 0
k0             0x820000            8519680
k1             0x100               256
k2             0x0                 0
k3             0x0                 0
k4             0x0                 0
k5             0x0                 0
k6             0x0                 0
--Type &lt;RET&gt; for more, q to quit, c to continue without paging--
k7             0x0                 0
fs_base        0x7ffff7fa0740      140737353746240
gs_base        0x0                 0
(gdb) 

</pre>

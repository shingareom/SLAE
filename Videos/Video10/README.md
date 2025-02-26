### **Little Endian vs Big Endian**  

#### **1. What is Endianness?**  
Endianness refers to how bytes are ordered in memory. There are two types:  
- **Little Endian:** Least significant byte (LSB) is stored at the lowest memory address.  
- **Big Endian:** Most significant byte (MSB) is stored at the lowest memory address.  

#### **2. Example Representation**  
Consider the 32-bit hexadecimal number `0x12345678` stored in memory:  

| Address  | Big Endian  | Little Endian  |
|----------|------------|---------------|
| 0x1000   | 12         | 78            |
| 0x1001   | 34         | 56            |
| 0x1002   | 56         | 34            |
| 0x1003   | 78         | 12            |

- **Big Endian:** Stores the MSB at the lowest address.  
- **Little Endian:** Stores the LSB at the lowest address.  

#### **3. Simple NASM Hello World Program**
```assembly
section .data
    message db "Hello, World!", 0

section .text
    global _start

_start:
    mov rax, 1          ; syscall: write
    mov rdi, 1          ; file descriptor: stdout
    mov rsi, message    ; address of string
    mov rdx, 13         ; length of string
    syscall

    mov rax, 60         ; syscall: exit
    xor rdi, rdi        ; status 0
    syscall
```

#### **4. Debugging with GDB**  
Assemble and run the code in GDB:  
```bash
nasm -f elf64 hello.asm -o hello.o
ld hello.o -o hello
gdb hello
```

##### **Checking Endianness in GDB**  
Use the `x` command to inspect memory:  
```gdb
(gdb) x/4xb &message
0x600100:   0x48  0x65  0x6c  0x6c  ; 'H', 'e', 'l', 'l'
```
Since it prints bytes in the correct order, x86-64 follows **little-endian** format.  

#### **5. Summary**
- **Little Endian:** Stores LSB first. Used by x86, ARM (default), RISC-V (default).  
- **Big Endian:** Stores MSB first. Used by some network protocols, older architectures like PowerPC.  
- **In GDB, `x/xb` shows memory in the order stored, confirming little-endian behavior on x86-64.**



<pre>
<font color="#2AA1B3"><b>SLAE/Videos/Video10</b></font> on <font color="#A347BA"><b> master</b></font> on <font color="#A2734C"><b>☁️  (ap-southeast-1) </b></font>
<font color="#26A269"><b>❯</b></font> <font color="#12488B">gdb</font> <font color="#2AA1B3"><u style="text-decoration-style:solid">./HelloWorld</u></font> <font color="#2AA1B3">-q</font>
Reading symbols from <font color="#26A269">./HelloWorld</font>...
(No debugging symbols found in <font color="#26A269">./HelloWorld</font>)
(gdb) b _statr
Function &quot;_statr&quot; not defined.
Make breakpoint pending on future shared library load? (y or [n]) n
(gdb) b _start
Breakpoint 1 at <font color="#12488B">0x401000</font>
(gdb) r
Starting program: <font color="#26A269">/home/tyrell/Desktop/SLAE/Videos/Video10/HelloWorld</font> 

Breakpoint 1, <font color="#12488B">0x0000000000401000</font> in <font color="#A2734C">_start</font> ()
(gdb) info registers 
rax            0x0                 0
rbx            0x0                 0
rcx            0x0                 0
rdx            0x0                 0
rsi            0x0                 0
rdi            0x0                 0
rbp            0x0                 0x0
rsp            0x7fffffffe530      0x7fffffffe530
r8             0x0                 0
r9             0x0                 0
r10            0x0                 0
r11            0x0                 0
r12            0x0                 0
r13            0x0                 0
r14            0x0                 0
r15            0x0                 0
rip            0x401000            0x401000 &lt;_start&gt;
eflags         0x202               [ IF ]
cs             0x33                51
ss             0x2b                43
--Type &lt;RET&gt; for more, q to quit, c to continue without paging--
ds             0x0                 0
es             0x0                 0
fs             0x0                 0
gs             0x0                 0
k0             0x0                 0
k1             0x0                 0
k2             0x0                 0
k3             0x0                 0
k4             0x0                 0
k5             0x0                 0
k6             0x0                 0
k7             0x0                 0
fs_base        0x0                 0
gs_base        0x0                 0
(gdb) i var
All defined variables:

Non-debugging symbols:
<font color="#12488B">0x0000000000402000</font>  hello_world
<font color="#12488B">0x0000000000402028</font>  var1
<font color="#12488B">0x0000000000402030</font>  var2
<font color="#12488B">0x0000000000402038</font>  __bss_start
<font color="#12488B">0x0000000000402038</font>  _edata
<font color="#12488B">0x0000000000402038</font>  _end
(gdb) x/8xb &amp;var1
<font color="#12488B">0x402028</font>:	0x00	0x12	0x22	0x33	0x44	0x55	0x66	0x77
(gdb) x/8xb &amp;var2
<font color="#12488B">0x402030</font>:	0x77	0x66	0x55	0x44	0x33	0x22	0x11	0x00
(gdb) x/8xh &amp;var2
<font color="#12488B">0x402030</font>:	0x6677	0x4455	0x2233	0x0011	0x0000	0x0000	0x0000	0x0000
(gdb) x/8xh &amp;var1
<font color="#12488B">0x402028</font>:	0x1200	0x3322	0x5544	0x7766	0x6677	0x4455	0x2233	0x0011
(gdb) x/4x &amp;var1
<font color="#12488B">0x402028</font>:	0x1200	0x3322	0x5544	0x7766
(gdb) x/2xw &amp;var1
<font color="#12488B">0x402028</font>:	0x33221200	0x77665544
(gdb) x/xg &amp;var1
<font color="#12488B">0x402028</font>:	0x7766554433221200
(gdb) same for the var2
Undefined command: &quot;same&quot;.  Try &quot;help&quot;.
(gdb) 
Undefined command: &quot;same&quot;.  Try &quot;help&quot;.
(gdb) set disassembly-flavor intel
(gdb) disas _start
Dump of assembler code for function <font color="#A2734C">_start</font>:
=&gt; <font color="#12488B">0x0000000000401000</font> &lt;+0&gt;:	<font color="#26A269">mov    </font><font color="#C01C28">al</font>,<font color="#12488B">0x1</font>
   <font color="#12488B">0x0000000000401002</font> &lt;+2&gt;:	<font color="#26A269">mov    </font><font color="#C01C28">edi</font>,<font color="#12488B">0x1</font>
   <font color="#12488B">0x0000000000401007</font> &lt;+7&gt;:	<font color="#26A269">movabs </font><font color="#C01C28">rsi</font>,<font color="#12488B">0x402000</font>
   <font color="#12488B">0x0000000000401011</font> &lt;+17&gt;:	<font color="#26A269">mov    </font><font color="#C01C28">edx</font>,<font color="#12488B">0x28</font>
   <font color="#12488B">0x0000000000401016</font> &lt;+22&gt;:	<font color="#26A269">syscall</font>
   <font color="#12488B">0x0000000000401018</font> &lt;+24&gt;:	<font color="#26A269">mov    </font><font color="#C01C28">rax</font>,QWORD PTR <font color="#C01C28">ds</font>:0x402028
   <font color="#12488B">0x0000000000401020</font> &lt;+32&gt;:	<font color="#26A269">mov    </font><font color="#C01C28">rbx</font>,QWORD PTR <font color="#C01C28">ds</font>:0x402030
   <font color="#12488B">0x0000000000401028</font> &lt;+40&gt;:	<font color="#26A269">mov    </font><font color="#C01C28">eax</font>,<font color="#12488B">0x3c</font>
   <font color="#12488B">0x000000000040102d</font> &lt;+45&gt;:	<font color="#26A269">mov    </font><font color="#C01C28">edi</font>,<font color="#12488B">0x2</font>
   <font color="#12488B">0x0000000000401032</font> &lt;+50&gt;:	<font color="#26A269">syscall</font>
End of assembler dump.
(gdb) b *$rip+24
Breakpoint 2 at <font color="#12488B">0x401018</font>
(gdb) r
The program being debugged has been started already.
Start it from the beginning? (y or n) n
Program not restarted.
(gdb) c
Continuing.
Hello World to this course and this repo
Breakpoint 2, <font color="#12488B">0x0000000000401018</font> in <font color="#A2734C">_start</font> ()
(gdb) info registers 
rax            0x28                40
rbx            0x0                 0
rcx            0x401018            4198424
rdx            0x28                40
rsi            0x402000            4202496
rdi            0x1                 1
rbp            0x0                 0x0
rsp            0x7fffffffe530      0x7fffffffe530
r8             0x0                 0
r9             0x0                 0
r10            0x0                 0
r11            0x202               514
r12            0x0                 0
r13            0x0                 0
r14            0x0                 0
r15            0x0                 0
rip            0x401018            0x401018 &lt;_start+24&gt;
eflags         0x202               [ IF ]
cs             0x33                51
ss             0x2b                43
--Type &lt;RET&gt; for more, q to quit, c to continue without paging--
ds             0x0                 0
es             0x0                 0
fs             0x0                 0
gs             0x0                 0
k0             0x0                 0
k1             0x0                 0
k2             0x0                 0
k3             0x0                 0
k4             0x0                 0
k5             0x0                 0
k6             0x0                 0
k7             0x0                 0
fs_base        0x0                 0
gs_base        0x0                 0
(gdb) as you can see the registors value is 28 now check that.
Undefined command: &quot;as&quot;.  Try &quot;help&quot;.
(gdb) stepi
<font color="#12488B">0x0000000000401020</font> in <font color="#A2734C">_start</font> ()
(gdb) info registers 
rax            0x7766554433221200  8603657889541919232
rbx            0x0                 0
rcx            0x401018            4198424
rdx            0x28                40
rsi            0x402000            4202496
rdi            0x1                 1
rbp            0x0                 0x0
rsp            0x7fffffffe530      0x7fffffffe530
r8             0x0                 0
r9             0x0                 0
r10            0x0                 0
r11            0x202               514
r12            0x0                 0
r13            0x0                 0
r14            0x0                 0
r15            0x0                 0
rip            0x401020            0x401020 &lt;_start+32&gt;
eflags         0x202               [ IF ]
cs             0x33                51
ss             0x2b                43
--Type &lt;RET&gt; for more, q to quit, c to continue without paging--
ds             0x0                 0
es             0x0                 0
fs             0x0                 0
gs             0x0                 0
k0             0x0                 0
k1             0x0                 0
k2             0x0                 0
k3             0x0                 0
k4             0x0                 0
k5             0x0                 0
k6             0x0                 0
k7             0x0                 0
fs_base        0x0                 0
gs_base        0x0                 0
(gdb) now its 0x7766554433221200
Undefined command: &quot;now&quot;.  Try &quot;help&quot;.
(gdb) stepi
<font color="#12488B">0x0000000000401028</font> in <font color="#A2734C">_start</font> ()
(gdb) info registers 
rax            0x7766554433221200  8603657889541919232
rbx            0x11223344556677    4822678189205111
rcx            0x401018            4198424
rdx            0x28                40
rsi            0x402000            4202496
rdi            0x1                 1
rbp            0x0                 0x0
rsp            0x7fffffffe530      0x7fffffffe530
r8             0x0                 0
r9             0x0                 0
r10            0x0                 0
r11            0x202               514
r12            0x0                 0
r13            0x0                 0
r14            0x0                 0
r15            0x0                 0
rip            0x401028            0x401028 &lt;_start+40&gt;
eflags         0x202               [ IF ]
cs             0x33                51
ss             0x2b                43
--Type &lt;RET&gt; for more, q to quit, c to continue without paging--
ds             0x0                 0
es             0x0                 0
fs             0x0                 0
gs             0x0                 0
k0             0x0                 0
k1             0x0                 0
k2             0x0                 0
k3             0x0                 0
k4             0x0                 0
k5             0x0                 0
k6             0x0                 0
k7             0x0                 0
fs_base        0x0                 0
gs_base        0x0                 0
(gdb) now rbx is 0x11223344556677
Undefined command: &quot;now&quot;.  Try &quot;help&quot;.
(gdb) there we go...
Undefined command: &quot;there&quot;.  Try &quot;help&quot;.
(gdb) q
A debugging session is active.

	Inferior 1 [process 262598] will be killed.

Quit anyway? (y or n) y

<font color="#2AA1B3"><b>SLAE/Videos/Video10</b></font> on <font color="#A347BA"><b> master</b></font> on <font color="#A2734C"><b>☁️  (ap-southeast-1) </b></font>took <font color="#A2734C"><b>3m7s</b></font> 
<font color="#26A269"><b>❯</b></font> 

</pre>

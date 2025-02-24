### Here will be the output of what i have did to crack the binary.


<pre>
<font color="#2AA1B3"><b>Videos/Video03/GDB_Test</b></font> on <font color="#A347BA"><b> master</b></font> <font color="#C01C28"><b>[!?]</b></font> via <font color="#AFD75F"><b>C v13.3.0-gcc </b></font>on <font color="#A2734C"><b>☁️  (ap-southeast-1) </b></font>
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
+ (gdb) break *main
Breakpoint 1 at <font color="#12488B">0x1169</font>
+ (gdb) r admin
Starting program: <font color="#26A269">/home/tyrell/Desktop/SLAE/Videos/Video03/GDB_Test/gdb_test</font> admin
[Thread debugging using libthread_db enabled]
Using host libthread_db library &quot;<font color="#26A269">/lib/x86_64-linux-gnu/libthread_db.so.1</font>&quot;.

Breakpoint 1, <font color="#12488B">0x0000555555555169</font> in <font color="#A2734C">main</font> ()
+ (gdb) disas *main
Dump of assembler code for function <font color="#A2734C">main</font>:
=&gt; <font color="#12488B">0x0000555555555169</font> &lt;+0&gt;:	<font color="#26A269">endbr64</font>
   <font color="#12488B">0x000055555555516d</font> &lt;+4&gt;:	<font color="#26A269">push   </font><font color="#C01C28">%rbp</font>
   <font color="#12488B">0x000055555555516e</font> &lt;+5&gt;:	<font color="#26A269">mov    </font><font color="#C01C28">%rsp</font>,<font color="#C01C28">%rbp</font>
   <font color="#12488B">0x0000555555555171</font> &lt;+8&gt;:	<font color="#26A269">sub    </font><font color="#12488B">$0x20</font>,<font color="#C01C28">%rsp</font>
   <font color="#12488B">0x0000555555555175</font> &lt;+12&gt;:	<font color="#26A269">mov    </font><font color="#C01C28">%edi</font>,<font color="#12488B">-0x14</font>(<font color="#C01C28">%rbp</font>)
   <font color="#12488B">0x0000555555555178</font> &lt;+15&gt;:	<font color="#26A269">mov    </font><font color="#C01C28">%rsi</font>,<font color="#12488B">-0x20</font>(<font color="#C01C28">%rbp</font>)
   <font color="#12488B">0x000055555555517c</font> &lt;+19&gt;:	<font color="#26A269">lea    </font><font color="#12488B">0xe85</font>(<font color="#C01C28">%rip</font>),<font color="#C01C28">%rax</font><font color="#8B8A88">        # 0x555555556008</font>
   <font color="#12488B">0x0000555555555183</font> &lt;+26&gt;:	<font color="#26A269">mov    </font><font color="#C01C28">%rax</font>,<font color="#12488B">-0x8</font>(<font color="#C01C28">%rbp</font>)
   <font color="#12488B">0x0000555555555187</font> &lt;+30&gt;:	<font color="#26A269">mov    </font><font color="#12488B">-0x20</font>(<font color="#C01C28">%rbp</font>),<font color="#C01C28">%rax</font>
   <font color="#12488B">0x000055555555518b</font> &lt;+34&gt;:	<font color="#26A269">add    </font><font color="#12488B">$0x8</font>,<font color="#C01C28">%rax</font>
   <font color="#12488B">0x000055555555518f</font> &lt;+38&gt;:	<font color="#26A269">mov    </font>(<font color="#C01C28">%rax</font>),<font color="#C01C28">%rax</font>
   <font color="#12488B">0x0000555555555192</font> &lt;+41&gt;:	<font color="#26A269">mov    </font><font color="#12488B">-0x8</font>(<font color="#C01C28">%rbp</font>),<font color="#C01C28">%rdx</font>
   <font color="#12488B">0x0000555555555196</font> &lt;+45&gt;:	<font color="#26A269">mov    </font><font color="#C01C28">%rdx</font>,<font color="#C01C28">%rsi</font>
   <font color="#12488B">0x0000555555555199</font> &lt;+48&gt;:	<font color="#26A269">mov    </font><font color="#C01C28">%rax</font>,<font color="#C01C28">%rdi</font>
   <font color="#12488B">0x000055555555519c</font> &lt;+51&gt;:	<font color="#26A269">call   </font><font color="#12488B">0x555555555070</font> &lt;<font color="#A2734C">strcmp@plt</font>&gt;
   <font color="#12488B">0x00005555555551a1</font> &lt;+56&gt;:	<font color="#26A269">test   </font><font color="#C01C28">%eax</font>,<font color="#C01C28">%eax</font>
   <font color="#12488B">0x00005555555551a3</font> &lt;+58&gt;:	<font color="#26A269">jne    </font><font color="#12488B">0x5555555551b6</font> &lt;<font color="#A2734C">main</font>+77&gt;
   <font color="#12488B">0x00005555555551a5</font> &lt;+60&gt;:	<font color="#26A269">lea    </font><font color="#12488B">0xe74</font>(<font color="#C01C28">%rip</font>),<font color="#C01C28">%rax</font><font color="#8B8A88">        # 0x555555556020</font>
   <font color="#12488B">0x00005555555551ac</font> &lt;+67&gt;:	<font color="#26A269">mov    </font><font color="#C01C28">%rax</font>,<font color="#C01C28">%rdi</font>
   <font color="#12488B">0x00005555555551af</font> &lt;+70&gt;:	<font color="#26A269">call   </font><font color="#12488B">0x555555555060</font> &lt;<font color="#A2734C">puts@plt</font>&gt;
   <font color="#12488B">0x00005555555551b4</font> &lt;+75&gt;:	<font color="#26A269">jmp    </font><font color="#12488B">0x5555555551c5</font> &lt;<font color="#A2734C">main</font>+92&gt;
   <font color="#12488B">0x00005555555551b6</font> &lt;+77&gt;:	<font color="#26A269">lea    </font><font color="#12488B">0xeab</font>(<font color="#C01C28">%rip</font>),<font color="#C01C28">%rax</font><font color="#8B8A88">        # 0x555555556068</font>
   <font color="#12488B">0x00005555555551bd</font> &lt;+84&gt;:	<font color="#26A269">mov    </font><font color="#C01C28">%rax</font>,<font color="#C01C28">%rdi</font>
   <font color="#12488B">0x00005555555551c0</font> &lt;+87&gt;:	<font color="#26A269">call   </font><font color="#12488B">0x555555555060</font> &lt;<font color="#A2734C">puts@plt</font>&gt;
   <font color="#12488B">0x00005555555551c5</font> &lt;+92&gt;:	<font color="#26A269">mov    </font><font color="#12488B">$0x0</font>,<font color="#C01C28">%eax</font>
   <font color="#12488B">0x00005555555551ca</font> &lt;+97&gt;:	<font color="#26A269">leave</font>
   <font color="#12488B">0x00005555555551cb</font> &lt;+98&gt;:	<font color="#26A269">ret</font>
End of assembler dump.
+ (gdb) set disassembly-flavor intel
+ (gdb) disas *main
Dump of assembler code for function <font color="#A2734C">main</font>:
=&gt; <font color="#12488B">0x0000555555555169</font> &lt;+0&gt;:	<font color="#26A269">endbr64</font>
   <font color="#12488B">0x000055555555516d</font> &lt;+4&gt;:	<font color="#26A269">push   </font><font color="#C01C28">rbp</font>
   <font color="#12488B">0x000055555555516e</font> &lt;+5&gt;:	<font color="#26A269">mov    </font><font color="#C01C28">rbp</font>,<font color="#C01C28">rsp</font>
   <font color="#12488B">0x0000555555555171</font> &lt;+8&gt;:	<font color="#26A269">sub    </font><font color="#C01C28">rsp</font>,<font color="#12488B">0x20</font>
   <font color="#12488B">0x0000555555555175</font> &lt;+12&gt;:	<font color="#26A269">mov    </font>DWORD PTR [<font color="#C01C28">rbp</font><font color="#12488B">-0x14</font>],<font color="#C01C28">edi</font>
   <font color="#12488B">0x0000555555555178</font> &lt;+15&gt;:	<font color="#26A269">mov    </font>QWORD PTR [<font color="#C01C28">rbp</font><font color="#12488B">-0x20</font>],<font color="#C01C28">rsi</font>
   <font color="#12488B">0x000055555555517c</font> &lt;+19&gt;:	<font color="#26A269">lea    </font><font color="#C01C28">rax</font>,[<font color="#C01C28">rip</font>+<font color="#12488B">0xe85</font>]<font color="#8B8A88">        # 0x555555556008</font>
   <font color="#12488B">0x0000555555555183</font> &lt;+26&gt;:	<font color="#26A269">mov    </font>QWORD PTR [<font color="#C01C28">rbp</font><font color="#12488B">-0x8</font>],<font color="#C01C28">rax</font>
   <font color="#12488B">0x0000555555555187</font> &lt;+30&gt;:	<font color="#26A269">mov    </font><font color="#C01C28">rax</font>,QWORD PTR [<font color="#C01C28">rbp</font><font color="#12488B">-0x20</font>]
   <font color="#12488B">0x000055555555518b</font> &lt;+34&gt;:	<font color="#26A269">add    </font><font color="#C01C28">rax</font>,<font color="#12488B">0x8</font>
   <font color="#12488B">0x000055555555518f</font> &lt;+38&gt;:	<font color="#26A269">mov    </font><font color="#C01C28">rax</font>,QWORD PTR [<font color="#C01C28">rax</font>]
   <font color="#12488B">0x0000555555555192</font> &lt;+41&gt;:	<font color="#26A269">mov    </font><font color="#C01C28">rdx</font>,QWORD PTR [<font color="#C01C28">rbp</font><font color="#12488B">-0x8</font>]
   <font color="#12488B">0x0000555555555196</font> &lt;+45&gt;:	<font color="#26A269">mov    </font><font color="#C01C28">rsi</font>,<font color="#C01C28">rdx</font>
   <font color="#12488B">0x0000555555555199</font> &lt;+48&gt;:	<font color="#26A269">mov    </font><font color="#C01C28">rdi</font>,<font color="#C01C28">rax</font>
   <font color="#12488B">0x000055555555519c</font> &lt;+51&gt;:	<font color="#26A269">call   </font><font color="#12488B">0x555555555070</font> &lt;<font color="#A2734C">strcmp@plt</font>&gt;
   <font color="#12488B">0x00005555555551a1</font> &lt;+56&gt;:	<font color="#26A269">test   </font><font color="#C01C28">eax</font>,<font color="#C01C28">eax</font>
   <font color="#12488B">0x00005555555551a3</font> &lt;+58&gt;:	<font color="#26A269">jne    </font><font color="#12488B">0x5555555551b6</font> &lt;<font color="#A2734C">main</font>+77&gt;
   <font color="#12488B">0x00005555555551a5</font> &lt;+60&gt;:	<font color="#26A269">lea    </font><font color="#C01C28">rax</font>,[<font color="#C01C28">rip</font>+<font color="#12488B">0xe74</font>]<font color="#8B8A88">        # 0x555555556020</font>
   <font color="#12488B">0x00005555555551ac</font> &lt;+67&gt;:	<font color="#26A269">mov    </font><font color="#C01C28">rdi</font>,<font color="#C01C28">rax</font>
   <font color="#12488B">0x00005555555551af</font> &lt;+70&gt;:	<font color="#26A269">call   </font><font color="#12488B">0x555555555060</font> &lt;<font color="#A2734C">puts@plt</font>&gt;
   <font color="#12488B">0x00005555555551b4</font> &lt;+75&gt;:	<font color="#26A269">jmp    </font><font color="#12488B">0x5555555551c5</font> &lt;<font color="#A2734C">main</font>+92&gt;
   <font color="#12488B">0x00005555555551b6</font> &lt;+77&gt;:	<font color="#26A269">lea    </font><font color="#C01C28">rax</font>,[<font color="#C01C28">rip</font>+<font color="#12488B">0xeab</font>]<font color="#8B8A88">        # 0x555555556068</font>
   <font color="#12488B">0x00005555555551bd</font> &lt;+84&gt;:	<font color="#26A269">mov    </font><font color="#C01C28">rdi</font>,<font color="#C01C28">rax</font>
   <font color="#12488B">0x00005555555551c0</font> &lt;+87&gt;:	<font color="#26A269">call   </font><font color="#12488B">0x555555555060</font> &lt;<font color="#A2734C">puts@plt</font>&gt;
   <font color="#12488B">0x00005555555551c5</font> &lt;+92&gt;:	<font color="#26A269">mov    </font><font color="#C01C28">eax</font>,<font color="#12488B">0x0</font>
   <font color="#12488B">0x00005555555551ca</font> &lt;+97&gt;:	<font color="#26A269">leave</font>
   <font color="#12488B">0x00005555555551cb</font> &lt;+98&gt;:	<font color="#26A269">ret</font>
End of assembler dump.
+ (gdb) break *0x0000555555555196
Breakpoint 2 at <font color="#12488B">0x555555555196</font>
+ (gdb) info registers 
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
--Type &lt;RET&gt; for more, q to quit, c to continue without paging--
k5             0x0                 0
k6             0x0                 0
k7             0x0                 0
fs_base        0x7ffff7fa0740      140737353746240
gs_base        0x0                 0
+ (gdb) x/s $rsi
<font color="#12488B">0x7fffffffe538</font>:	&quot;W\350\377\377\377\177&quot;
+ (gdb) x/s $rax
<font color="#12488B">0x555555555169</font> &lt;<font color="#A2734C">main</font>&gt;:	&quot;\363\017\036\372UH\211\345H\203\354 \211}\354H\211u\340H\215\005\205\016&quot;
+ (gdb) x/s $rdx
<font color="#12488B">0x7fffffffe550</font>:	&quot;\230\350\377\377\377\177&quot;
+ (gdb) x/s $rdi
<font color="#12488B">0x2</font>:	&lt;error: Cannot access memory at address 0x2&gt;
+ (gdb) c
Continuing.

Breakpoint 2, <font color="#12488B">0x0000555555555196</font> in <font color="#A2734C">main</font> ()
+ (gdb) x/s $rdx
<font color="#12488B">0x555555556008</font>:	&quot;PentesterAcademyPass&quot;
+ (gdb) x/s $rax
<font color="#12488B">0x7fffffffe892</font>:	&quot;admin&quot;
+ (gdb) set $rax = &quot;admin&quot;
+ (gdb) x/s $rax
<font color="#12488B">0x5555555592a0</font>:	&quot;admin&quot;
+ (gdb) set $rax = &quot;PentesterAcademyPass&quot;
+ (gdb) x/s $rax
<font color="#12488B">0x5555555592c0</font>:	&quot;PentesterAcademyPass&quot;
+ (gdb) c
Continuing.

Welcome to the SLAE 64-bit course! Please proceed to the next video!
[Inferior 1 (process 42425) exited normally]
+ (gdb) 
</pre>


Live OverFlow Solution if the binary is stripped

<pre>+ (gdb) info files
Symbols from &quot;/home/tyrell/Desktop/SLAE/Videos/Video03/GDB_Test/gdb_test&quot;.
Local exec file:
	`<font color="#26A269">/home/tyrell/Desktop/SLAE/Videos/Video03/GDB_Test/gdb_test</font>&apos;, file type elf64-x86-64.
	Entry point: 0x555555555080
	0x0000555555554318 - 0x0000555555554334 is .interp
	0x0000555555554338 - 0x0000555555554368 is .note.gnu.property
	0x0000555555554368 - 0x000055555555438c is .note.gnu.build-id
	0x000055555555438c - 0x00005555555543ac is .note.ABI-tag
	0x00005555555543b0 - 0x00005555555543d4 is .gnu.hash
	0x00005555555543d8 - 0x0000555555554498 is .dynsym
	0x0000555555554498 - 0x000055555555452c is .dynstr
	0x000055555555452c - 0x000055555555453c is .gnu.version
	0x0000555555554540 - 0x0000555555554570 is .gnu.version_r
	0x0000555555554570 - 0x0000555555554630 is .rela.dyn
	0x0000555555554630 - 0x0000555555554660 is .rela.plt
	0x0000555555555000 - 0x000055555555501b is .init
	0x0000555555555020 - 0x0000555555555050 is .plt
	0x0000555555555050 - 0x0000555555555060 is .plt.got
	0x0000555555555060 - 0x0000555555555080 is .plt.sec
	0x0000555555555080 - 0x00005555555551cc is .text
	0x00005555555551cc - 0x00005555555551d9 is .fini
	0x0000555555556000 - 0x0000555555556095 is .rodata
	0x0000555555556098 - 0x00005555555560cc is .eh_frame_hdr
	0x00005555555560d0 - 0x000055555555617c is .eh_frame
	0x0000555555557db0 - 0x0000555555557db8 is .init_array
	0x0000555555557db8 - 0x0000555555557dc0 is .fini_array
	0x0000555555557dc0 - 0x0000555555557fb0 is .dynamic
	0x0000555555557fb0 - 0x0000555555558000 is .got
	0x0000555555558000 - 0x0000555555558010 is .data
	0x0000555555558010 - 0x0000555555558018 is .bss
	0x00007ffff7fc52a8 - 0x00007ffff7fc52c8 is .note.gnu.property in <font color="#26A269">/lib64/ld-linux-x86-64.so.2</font>
--Type &lt;RET&gt; for more, q to quit, c to continue without paging--
	0x00007ffff7fc52c8 - 0x00007ffff7fc52ec is .note.gnu.build-id in <font color="#26A269">/lib64/ld-linux-x86-64.so.2</font>
	0x00007ffff7fc52f0 - 0x00007ffff7fc542c is .hash in <font color="#26A269">/lib64/ld-linux-x86-64.so.2</font>
	0x00007ffff7fc5430 - 0x00007ffff7fc5590 is .gnu.hash in <font color="#26A269">/lib64/ld-linux-x86-64.so.2</font>
	0x00007ffff7fc5590 - 0x00007ffff7fc5950 is .dynsym in <font color="#26A269">/lib64/ld-linux-x86-64.so.2</font>
	0x00007ffff7fc5950 - 0x00007ffff7fc5c1a is .dynstr in <font color="#26A269">/lib64/ld-linux-x86-64.so.2</font>
	0x00007ffff7fc5c1a - 0x00007ffff7fc5c6a is .gnu.version in <font color="#26A269">/lib64/ld-linux-x86-64.so.2</font>
	0x00007ffff7fc5c70 - 0x00007ffff7fc5d5c is .gnu.version_d in <font color="#26A269">/lib64/ld-linux-x86-64.so.2</font>
	0x00007ffff7fc5d60 - 0x00007ffff7fc5da8 is .rela.dyn in <font color="#26A269">/lib64/ld-linux-x86-64.so.2</font>
	0x00007ffff7fc5da8 - 0x00007ffff7fc5dc0 is .relr.dyn in <font color="#26A269">/lib64/ld-linux-x86-64.so.2</font>
	0x00007ffff7fc6000 - 0x00007ffff7ff0195 is .text in <font color="#26A269">/lib64/ld-linux-x86-64.so.2</font>
	0x00007ffff7ff1000 - 0x00007ffff7ff74b0 is .rodata in <font color="#26A269">/lib64/ld-linux-x86-64.so.2</font>
	0x00007ffff7ff74b0 - 0x00007ffff7ff74b1 is .stapsdt.base in <font color="#26A269">/lib64/ld-linux-x86-64.so.2</font>
	0x00007ffff7ff74b4 - 0x00007ffff7ff7df0 is .eh_frame_hdr in <font color="#26A269">/lib64/ld-linux-x86-64.so.2</font>
	0x00007ffff7ff7df0 - 0x00007ffff7ffa8dc is .eh_frame in <font color="#26A269">/lib64/ld-linux-x86-64.so.2</font>
	0x00007ffff7ffb360 - 0x00007ffff7ffce58 is .data.rel.ro in <font color="#26A269">/lib64/ld-linux-x86-64.so.2</font>
	0x00007ffff7ffce58 - 0x00007ffff7ffcfd8 is .dynamic in <font color="#26A269">/lib64/ld-linux-x86-64.so.2</font>
	0x00007ffff7ffcfd8 - 0x00007ffff7ffd000 is .got in <font color="#26A269">/lib64/ld-linux-x86-64.so.2</font>
	0x00007ffff7ffd000 - 0x00007ffff7ffe104 is .data in <font color="#26A269">/lib64/ld-linux-x86-64.so.2</font>
	0x00007ffff7ffe110 - 0x00007ffff7ffe2d8 is .bss in <font color="#26A269">/lib64/ld-linux-x86-64.so.2</font>
	0x00007ffff7fc3120 - 0x00007ffff7fc3168 is .hash in <font color="#26A269">system-supplied DSO at 0x7ffff7fc3000</font>
	0x00007ffff7fc3168 - 0x00007ffff7fc31c4 is .gnu.hash in <font color="#26A269">system-supplied DSO at 0x7ffff7fc3000</font>
	0x00007ffff7fc31c8 - 0x00007ffff7fc3300 is .dynsym in <font color="#26A269">system-supplied DSO at 0x7ffff7fc3000</font>
	0x00007ffff7fc3300 - 0x00007ffff7fc338b is .dynstr in <font color="#26A269">system-supplied DSO at 0x7ffff7fc3000</font>
	0x00007ffff7fc338c - 0x00007ffff7fc33a6 is .gnu.version in <font color="#26A269">system-supplied DSO at 0x7ffff7fc3000</font>
	0x00007ffff7fc33a8 - 0x00007ffff7fc33e0 is .gnu.version_d in <font color="#26A269">system-supplied DSO at 0x7ffff7fc3000</font>
	0x00007ffff7fc33e0 - 0x00007ffff7fc3500 is .dynamic in <font color="#26A269">system-supplied DSO at 0x7ffff7fc3000</font>
	0x00007ffff7fc3500 - 0x00007ffff7fc3554 is .note in <font color="#26A269">system-supplied DSO at 0x7ffff7fc3000</font>
	0x00007ffff7fc3554 - 0x00007ffff7fc35b0 is .eh_frame_hdr in <font color="#26A269">system-supplied DSO at 0x7ffff7fc3000</font>
	0x00007ffff7fc35b0 - 0x00007ffff7fc36f0 is .eh_frame in <font color="#26A269">system-supplied DSO at 0x7ffff7fc3000</font>
	0x00007ffff7fc36f0 - 0x00007ffff7fc3f9d is .text in <font color="#26A269">system-supplied DSO at 0x7ffff7fc3000</font>
	0x00007ffff7fc3f9d - 0x00007ffff7fc406f is .altinstructions in <font color="#26A269">system-supplied DSO at 0x7ffff7fc3000</font>
--Type &lt;RET&gt; for more, q to quit, c to continue without paging--
	0x00007ffff7fc406f - 0x00007ffff7fc40ab is .altinstr_replacement in <font color="#26A269">system-supplied DSO at 0x7ffff7fc3000</font>
	0x00007ffff7c00350 - 0x00007ffff7c00380 is .note.gnu.property in <font color="#26A269">/lib/x86_64-linux-gnu/libc.so.6</font>
	0x00007ffff7c00380 - 0x00007ffff7c003a4 is .note.gnu.build-id in <font color="#26A269">/lib/x86_64-linux-gnu/libc.so.6</font>
	0x00007ffff7c003a4 - 0x00007ffff7c003c4 is .note.ABI-tag in <font color="#26A269">/lib/x86_64-linux-gnu/libc.so.6</font>
	0x00007ffff7c003c8 - 0x00007ffff7c04504 is .hash in <font color="#26A269">/lib/x86_64-linux-gnu/libc.so.6</font>
	0x00007ffff7c04508 - 0x00007ffff7c095dc is .gnu.hash in <font color="#26A269">/lib/x86_64-linux-gnu/libc.so.6</font>
	0x00007ffff7c095e0 - 0x00007ffff7c1bdc0 is .dynsym in <font color="#26A269">/lib/x86_64-linux-gnu/libc.so.6</font>
	0x00007ffff7c1bdc0 - 0x00007ffff7c24630 is .dynstr in <font color="#26A269">/lib/x86_64-linux-gnu/libc.so.6</font>
	0x00007ffff7c24630 - 0x00007ffff7c25ed8 is .gnu.version in <font color="#26A269">/lib/x86_64-linux-gnu/libc.so.6</font>
	0x00007ffff7c25ed8 - 0x00007ffff7c26484 is .gnu.version_d in <font color="#26A269">/lib/x86_64-linux-gnu/libc.so.6</font>
	0x00007ffff7c26488 - 0x00007ffff7c264c8 is .gnu.version_r in <font color="#26A269">/lib/x86_64-linux-gnu/libc.so.6</font>
	0x00007ffff7c264c8 - 0x00007ffff7c26cd8 is .rela.dyn in <font color="#26A269">/lib/x86_64-linux-gnu/libc.so.6</font>
	0x00007ffff7c26cd8 - 0x00007ffff7c27290 is .rela.plt in <font color="#26A269">/lib/x86_64-linux-gnu/libc.so.6</font>
	0x00007ffff7c27290 - 0x00007ffff7c27390 is .relr.dyn in <font color="#26A269">/lib/x86_64-linux-gnu/libc.so.6</font>
	0x00007ffff7c28000 - 0x00007ffff7c283e0 is .plt in <font color="#26A269">/lib/x86_64-linux-gnu/libc.so.6</font>
	0x00007ffff7c283e0 - 0x00007ffff7c28400 is .plt.got in <font color="#26A269">/lib/x86_64-linux-gnu/libc.so.6</font>
	0x00007ffff7c28400 - 0x00007ffff7c287d0 is .plt.sec in <font color="#26A269">/lib/x86_64-linux-gnu/libc.so.6</font>
	0x00007ffff7c28800 - 0x00007ffff7dafcb9 is .text in <font color="#26A269">/lib/x86_64-linux-gnu/libc.so.6</font>
	0x00007ffff7db0000 - 0x00007ffff7dd6720 is .rodata in <font color="#26A269">/lib/x86_64-linux-gnu/libc.so.6</font>
	0x00007ffff7dd6720 - 0x00007ffff7dd6721 is .stapsdt.base in <font color="#26A269">/lib/x86_64-linux-gnu/libc.so.6</font>
	0x00007ffff7dd6740 - 0x00007ffff7dd67a0 is rodata.cst32 in <font color="#26A269">/lib/x86_64-linux-gnu/libc.so.6</font>
	0x00007ffff7dd67a0 - 0x00007ffff7dd67bc is .interp in <font color="#26A269">/lib/x86_64-linux-gnu/libc.so.6</font>
	0x00007ffff7dd67bc - 0x00007ffff7ddde28 is .eh_frame_hdr in <font color="#26A269">/lib/x86_64-linux-gnu/libc.so.6</font>
	0x00007ffff7ddde28 - 0x00007ffff7dfda54 is .eh_frame in <font color="#26A269">/lib/x86_64-linux-gnu/libc.so.6</font>
	0x00007ffff7dfda54 - 0x00007ffff7dfe082 is .gcc_except_table in <font color="#26A269">/lib/x86_64-linux-gnu/libc.so.6</font>
	0x00007ffff7dffc60 - 0x00007ffff7dffc70 is .tdata in <font color="#26A269">/lib/x86_64-linux-gnu/libc.so.6</font>
	0x00007ffff7dffc70 - 0x00007ffff7dffce8 is .tbss in <font color="#26A269">/lib/x86_64-linux-gnu/libc.so.6</font>
	0x00007ffff7dffc70 - 0x00007ffff7dffc80 is .init_array in <font color="#26A269">/lib/x86_64-linux-gnu/libc.so.6</font>
	0x00007ffff7dffc80 - 0x00007ffff7e02940 is .data.rel.ro in <font color="#26A269">/lib/x86_64-linux-gnu/libc.so.6</font>
	0x00007ffff7e02940 - 0x00007ffff7e02b80 is .dynamic in <font color="#26A269">/lib/x86_64-linux-gnu/libc.so.6</font>
	0x00007ffff7e02b80 - 0x00007ffff7e02fe8 is .got in <font color="#26A269">/lib/x86_64-linux-gnu/libc.so.6</font>
--Type &lt;RET&gt; for more, q to quit, c to continue without paging--q
Quit
+ (gdb) x/10s 0x555555555080
<font color="#12488B">0x555555555080</font> &lt;<font color="#A2734C">_start</font>&gt;:	&quot;\363\017\036\3721\355I\211\321^H\211\342H\203\344\360PTE1\3001\311H\215&quot;, &lt;incomplete sequence \312&gt;
<font color="#12488B">0x55555555509d</font> &lt;<font color="#A2734C">_start</font>+29&gt;:	&quot;&quot;
<font color="#12488B">0x55555555509e</font> &lt;<font color="#A2734C">_start</font>+30&gt;:	&quot;&quot;
<font color="#12488B">0x55555555509f</font> &lt;<font color="#A2734C">_start</font>+31&gt;:	&quot;\377\0253/&quot;
<font color="#12488B">0x5555555550a4</font> &lt;<font color="#A2734C">_start</font>+36&gt;:	&quot;&quot;
<font color="#12488B">0x5555555550a5</font> &lt;<font color="#A2734C">_start</font>+37&gt;:	&quot;\364f.\017\037\204&quot;
<font color="#12488B">0x5555555550ac</font>:	&quot;&quot;
<font color="#12488B">0x5555555550ad</font>:	&quot;&quot;
<font color="#12488B">0x5555555550ae</font>:	&quot;&quot;
<font color="#12488B">0x5555555550af</font>:	&quot;&quot;
+ (gdb) x/10i 0x555555555080
   <font color="#12488B">0x555555555080</font> &lt;<font color="#A2734C">_start</font>&gt;:	<font color="#26A269">endbr64</font>
   <font color="#12488B">0x555555555084</font> &lt;<font color="#A2734C">_start</font>+4&gt;:	<font color="#26A269">xor    </font><font color="#C01C28">ebp</font>,<font color="#C01C28">ebp</font>
   <font color="#12488B">0x555555555086</font> &lt;<font color="#A2734C">_start</font>+6&gt;:	<font color="#26A269">mov    </font><font color="#C01C28">r9</font>,<font color="#C01C28">rdx</font>
   <font color="#12488B">0x555555555089</font> &lt;<font color="#A2734C">_start</font>+9&gt;:	<font color="#26A269">pop    </font><font color="#C01C28">rsi</font>
   <font color="#12488B">0x55555555508a</font> &lt;<font color="#A2734C">_start</font>+10&gt;:	<font color="#26A269">mov    </font><font color="#C01C28">rdx</font>,<font color="#C01C28">rsp</font>
   <font color="#12488B">0x55555555508d</font> &lt;<font color="#A2734C">_start</font>+13&gt;:	<font color="#26A269">and    </font><font color="#C01C28">rsp</font>,<font color="#12488B">0xfffffffffffffff0</font>
   <font color="#12488B">0x555555555091</font> &lt;<font color="#A2734C">_start</font>+17&gt;:	<font color="#26A269">push   </font><font color="#C01C28">rax</font>
   <font color="#12488B">0x555555555092</font> &lt;<font color="#A2734C">_start</font>+18&gt;:	<font color="#26A269">push   </font><font color="#C01C28">rsp</font>
   <font color="#12488B">0x555555555093</font> &lt;<font color="#A2734C">_start</font>+19&gt;:	<font color="#26A269">xor    </font><font color="#C01C28">r8d</font>,<font color="#C01C28">r8d</font>
   <font color="#12488B">0x555555555096</font> &lt;<font color="#A2734C">_start</font>+22&gt;:	<font color="#26A269">xor    </font><font color="#C01C28">ecx</font>,<font color="#C01C28">ecx</font>
+ (gdb) x/12i 0x555555555080
   <font color="#12488B">0x555555555080</font> &lt;<font color="#A2734C">_start</font>&gt;:	<font color="#26A269">endbr64</font>
   <font color="#12488B">0x555555555084</font> &lt;<font color="#A2734C">_start</font>+4&gt;:	<font color="#26A269">xor    </font><font color="#C01C28">ebp</font>,<font color="#C01C28">ebp</font>
   <font color="#12488B">0x555555555086</font> &lt;<font color="#A2734C">_start</font>+6&gt;:	<font color="#26A269">mov    </font><font color="#C01C28">r9</font>,<font color="#C01C28">rdx</font>
   <font color="#12488B">0x555555555089</font> &lt;<font color="#A2734C">_start</font>+9&gt;:	<font color="#26A269">pop    </font><font color="#C01C28">rsi</font>
   <font color="#12488B">0x55555555508a</font> &lt;<font color="#A2734C">_start</font>+10&gt;:	<font color="#26A269">mov    </font><font color="#C01C28">rdx</font>,<font color="#C01C28">rsp</font>
   <font color="#12488B">0x55555555508d</font> &lt;<font color="#A2734C">_start</font>+13&gt;:	<font color="#26A269">and    </font><font color="#C01C28">rsp</font>,<font color="#12488B">0xfffffffffffffff0</font>
   <font color="#12488B">0x555555555091</font> &lt;<font color="#A2734C">_start</font>+17&gt;:	<font color="#26A269">push   </font><font color="#C01C28">rax</font>
   <font color="#12488B">0x555555555092</font> &lt;<font color="#A2734C">_start</font>+18&gt;:	<font color="#26A269">push   </font><font color="#C01C28">rsp</font>
   <font color="#12488B">0x555555555093</font> &lt;<font color="#A2734C">_start</font>+19&gt;:	<font color="#26A269">xor    </font><font color="#C01C28">r8d</font>,<font color="#C01C28">r8d</font>
   <font color="#12488B">0x555555555096</font> &lt;<font color="#A2734C">_start</font>+22&gt;:	<font color="#26A269">xor    </font><font color="#C01C28">ecx</font>,<font color="#C01C28">ecx</font>
   <font color="#12488B">0x555555555098</font> &lt;<font color="#A2734C">_start</font>+24&gt;:	<font color="#26A269">lea    </font><font color="#C01C28">rdi</font>,[<font color="#C01C28">rip</font>+<font color="#12488B">0xca</font>]<font color="#8B8A88">        # 0x555555555169 &lt;main&gt;</font>
   <font color="#12488B">0x55555555509f</font> &lt;<font color="#A2734C">_start</font>+31&gt;:	<font color="#26A269">call   </font>QWORD PTR [<font color="#C01C28">rip</font>+<font color="#12488B">0x2f33</font>]<font color="#8B8A88">        # 0x555555557fd8</font>
+ (gdb) set disassembly-flavor 
att    intel  
+ (gdb) set disassembly-flavor 
att    intel  
+ (gdb) set disassembly-flavor att 
+ (gdb) x/12i 0x555555555080
   <font color="#12488B">0x555555555080</font> &lt;<font color="#A2734C">_start</font>&gt;:	<font color="#26A269">endbr64</font>
   <font color="#12488B">0x555555555084</font> &lt;<font color="#A2734C">_start</font>+4&gt;:	<font color="#26A269">xor    </font><font color="#C01C28">%ebp</font>,<font color="#C01C28">%ebp</font>
   <font color="#12488B">0x555555555086</font> &lt;<font color="#A2734C">_start</font>+6&gt;:	<font color="#26A269">mov    </font><font color="#C01C28">%rdx</font>,<font color="#C01C28">%r9</font>
   <font color="#12488B">0x555555555089</font> &lt;<font color="#A2734C">_start</font>+9&gt;:	<font color="#26A269">pop    </font><font color="#C01C28">%rsi</font>
   <font color="#12488B">0x55555555508a</font> &lt;<font color="#A2734C">_start</font>+10&gt;:	<font color="#26A269">mov    </font><font color="#C01C28">%rsp</font>,<font color="#C01C28">%rdx</font>
   <font color="#12488B">0x55555555508d</font> &lt;<font color="#A2734C">_start</font>+13&gt;:	<font color="#26A269">and    </font><font color="#12488B">$0xfffffffffffffff0</font>,<font color="#C01C28">%rsp</font>
   <font color="#12488B">0x555555555091</font> &lt;<font color="#A2734C">_start</font>+17&gt;:	<font color="#26A269">push   </font><font color="#C01C28">%rax</font>
   <font color="#12488B">0x555555555092</font> &lt;<font color="#A2734C">_start</font>+18&gt;:	<font color="#26A269">push   </font><font color="#C01C28">%rsp</font>
   <font color="#12488B">0x555555555093</font> &lt;<font color="#A2734C">_start</font>+19&gt;:	<font color="#26A269">xor    </font><font color="#C01C28">%r8d</font>,<font color="#C01C28">%r8d</font>
   <font color="#12488B">0x555555555096</font> &lt;<font color="#A2734C">_start</font>+22&gt;:	<font color="#26A269">xor    </font><font color="#C01C28">%ecx</font>,<font color="#C01C28">%ecx</font>
   <font color="#12488B">0x555555555098</font> &lt;<font color="#A2734C">_start</font>+24&gt;:	<font color="#26A269">lea    </font><font color="#12488B">0xca</font>(<font color="#C01C28">%rip</font>),<font color="#C01C28">%rdi</font><font color="#8B8A88">        # 0x555555555169 &lt;main&gt;</font>
   <font color="#12488B">0x55555555509f</font> &lt;<font color="#A2734C">_start</font>+31&gt;:	<font color="#26A269">call   </font>*<font color="#12488B">0x2f33</font>(<font color="#C01C28">%rip</font>)<font color="#8B8A88">        # 0x555555557fd8</font>
+ (gdb) break *0x555555555098
Breakpoint 3 at <font color="#12488B">0x555555555098</font>
+ (gdb) x
   <font color="#12488B">0x5555555550a5</font> &lt;<font color="#A2734C">_start</font>+37&gt;:	<font color="#26A269">hlt</font>
   <font color="#12488B">0x5555555550a6</font>:	<font color="#26A269">cs nopw </font><font color="#12488B">0x0</font>(<font color="#C01C28">%rax</font>,<font color="#C01C28">%rax</font>,<font color="#12488B">1</font>)
   <font color="#12488B">0x5555555550b0</font> &lt;<font color="#A2734C">deregister_tm_clones</font>&gt;:	<font color="#26A269">lea    </font><font color="#12488B">0x2f59</font>(<font color="#C01C28">%rip</font>),<font color="#C01C28">%rdi</font><font color="#8B8A88">        # 0x555555558010 &lt;completed.0&gt;</font>
   <font color="#12488B">0x5555555550b7</font> &lt;<font color="#A2734C">deregister_tm_clones</font>+7&gt;:	<font color="#26A269">lea    </font><font color="#12488B">0x2f52</font>(<font color="#C01C28">%rip</font>),<font color="#C01C28">%rax</font><font color="#8B8A88">        # 0x555555558010 &lt;completed.0&gt;</font>
   <font color="#12488B">0x5555555550be</font> &lt;<font color="#A2734C">deregister_tm_clones</font>+14&gt;:	<font color="#26A269">cmp    </font><font color="#C01C28">%rdi</font>,<font color="#C01C28">%rax</font>
   <font color="#12488B">0x5555555550c1</font> &lt;<font color="#A2734C">deregister_tm_clones</font>+17&gt;:	<font color="#26A269">je     </font><font color="#12488B">0x5555555550d8</font> &lt;<font color="#A2734C">deregister_tm_clones</font>+40&gt;
   <font color="#12488B">0x5555555550c3</font> &lt;<font color="#A2734C">deregister_tm_clones</font>+19&gt;:	<font color="#26A269">mov    </font><font color="#12488B">0x2f16</font>(<font color="#C01C28">%rip</font>),<font color="#C01C28">%rax</font><font color="#8B8A88">        # 0x555555557fe0</font>
   <font color="#12488B">0x5555555550ca</font> &lt;<font color="#A2734C">deregister_tm_clones</font>+26&gt;:	<font color="#26A269">test   </font><font color="#C01C28">%rax</font>,<font color="#C01C28">%rax</font>
   <font color="#12488B">0x5555555550cd</font> &lt;<font color="#A2734C">deregister_tm_clones</font>+29&gt;:	<font color="#26A269">je     </font><font color="#12488B">0x5555555550d8</font> &lt;<font color="#A2734C">deregister_tm_clones</font>+40&gt;
   <font color="#12488B">0x5555555550cf</font> &lt;<font color="#A2734C">deregister_tm_clones</font>+31&gt;:	<font color="#26A269">jmp    </font>*<font color="#C01C28">%rax</font>
   <font color="#12488B">0x5555555550d1</font> &lt;<font color="#A2734C">deregister_tm_clones</font>+33&gt;:	<font color="#26A269">nopl   </font><font color="#12488B">0x0</font>(<font color="#C01C28">%rax</font>)
   <font color="#12488B">0x5555555550d8</font> &lt;<font color="#A2734C">deregister_tm_clones</font>+40&gt;:	<font color="#26A269">ret</font>
+ (gdb) c
The program is not being run.
+ (gdb) c
The program is not being run.
+ (gdb) run admin
Starting program: <font color="#26A269">/home/tyrell/Desktop/SLAE/Videos/Video03/GDB_Test/gdb_test</font> admin
[Thread debugging using libthread_db enabled]
Using host libthread_db library &quot;<font color="#26A269">/lib/x86_64-linux-gnu/libthread_db.so.1</font>&quot;.

Breakpoint 3, <font color="#12488B">0x0000555555555098</font> in <font color="#A2734C">_start</font> ()
+ (gdb) info registers 
rax            0x38                56
rbx            0x0                 0
rcx            0x0                 0
rdx            0x7fffffffe538      140737488348472
rsi            0x2                 2
rdi            0x7ffff7ffe2e0      140737354130144
rbp            0x0                 0x0
rsp            0x7fffffffe520      0x7fffffffe520
r8             0x0                 0
r9             0x7ffff7fca380      140737353917312
r10            0x7fffffffe130      140737488347440
r11            0x203               515
r12            0x555555555080      93824992235648
r13            0x7fffffffe530      140737488348464
r14            0x0                 0
r15            0x0                 0
rip            0x555555555098      0x555555555098 &lt;_start+24&gt;
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
+ (gdb) 
+ (gdb) disassemble main
Dump of assembler code for function <font color="#A2734C">main</font>:
   <font color="#12488B">0x0000555555555169</font> &lt;+0&gt;:	<font color="#26A269">endbr64</font>
   <font color="#12488B">0x000055555555516d</font> &lt;+4&gt;:	<font color="#26A269">push   </font><font color="#C01C28">%rbp</font>
   <font color="#12488B">0x000055555555516e</font> &lt;+5&gt;:	<font color="#26A269">mov    </font><font color="#C01C28">%rsp</font>,<font color="#C01C28">%rbp</font>
   <font color="#12488B">0x0000555555555171</font> &lt;+8&gt;:	<font color="#26A269">sub    </font><font color="#12488B">$0x20</font>,<font color="#C01C28">%rsp</font>
   <font color="#12488B">0x0000555555555175</font> &lt;+12&gt;:	<font color="#26A269">mov    </font><font color="#C01C28">%edi</font>,<font color="#12488B">-0x14</font>(<font color="#C01C28">%rbp</font>)
   <font color="#12488B">0x0000555555555178</font> &lt;+15&gt;:	<font color="#26A269">mov    </font><font color="#C01C28">%rsi</font>,<font color="#12488B">-0x20</font>(<font color="#C01C28">%rbp</font>)
   <font color="#12488B">0x000055555555517c</font> &lt;+19&gt;:	<font color="#26A269">lea    </font><font color="#12488B">0xe85</font>(<font color="#C01C28">%rip</font>),<font color="#C01C28">%rax</font><font color="#8B8A88">        # 0x555555556008</font>
   <font color="#12488B">0x0000555555555183</font> &lt;+26&gt;:	<font color="#26A269">mov    </font><font color="#C01C28">%rax</font>,<font color="#12488B">-0x8</font>(<font color="#C01C28">%rbp</font>)
   <font color="#12488B">0x0000555555555187</font> &lt;+30&gt;:	<font color="#26A269">mov    </font><font color="#12488B">-0x20</font>(<font color="#C01C28">%rbp</font>),<font color="#C01C28">%rax</font>
   <font color="#12488B">0x000055555555518b</font> &lt;+34&gt;:	<font color="#26A269">add    </font><font color="#12488B">$0x8</font>,<font color="#C01C28">%rax</font>
   <font color="#12488B">0x000055555555518f</font> &lt;+38&gt;:	<font color="#26A269">mov    </font>(<font color="#C01C28">%rax</font>),<font color="#C01C28">%rax</font>
   <font color="#12488B">0x0000555555555192</font> &lt;+41&gt;:	<font color="#26A269">mov    </font><font color="#12488B">-0x8</font>(<font color="#C01C28">%rbp</font>),<font color="#C01C28">%rdx</font>
   <font color="#12488B">0x0000555555555196</font> &lt;+45&gt;:	<font color="#26A269">mov    </font><font color="#C01C28">%rdx</font>,<font color="#C01C28">%rsi</font>
   <font color="#12488B">0x0000555555555199</font> &lt;+48&gt;:	<font color="#26A269">mov    </font><font color="#C01C28">%rax</font>,<font color="#C01C28">%rdi</font>
   <font color="#12488B">0x000055555555519c</font> &lt;+51&gt;:	<font color="#26A269">call   </font><font color="#12488B">0x555555555070</font> &lt;<font color="#A2734C">strcmp@plt</font>&gt;
   <font color="#12488B">0x00005555555551a1</font> &lt;+56&gt;:	<font color="#26A269">test   </font><font color="#C01C28">%eax</font>,<font color="#C01C28">%eax</font>
   <font color="#12488B">0x00005555555551a3</font> &lt;+58&gt;:	<font color="#26A269">jne    </font><font color="#12488B">0x5555555551b6</font> &lt;<font color="#A2734C">main</font>+77&gt;
   <font color="#12488B">0x00005555555551a5</font> &lt;+60&gt;:	<font color="#26A269">lea    </font><font color="#12488B">0xe74</font>(<font color="#C01C28">%rip</font>),<font color="#C01C28">%rax</font><font color="#8B8A88">        # 0x555555556020</font>
   <font color="#12488B">0x00005555555551ac</font> &lt;+67&gt;:	<font color="#26A269">mov    </font><font color="#C01C28">%rax</font>,<font color="#C01C28">%rdi</font>
   <font color="#12488B">0x00005555555551af</font> &lt;+70&gt;:	<font color="#26A269">call   </font><font color="#12488B">0x555555555060</font> &lt;<font color="#A2734C">puts@plt</font>&gt;
   <font color="#12488B">0x00005555555551b4</font> &lt;+75&gt;:	<font color="#26A269">jmp    </font><font color="#12488B">0x5555555551c5</font> &lt;<font color="#A2734C">main</font>+92&gt;
   <font color="#12488B">0x00005555555551b6</font> &lt;+77&gt;:	<font color="#26A269">lea    </font><font color="#12488B">0xeab</font>(<font color="#C01C28">%rip</font>),<font color="#C01C28">%rax</font><font color="#8B8A88">        # 0x555555556068</font>
   <font color="#12488B">0x00005555555551bd</font> &lt;+84&gt;:	<font color="#26A269">mov    </font><font color="#C01C28">%rax</font>,<font color="#C01C28">%rdi</font>
   <font color="#12488B">0x00005555555551c0</font> &lt;+87&gt;:	<font color="#26A269">call   </font><font color="#12488B">0x555555555060</font> &lt;<font color="#A2734C">puts@plt</font>&gt;
   <font color="#12488B">0x00005555555551c5</font> &lt;+92&gt;:	<font color="#26A269">mov    </font><font color="#12488B">$0x0</font>,<font color="#C01C28">%eax</font>
   <font color="#12488B">0x00005555555551ca</font> &lt;+97&gt;:	<font color="#26A269">leave</font>
   <font color="#12488B">0x00005555555551cb</font> &lt;+98&gt;:	<font color="#26A269">ret</font>
End of assembler dump.
+ (gdb) set disassembly-flavor intel 
+ (gdb) disassemble main
Dump of assembler code for function <font color="#A2734C">main</font>:
   <font color="#12488B">0x0000555555555169</font> &lt;+0&gt;:	<font color="#26A269">endbr64</font>
   <font color="#12488B">0x000055555555516d</font> &lt;+4&gt;:	<font color="#26A269">push   </font><font color="#C01C28">rbp</font>
   <font color="#12488B">0x000055555555516e</font> &lt;+5&gt;:	<font color="#26A269">mov    </font><font color="#C01C28">rbp</font>,<font color="#C01C28">rsp</font>
   <font color="#12488B">0x0000555555555171</font> &lt;+8&gt;:	<font color="#26A269">sub    </font><font color="#C01C28">rsp</font>,<font color="#12488B">0x20</font>
   <font color="#12488B">0x0000555555555175</font> &lt;+12&gt;:	<font color="#26A269">mov    </font>DWORD PTR [<font color="#C01C28">rbp</font><font color="#12488B">-0x14</font>],<font color="#C01C28">edi</font>
   <font color="#12488B">0x0000555555555178</font> &lt;+15&gt;:	<font color="#26A269">mov    </font>QWORD PTR [<font color="#C01C28">rbp</font><font color="#12488B">-0x20</font>],<font color="#C01C28">rsi</font>
   <font color="#12488B">0x000055555555517c</font> &lt;+19&gt;:	<font color="#26A269">lea    </font><font color="#C01C28">rax</font>,[<font color="#C01C28">rip</font>+<font color="#12488B">0xe85</font>]<font color="#8B8A88">        # 0x555555556008</font>
   <font color="#12488B">0x0000555555555183</font> &lt;+26&gt;:	<font color="#26A269">mov    </font>QWORD PTR [<font color="#C01C28">rbp</font><font color="#12488B">-0x8</font>],<font color="#C01C28">rax</font>
   <font color="#12488B">0x0000555555555187</font> &lt;+30&gt;:	<font color="#26A269">mov    </font><font color="#C01C28">rax</font>,QWORD PTR [<font color="#C01C28">rbp</font><font color="#12488B">-0x20</font>]
   <font color="#12488B">0x000055555555518b</font> &lt;+34&gt;:	<font color="#26A269">add    </font><font color="#C01C28">rax</font>,<font color="#12488B">0x8</font>
   <font color="#12488B">0x000055555555518f</font> &lt;+38&gt;:	<font color="#26A269">mov    </font><font color="#C01C28">rax</font>,QWORD PTR [<font color="#C01C28">rax</font>]
   <font color="#12488B">0x0000555555555192</font> &lt;+41&gt;:	<font color="#26A269">mov    </font><font color="#C01C28">rdx</font>,QWORD PTR [<font color="#C01C28">rbp</font><font color="#12488B">-0x8</font>]
   <font color="#12488B">0x0000555555555196</font> &lt;+45&gt;:	<font color="#26A269">mov    </font><font color="#C01C28">rsi</font>,<font color="#C01C28">rdx</font>
   <font color="#12488B">0x0000555555555199</font> &lt;+48&gt;:	<font color="#26A269">mov    </font><font color="#C01C28">rdi</font>,<font color="#C01C28">rax</font>
   <font color="#12488B">0x000055555555519c</font> &lt;+51&gt;:	<font color="#26A269">call   </font><font color="#12488B">0x555555555070</font> &lt;<font color="#A2734C">strcmp@plt</font>&gt;
   <font color="#12488B">0x00005555555551a1</font> &lt;+56&gt;:	<font color="#26A269">test   </font><font color="#C01C28">eax</font>,<font color="#C01C28">eax</font>
   <font color="#12488B">0x00005555555551a3</font> &lt;+58&gt;:	<font color="#26A269">jne    </font><font color="#12488B">0x5555555551b6</font> &lt;<font color="#A2734C">main</font>+77&gt;
   <font color="#12488B">0x00005555555551a5</font> &lt;+60&gt;:	<font color="#26A269">lea    </font><font color="#C01C28">rax</font>,[<font color="#C01C28">rip</font>+<font color="#12488B">0xe74</font>]<font color="#8B8A88">        # 0x555555556020</font>
   <font color="#12488B">0x00005555555551ac</font> &lt;+67&gt;:	<font color="#26A269">mov    </font><font color="#C01C28">rdi</font>,<font color="#C01C28">rax</font>
   <font color="#12488B">0x00005555555551af</font> &lt;+70&gt;:	<font color="#26A269">call   </font><font color="#12488B">0x555555555060</font> &lt;<font color="#A2734C">puts@plt</font>&gt;
   <font color="#12488B">0x00005555555551b4</font> &lt;+75&gt;:	<font color="#26A269">jmp    </font><font color="#12488B">0x5555555551c5</font> &lt;<font color="#A2734C">main</font>+92&gt;
   <font color="#12488B">0x00005555555551b6</font> &lt;+77&gt;:	<font color="#26A269">lea    </font><font color="#C01C28">rax</font>,[<font color="#C01C28">rip</font>+<font color="#12488B">0xeab</font>]<font color="#8B8A88">        # 0x555555556068</font>
   <font color="#12488B">0x00005555555551bd</font> &lt;+84&gt;:	<font color="#26A269">mov    </font><font color="#C01C28">rdi</font>,<font color="#C01C28">rax</font>
   <font color="#12488B">0x00005555555551c0</font> &lt;+87&gt;:	<font color="#26A269">call   </font><font color="#12488B">0x555555555060</font> &lt;<font color="#A2734C">puts@plt</font>&gt;
   <font color="#12488B">0x00005555555551c5</font> &lt;+92&gt;:	<font color="#26A269">mov    </font><font color="#C01C28">eax</font>,<font color="#12488B">0x0</font>
   <font color="#12488B">0x00005555555551ca</font> &lt;+97&gt;:	<font color="#26A269">leave</font>
   <font color="#12488B">0x00005555555551cb</font> &lt;+98&gt;:	<font color="#26A269">ret</font>
End of assembler dump.
+ (gdb) break *0x00005555555551bd
Breakpoint 4 at <font color="#12488B">0x5555555551bd</font>
+ (gdb) c
Continuing.

Breakpoint 1, <font color="#12488B">0x0000555555555169</font> in <font color="#A2734C">main</font> ()
+ (gdb) c
Continuing.

Breakpoint 2, <font color="#12488B">0x0000555555555196</font> in <font color="#A2734C">main</font> ()
+ (gdb) c
Continuing.

Breakpoint 4, <font color="#12488B">0x00005555555551bd</font> in <font color="#A2734C">main</font> ()
+ (gdb) x/s $rdi
<font color="#12488B">0x7fffffffe892</font>:	&quot;admin&quot;
+ (gdb) x/s $rax
<font color="#12488B">0x555555556068</font>:	&quot;\nIt&apos;s time to review those GDB videos again!&quot;
+ (gdb) set $rax = &quot;Love Yourself&quot;
+ (gdb) x/s $rax
<font color="#12488B">0x5555555592a0</font>:	&quot;Love Yourself&quot;
+ (gdb) c
Continuing.
Love Yourself
[Inferior 1 (process 43419) exited normally]
+ (gdb) 

</pre>

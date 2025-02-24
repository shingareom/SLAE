# What After
### **Computer Architecture Basics**
   - Modern CPU architectures (RISC, ARM, RISC-V)
   - Side-channel attacks (Spectre, Meltdown)
   - CPU Cache attacks and countermeasures
   - Hyper-threading and Simultaneous Multi-threading (SMT)

### **IA-32/64 Family**
   - Advanced concepts of **x86_64** and **ARM** architectures
   - Differences in **RISC** (ARM, RISC-V) vs **CISC** (x86) architectures
   - Hybrid architecture designs in modern processors

### **Compilers, Assemblers, and Linkers**
   - Compiler optimizations and mitigations (Stack canaries, PIE, Control Flow Integrity)
   - **Clang/LLVM** and advanced techniques in **static analysis** of compiled code
   - **Just-in-Time** compilation and its impact on exploitation

### **CPU Modes and Memory Addressing**
   - Modern **ASLR (Address Space Layout Randomization)** and techniques to bypass it
   - **SMEP (Supervisor Mode Execution Prevention)** and **KASLR (Kernel ASLR)** bypass
   - **Control Flow Guard (CFG)** and **ret2dir** attacks
   - **VxWorks** and embedded system memory addressing

### **Tools of the Trade**
   - **GDB** (advanced features: remote debugging, GDB scripting, and **ROP chains**)
   - **Radare2**: A comprehensive tool for reverse engineering
   - **Angr**: Symbolic execution tool for automated binary analysis
   - **Binwalk**: Extracting firmware and analyzing embedded systems
   - **Pwntools**: Python library for exploit development and scripting
   - **IDA Pro / Ghidra**: Advanced static analysis of binaries
   - **Frida**: Dynamic instrumentation for reverse engineering and bypassing protections

### **IA-32 Assembly Language**
   - **ARM Assembly**: Analyzing and exploiting ARM-based systems (mobile, IoT)
   - **RISC-V** assembly and vulnerability exploitation
   - Advanced **x86_64** assembly for exploit development

### **Registers and Flags**
   - Understanding **ARM-specific** registers and flags
   - Advanced manipulation of **x86_64** registers for ROP chains and shellcoding
   - **FPU** and its use in shellcode

### **Program Structure for use with nasm**
   - Understanding **modern executable formats** (PE, ELF, Mach-O)
   - Working with **Position-Independent Executables (PIE)**
   - Advanced linker flags and **dynamic linking**
   - **Static vs. Dynamic linking** and implications for exploit development

### **Data Types**
   - Deep dive into **floating-point vulnerabilities** (FPU instructions, FPU-based exploits)
   - Memory corruption vulnerabilities involving **pointer manipulation** and **data types**
   - **Union-based vulnerabilities** and memory structure padding

### **Data Movement Instructions**
   - Optimized **memcpy** and **memset** vulnerabilities
   - Advanced **MOV** instructions in **x86_64** for bypassing DEP/NX
   - Techniques for controlling **memory mapping** and buffer overflows

### **Arithmetic Instructions**
   - **Signed/unsigned overflow** in exploits
   - Using **SSE**, **SSE2**, and **AVX** for advanced shellcoding
   - Implementing **integer overflow** for bypassing security

### **Reading and Writing from Memory**
   - Techniques to bypass **stack protection** and **memory isolation**
   - Understanding **heap-overflow vulnerabilities** in modern systems

### **Conditional Instructions**
   - Exploiting **branch prediction vulnerabilities**
   - **Control-flow hijacking** (via **ROP**, **JOP**, and **data-only attacks**)

### **Strings and Loops**
   - **String-formatting vulnerabilities** (e.g., **printf** and **sprintf**)
   - Using loops and memory corruption techniques in shellcode
   - Buffer overflows and **off-by-one** errors

### **Interrupts, Traps, and Exceptions**
   - Exploiting **hardware exceptions** and **trap frames**
   - Advanced techniques for **triggering kernel-mode exceptions** for exploitation

### **Procedures, Prologues, and Epilogues**
   - ROP-based exploitation (return-oriented programming)
   - Handling **function prologues/epilogues** in bypassing function return addresses
   - **Syscall** redirection and manipulation via ROP chains

### **Syscall Structure and ABI for Linux**
   - Deep dive into **Linux syscall interface** and **syscall table manipulation**
   - Bypassing **Syscall Filtering** (e.g., seccomp, SELinux)
   - **Syscall hooking** and **Syscall polymorphism**

### **Calling Standard Library Functions**
   - Exploiting **unsafe standard library calls** in vulnerable applications
   - Understanding **glibc** vulnerabilities and exploitability
   - **Function hooking** techniques and bypassing libraries

### **FPU Instructions**
   - **FPU overflow** and its exploitation
   - **Floating-point exceptions** and using them in shellcode execution
   - Exploiting **SSE/SSE2** registers for modern shellcoding techniques

### **MMX, SSE, SSE2, AVX, etc. Instruction Sets**
   - Leveraging **AVX** instructions for shellcoding in modern CPUs
   - **SIMD (Single Instruction, Multiple Data)** exploitation techniques for bypassing security mechanisms

### **Shellcoding on Linux**
   - **Advanced shellcoding**: multi-platform shellcode (Linux, Windows, macOS)
   - **Staged Shellcode**: Break large shellcodes into smaller parts for evasion
   - **Egg Hunter**: Create shellcode that searches for a “larger” payload in memory

### **Execution Environment**
   - Understanding and evading **virtual machines**, **containers**, and **hypervisors**
   - **Cloud exploitation** (AWS, Azure, Google Cloud) and virtualization security
   - Techniques for bypassing **Hypervisor-based protections**

### **Exit and Execve Shellcode**
   - Mastering the use of **Execve** and **exit** system calls in shellcode for creating more flexible exploits
   - Advanced shellcode to bypass **AppArmor** and **SELinux**

### **Bind Shell and Reverse TCP**
   - Develop **reverse shell** and **bind shell** exploits in modern Linux environments
   - Exploit **SOCKS proxies**, **HTTP tunneling**, and **DNS tunneling** for covert communications

### **Staged Shellcode**
   - **Multistage exploits**: Loading initial payload and transitioning to the final exploit (advanced examples)

### **Egg Hunter**
   - Use the **Egg Hunter** technique to locate shellcode in memory across large address spaces or fragmented buffers

### **Using 3rd Party Shellcode**
   - Integrating **publicly available shellcode** from exploit databases like **Exploit-DB** or **Packet Storm** into your custom exploits
   - Analyzing and modifying 3rd party shellcode for better stealth and efficacy

### **Simulating Shellcode**
   - Using **QEMU** for simulating shellcode execution on various CPU architectures
   - **Shellcode graphing**: Visualizing shellcode execution flow using tools like **Pin**, **DynamoRIO**

### **Locating Syscalls**
   - **Syscall redirection** techniques for bypassing syscall-based security mechanisms (SELinux, seccomp)
   - Dynamic syscall location using **libc** functions or **runtime discovery**

### **Graphing Shellcode Execution**
   - Use advanced tools like **Ghidra**, **Angr**, and **Radare2** to graph shellcode execution flows and identify bottlenecks or weaknesses

### **Encoders, Decoders, and Crypters on Linux**
   - Advanced **polymorphic encoders**: Learn how to generate polymorphic shellcode that changes every time it is executed
   - **Crypters**: Study the creation of custom crypters for evading antivirus and static detection methods
   - **Code obfuscation** techniques and tools to bypass static analysis

### **Purpose of Encoding and Crypting**
   - **Evasion tactics**: Use encoding to evade detection by modern IDS/IPS and antivirus systems
   - **Custom encoding** strategies and randomization for shellcode

### **XOR Encoders**
   - Build and optimize **XOR-based** encoders for shellcode encryption and decryption
   - Create **multi-layered encoders** that employ randomization and **nested XOR** operations

### **Custom Encoding**
   - Develop custom encoding techniques to bypass detection and static analysis by modern security tools
   - Create **self-decrypting shellcode** for stealthier execution

### **Random Sequencing and Scrambling**
   - **Randomization** in exploit code to evade detection by heuristic scanners and emulators
   - **Obfuscation of control flow** to confuse both human analysts and automated analysis tools

### **Mapping Functions**
   - Mapping the execution flow of shellcode with **control flow graphs (CFG)**
   - Analyzing complex shellcode behavior through **taint analysis** and **data flow analysis**

### **Crypters**
   - Implement modern **polymorphic crypters** that automatically mutate shellcode for **dynamic evasion** and stealth

### **Polymorphism**
   - Understand **polymorphic engines** and their role in creating **undetectable** exploits
   - Apply **polymorphism** to shellcode and payloads to prevent detection by static antivirus engines

### **Why Polymorphism?**
   - **Detection avoidance**: Polymorphic techniques help avoid detection by security scanners and modern **signature-based** defenses
   - **Dealing with anti-virus** and **sandboxing techniques** via polymorphic payloads

### **Polymorphic Engines**
   - Learn how to build **polymorphic engines** that automatically mutate shellcode for **dynamic evasion** and stealth

### **Techniques and Tools**
   - **Advanced obfuscation and anti-analysis** techniques (e.g., anti-debugging, anti-VM tricks)
   - Using **Frida**, **Dyninst**, and **Unicorn** for dynamic analysis and manipulation of binaries
   - **Static analysis** using **Binwalk**, **Radare2**, and **IDA Pro**
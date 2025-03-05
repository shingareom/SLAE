#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <sys/mman.h>

// Shellcode from clipboard
unsigned char shellcode[] = "\xb8\x3c\x00\x00\x00\xbf\x0b\x00\x00\x00\x0f\x05";

int main() {
    void *exec_mem = mmap(NULL, sizeof(shellcode), PROT_READ | PROT_WRITE | PROT_EXEC, 
                          MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
    if (exec_mem == MAP_FAILED) {
        perror("mmap");
        exit(1);
    }

    memcpy(exec_mem, shellcode, sizeof(shellcode));
    void (*func)() = (void (*)())exec_mem;
    func();

    return 0;
}

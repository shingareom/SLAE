#include <stdio.h>
#include <string.h>
#include <sys/mman.h>
#include <stdlib.h>
#include <unistd.h>

unsigned char code[] = \
"\xeb\x10\x5e\xb0\x01\x40\x88\xc7\xb2\x27\x0f\x05\xb0\x3c\x31\xff\x0f\x05\xe8\xeb\xff\xff\xff\x48\x65\x6c\x6c\x6f\x20\x57\x6f\x72\x6c\x64\x20\x74\x6f\x20\x74\x68\x69\x73\x20\x63\x6f\x75\x72\x73\x65\x20\x61\x6e\x64\x20\x74\x68\x69\x73\x20\x72\x65\x70\x6f";

int main() {
    printf("Shellcode Length: %ld\n", sizeof(code) - 1);

    // Allocate RWX memory
    void *exec_mem = mmap(0, sizeof(code), PROT_READ | PROT_WRITE | PROT_EXEC,
                          MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
    if (exec_mem == MAP_FAILED) {
        perror("mmap failed");
        return 1;
    }

    // Copy shellcode into allocated memory
    memcpy(exec_mem, code, sizeof(code));

    // Execute shellcode
    ((void(*)())exec_mem)();

    // Cleanup (optional)
    munmap(exec_mem, sizeof(code));
    
    return 0;
}


#include <stdio.h>
#include <string.h>
#include <sys/mman.h>

unsigned char shellcode[] =
    "\xeb\x09\x48\x65\x6c\x6c\x6f\x20\x4f\x6d\x0a\x48\x31\xc0\x48\x83\xc0\x01"
    "\x48\x89\xc7\x48\x8d\x35\xe6\xff\xff\xff"
    "\x48\x31\xd2\x48\x83\xc2\x09\x0f\x05\x48\x31\xc0\x48\x83\xc0\x3c\x48\x31"
    "\xff\x0f\x05";

int main() {
  printf("Shellcode Length: %zu bytes\n", sizeof(shellcode) - 1);

  // Allocate executable memory
  void *exec_mem =
      mmap(NULL, sizeof(shellcode), PROT_READ | PROT_WRITE | PROT_EXEC,
           MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);

  if (exec_mem == MAP_FAILED) {
    perror("mmap");
    return 1;
  }

  memcpy(exec_mem, shellcode,
         sizeof(shellcode)); // Copy shellcode to allocated memory

  // Execute shellcode
  ((void (*)())exec_mem)();

  return 0;
}

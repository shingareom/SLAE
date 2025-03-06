
#include <stdio.h>
#include <string.h>
#include <sys/mman.h>

unsigned char shellcode[] =
    "\x48\x31\xc0\x50\x68\x6c\x64\x21\x0a\x68\x20\x57\x6f\x72\x68\x48\x65\x6c"
    "\x6c\x48\x89\xe6\xba\x0d\x00\x00\x00\xb8"
    "\x01\x00\x00\x00\xbf\x01\x00\x00\x00\x0f\x05\xb8\x3c\x00\x00\x00\x48\x31"
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

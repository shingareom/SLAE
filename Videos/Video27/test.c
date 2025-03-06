#include <stdio.h>
#include <string.h>

unsigned char shellcode[] = "\x48\x31\xc0\x50\x68\x21\x64\x6c\x72"
                            "\x68\x6f\x57\x20\x6f\x68\x6c\x6c\x65"
                            "\x48\x48\x89\xe6\x48\xc7\xc0\x01\x00"
                            "\x00\x00\x48\xc7\xc7\x01\x00\x00\x00"
                            "\x48\xc7\xc2\x0c\x00\x00\x00\x0f\x05"
                            "\x48\xc7\xc0\x3c\x00\x00\x00\x48\x31"
                            "\xff\x0f\x05";

int main() {
  printf("Shellcode Length: %zu bytes\n", sizeof(shellcode) - 1);

  void (*run)() = (void (*)())shellcode; // Cast shellcode to function pointer
  run();                                 // Execute shellcode

  return 0;
}

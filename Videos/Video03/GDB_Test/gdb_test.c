#include<stdio.h>
#include<string.h>


main(int argc, char **argv)
{
	char *p ="PentesterAcademyPass";


	if (strcmp(argv[1], p) == 0)
	{
		printf("\nWelcome to the SLAE 64-bit course! Please proceed to the next video!\n");

	}
	else 
	{
		printf("\nIt's time to review those GDB videos again!\n");
	}

	return 0;

}


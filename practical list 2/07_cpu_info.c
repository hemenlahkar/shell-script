#include <stdio.h>
#include <sys/utsname.h>
#include <stdlib.h>
#include <string.h>

/* Write a program to report behavior of Linux Kernel including
 * Kernel version, CPU type and mode. (CPU Information)
*/


int main()
{
	struct utsname u;

	if (uname(&u) == -1)
	{
		perror("uname");
		return 1;
	}

	printf("==== Kernel Information ====\n");
	printf("----------------------------\n");
	printf("System Name   : %s\n", u.sysname);
	printf("Node Name     : %s\n", u.nodename);
	printf("Kernel Release: %s\n", u.release);
	printf("Kernel Version: %s\n", u.version);
	printf("Machine Type  : %s\n", u.machine);

	printf("\n==== CPU Information ====\n");
	printf("--------------------------\n");

	FILE *fp = fopen("/proc/cpuinfo", "r");

	if(fp == NULL)
	{
		perror("fopen");
		return 1;
	}

	char line[256];

	while (fgets(line, sizeof(line), fp))
	{
		if(strncmp(line, "vendor_id", 9) == 0 ||
		   strncmp(line, "model name", 10) == 0 ||
		   strncmp(line, "cpu cores", 9) == 0)
		{
			printf("%s", line);
		}
	}

	fclose(fp);
	
	return 0;
}

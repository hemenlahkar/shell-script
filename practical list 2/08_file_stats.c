#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <time.h>

/* Write a program to print file details including owner access permissions,
 * file access time, where file name is given as argument.
*/

int main(int argc, char *argv[])
{
	struct stat fileStat;

	if (argc != 2)
	{
		printf("Usage: %s <filename>\n", argv[0]);
		return 1;
	}

	if (stat(argv[1], &fileStat) < 0)
	{
		perror("stat");
		return 1;
	}

	printf("File Name: %s\n", argv[1]);

	printf("\nOwner Permissions:\n");
	printf("Read   : %s\n", (fileStat.st_mode & S_IRUSR) ? "Yes" : "No");
	printf("Write  : %s\n", (fileStat.st_mode & S_IWUSR) ? "Yes" : "No");
	printf("Execute: %s\n", (fileStat.st_mode & S_IXUSR) ? "Yes" : "No");

	printf("\nLast Access Time:\n");
	printf("%s", ctime(&fileStat.st_atime));

	return 0;
}

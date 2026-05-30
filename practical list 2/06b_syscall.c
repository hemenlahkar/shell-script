#include <stdio.h>
#include <unistd.h>

int main()
{
	pid_t pid;

	pid = fork();

	if(pid == 0)
	{
		printf("Child Process\n");
		printf("Child PID: %d\n", getpid());
	}
	else if (pid > 0)
	{
		printf("Parent Process\n");
		printf("Parent PID: %d\n", getpid());
	}
	else
	{
		printf("Failed to create child process!!\n");
	}
	return 0;
}

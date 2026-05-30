#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>

int main()
{
	pid_t pid;

	pid = fork();

	if(pid == 0)
	{
		printf("Child Process executing...\n");
		sleep(3);
		printf("Child process finished.\n");
	}
	else if (pid > 0)
	{
		wait(NULL);
		printf("Parent resumes after child finishes.\n");
	}
	else
	{
		printf("Failed to create child process!!\n");
	}
	
	return 0;
}

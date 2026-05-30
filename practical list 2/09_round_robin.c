#include <stdio.h>

/* Write a program to implement Round Robin scheduling algorithm */

#define MAX 20

int main()
{
	int n, i, qt;
	int bt[MAX], at[MAX], rem_bt[MAX], wt[MAX], tat[MAX];
	int time = 0, done = 0;
	float avg_wt = 0, avg_tat = 0;

	printf("Enter number of processes: ");
	scanf("%d", &n);

	printf("Enter Arrival Time and Burst Time for each process:\n");
	for (i = 0; i < n; i++)
	{
		printf("Process %d: Arrival Time: ", i + 1);
		scanf("%d", &at[i]);
		printf("             Burst Time: ");
		scanf("%d", &bt[i]);
		rem_bt[i] = bt[i];
	}

	printf("Enter Time Quantum: ");
	scanf("%d", &qt);

	int queue[MAX];
	int front = 0, rear = 0;
	int visited[MAX] = {0};

	int gantt[MAX * 10], g_time[MAX * 10 + 1];
	int g_index = 0;

	time = 0;
	done = 0;
	int current = -1;

	for (i = 0; i < n; i++)
	{
		if (at[i] <= time && !visited[i])
		{
			queue[rear] = i;
			rear = (rear + 1) % MAX;
			visited[i] = 1;
		}
	}

	g_time[0] = 0;

	while (done < n)
	{
		if (front == rear)
		{
			time++;
			g_time[0] = time;

			for (i = 0; i < n; i++)
			{
				if (at[i] <= time && visited[i])
				{
					queue[rear] = i;
					rear = (rear + 1) % MAX;
					visited[i] = 1;
				}
			}
			continue;
		}

		current = queue[front];
		front = (front + 1) % MAX;

		gantt[g_index] = current;
		g_time[g_index + 1] = g_time[g_index];

		if (rem_bt[current] > qt)
		{
			rem_bt[current] -= qt;
			time += qt;
			g_time[++g_index] = time;
		}
		else
		{
			time += rem_bt[current];
			rem_bt[current] = 0;
			done++;
			g_time[++g_index] = time;

			tat[current] = time - at[current];
			wt[current] = tat[current] - bt[current];
			avg_wt += wt[current];
			avg_tat += tat[current];
		}

		for (i = 0; i < n; i++)
		{
			if (at[i] <= time && !visited[i])
			{
				queue[rear] = i;
				rear = (rear + 1) % MAX;
				visited[i] = 1;
			}
		}

		if (rem_bt[current] > 0)
		{
			queue[rear] = current;
			rear = (rear + 1) % MAX;
		}
	}

	printf("\nGantt Chart:\n");
	for(i = 0; i < g_index; i++)
	{
		printf("   P%d ", gantt[i] + 1);
	}
	putchar('\n');
	for(i = 0; i <= g_index; i++)
	{
		printf("%2d", g_time[i]);
		if(i < g_index)
			printf("    ");
	}

	printf("\n\nProcess\tArrival\tBurst\tWaiting\tTurnaround\n");
	for(i = 0; i < n; i++)
		printf("P%d\t%d\t%d\t%d\t%d\n", i + 1, at[i], bt[i], wt[i], tat[i]);

	avg_wt /= n;
	avg_tat /= n;
	printf("\nAverage Waiting Time = %.2f", avg_wt);
	printf("\nAverage Turnaround Time = %.2f\n", avg_tat);

	return 0;
}

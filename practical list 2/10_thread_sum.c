#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

/* Write a program to calculate sum of n numbers using thread library */

typedef struct {
	int *arr;
	int start;
	int end;
	int thread_id;
} thread_data_t;

long long *partial_sums;

void *partial_sum(void *arg)
{
	thread_data_t *data = (thread_data_t *)arg;
	long long sum = 0;

	for (int i = data->start; i < data->end; i++)
		sum += data->arr[i];
	partial_sums[data->thread_id] = sum;
	pthread_exit(NULL);
}

int main()
{
	int n, num_threads;

	printf("Enter total number of elements: ");
	scanf("%d", &n);

	int *arr = (int *)malloc(n * sizeof(int));
	if (arr == NULL)
	{
		perror("malloc");
		exit(EXIT_FAILURE);
	}

	printf("Enter %d numbers:\n", n);
	for(int i = 0; i < n; i++)
		scanf("%d", &arr[i]);
	
	printf("Enter number of threads: ");
	scanf("%d", &num_threads);

	if (num_threads <= 0 || num_threads > n)
	{
		printf("Invalid number of threads. Setting to %d\n", n);
		num_threads = n;
	}

	partial_sums = (long long *)calloc(num_threads, sizeof(long long));
	pthread_t *threads = (pthread_t *)malloc(num_threads * sizeof(pthread_t));
	thread_data_t *thread_data = (thread_data_t *)malloc(num_threads * sizeof(thread_data_t));

	int chunk_size = n / num_threads;
	int remainder = n % num_threads;
	int start = 0;

	for (int t = 0; t < num_threads; t++)
	{
		int elements = chunk_size + (t < remainder ? 1 : 0 );
		thread_data[t].arr = arr;
		thread_data[t].start = start;
		thread_data[t].end = start + elements;
		thread_data[t].thread_id = t;

		pthread_create(&threads[t], NULL, partial_sum, (void*)&thread_data[t]);
		start += elements;
	}

	for (int t = 0; t < num_threads; t++)
		pthread_join(threads[t], NULL);

	long long total_sum = 0;
	for (int t = 0; t < num_threads; t++)
		total_sum += partial_sums[t];

	printf("\nSum of %d numbers = %lld\n", n, total_sum);

	free(arr);
	free(partial_sums);
	free(threads);
	free(thread_data);

	return 0;
}

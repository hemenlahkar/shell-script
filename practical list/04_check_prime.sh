#!/bin/bash
# Check if the number entered is prime or not

read -p "Enter the number: " n

prime=1

if [[ $n -le 1 ]]; then
	prime=0
elif [[ $n -eq 2 ]]; then
	prime=1
elif (( n % 2 == 0 )); then
	prime=0
else
	x=3

	while [[ $(($x * $x)) -le n ]]
	do
		if (( n % x == 0 )); then
			prime=0
			break
		fi

		((x += 2))
	done
fi

if (( prime == 0 )); then
	echo "$n is NOT a Prime number!"
else
	echo "$n is a Prime number."
fi

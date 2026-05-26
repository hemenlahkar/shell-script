#!/bin/sh
# Find the sum of digits of a given number

printf "Enter the number: "
read n

x=0
until [ $n == 0 ]; do
	x=$(( x + n%10 ))
	n=$((n / 10))
done

echo "Sum of digits of the given number is: $x"

#!/bin/sh
# Find the factorial of a given number

printf "Enter the number: "
read n

if [ $n -lt 0 ]; then
	echo "Cannot calculate factorial of negative numbers"
	exit 1
fi

fact=1
x=2
while [ $x -le $n ]; do
	fact=$(( x * fact ))
	x=$(( x + 1 ))
done

echo "$n! = $fact"

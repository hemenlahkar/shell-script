#!/bin/sh
# Find the power of a given number

printf "Enter the number: "
read x
printf "Enter the power: "
read y

if [ $y -lt 0 ]; then
	echo "Please enter a positive power!"
	exit 1
fi

result=1
temp=$y
until [ $y == 0 ]; do
	result=$(( result * x ))
	y=$(( y - 1 ))
done

echo "$x raised to power of $temp is: $result"

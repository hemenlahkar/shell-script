#!/bin/sh
# Display the multiplication table of any number

printf "Enter the number: "
read n

x=1
while [ $x -le 10 ]
do
	echo "$n x $x = $((n*x))"
	x=$((x+1))
done


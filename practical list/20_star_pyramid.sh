#!/bin/sh
# Show the pyramid of special character '*'

printf "Enter the number of lines: "
read n

x=1
while [ $x -le $n ]; do
	j=1
	while [ $j -le $(( n - x )) ]; do
		printf " "
		j=$(( j + 1 ))
	done

	k=1
	while [ $k -le $(( 2 * x - 1 )) ]; do
		printf "*"
		k=$(( k + 1 ))
	done

	printf "\n"

	x=$(( x + 1 ))
done

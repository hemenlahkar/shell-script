#!/bin/sh
# Find the LCM of two numbers

printf "Enter the first number: "
read a
printf "Enter the second number: "
read b

if [ $a -gt $b ]; then
	temp=$a
	a=$b
	b=$temp
fi

x=$b
while [ $x -le $(( a * b )) ]; do
	if [ $(( x % a )) -eq 0 ]; then
		lcm=$x
		break
	fi
	x=$(( x + b ))
done

echo "LCM($a, $b) = $lcm"

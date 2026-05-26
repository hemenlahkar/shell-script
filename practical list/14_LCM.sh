#!/bin/sh
# Find the LCM & HCF of two numbers

printf "Enter the first number: "
read a
printf "Enter the second number: "
read b

if [ $a -gt $b ]; then
	temp=$a
	a=$b
	b=$temp
fi

x=$a
y=$b
while [ $y -ne 0 ]; do
	temp=$y
	y=$(( x % y))
	x=$temp
done
hcf=$x
lcm=$(( a * b / hcf ))

echo "LCM($a, $b) = $lcm"
echo "HCF($a, $b) = $hcf"

#!/bin/sh
# Modify "cal" command to display calendars of the specified range of months

read -p "Enter lower limit of the range(1-12): " lower
read -p "Enter upper limit of the range(1-12): " upper

if [ $lower -gt $upper ]; then
	temp=$lower
	lower=$upper
	upper=$temp
fi

if [ $lower -lt 1 || $upper -gt 12 ]; then
	echo "Invalid range entered!!"
	exit 1
fi
year=$(date +%Y)
x=$lower
while [ $x -le $upper ]
do
	cal $x $year
	x=$((x + 1))
done

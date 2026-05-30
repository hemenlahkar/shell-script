#!/bin/sh
# Find the largest integer among the three integers given as arguments

if [ $# -ne 3 ]; then
	echo "Usage: $0 <num1> <num2> <num3>"
	exit 1
fi

for arg in "$1" "$2" "$3"; do
	case "$arg" in
		''|*[!0-9-]*|-|*-*)
			echo "Error: '$arg' is not a valid integer" >&2
			exit 1
	esac
done

if [ $1 -gt $2 ] && [ $1 -gt $3 ]; then
	largest=$1
elif [ $2 -gt $3 ]; then
	largest=$2
else
	largest=$3
fi

echo "Largest number is: $largest"

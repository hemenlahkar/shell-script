#!/bin/sh
# Perform the tasks of a basic calculator

while true; do
	printf "Enter first number (or 'q' to quit): "
	read a
	[ "$a" = "q" ] && break
	printf "Enter second number: "
	read b
	printf "Enter operation(+,-,*,/): "
	read op

	case $op in
		"+") echo "$a + $b = $((a + b))";;
		"-") echo "$a - $b = $((a - b))";;
		"*") echo "$a * $b = $((a * b))";;
		"/") [ "$b" -eq 0 ] && echo "Error: division by zero" >&2 || echo "$a / $b = $((a / b))";;
		*) echo "Invalid operator" >&2;;
	esac
done

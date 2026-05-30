#!/bin/sh
# Display the processes running on the system for every 30 seconds, but only for 3 times

n=1
while [ $n -le 3 ]; do
	clear
	ps -ejH
	n=$((n+1))
	sleep 30
done

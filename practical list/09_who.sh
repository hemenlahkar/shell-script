#!/bin/sh
# Display on the screen sorted output of "who" command along wih the total number of users

who | sort

total=$(who | wc -l)
echo "Total number of users: $total"

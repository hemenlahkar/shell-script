#!/bin/bash
# Modify "cal" command to display calendars of the specified months

year=$(date +%Y)
until [[ $m == "q" ]]
do
	read -p "Enter the month number (1-12): " m
	if [[ $m -le 12 && $m -ge 1 ]]; then
		cal $m $year
	fi
done

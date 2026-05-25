#!/bin/sh
# accept a login name and check if it's valid or not

printf "Enter a login name: " 
read name

if id "$name" >/dev/null 2>&1; then
	echo "User '$name' exists."
else
	echo "User '$name' does not exist."
fi


#!/bin/sh
# Check whether the file have all the permissions or not

if [ $# -ne 1 ]; then
	echo "Usage: $0 file" >&2
	exit 1
fi

file=$1

if [ ! -e $file ]; then
	echo "Error: '$file' does not exist." >&2
	exit 1
fi

if [ -r $file ] && [ -w $file ] && [ -x $file ]; then
	echo "File '$file' has read, write, and execute permissions for the current user."
else
	echo "File '$file' does NOT have all permissions (rwx) for the current user."
fi

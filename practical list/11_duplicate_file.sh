#!/bin/sh
# Compare two files and if found equal asks the user to delete the duplicate file.

if [ $# -ne 2 ]; then
	echo "Usage: $0 file1 file2" >&2
	exit 1
fi

file1="$1"
file2="$2"

if [ ! -f "$file1" ] || [ ! -f "$file2" ]; then
	echo "Error: Both arguments must be existing files." >&2
	exit 1
fi

if cmp -s "$file1" "$file2"; then
	echo "Files are identical."
	printf "Do you want to delete the duplicate file (%s)? (y/n): " "$file2"
	read answer
	case "$answer" in
		[Yy]*) rm "$file2" && echo "Deleted $file2.";;
		*) echo "No files deleted.";;
	esac
else
	echo "Files differ."
fi

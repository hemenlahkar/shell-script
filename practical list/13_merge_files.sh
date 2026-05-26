#!/bin/sh
# Merge the contents of three files, sort and then display them page by page

if [ $# -ne 3 ]; then
	echo "Usage: $0 file1 file2 file3" >&2
	exit 1
fi

for f in "$1" "$2" "$3"; do
	if [ ! -f "$f" ] || [ ! -r "$f" ]; then
		echo "Error: '$f' is not a readable regular file." >&2
		exit 1
	fi
done

cat -- "$1" "$2" "$3" | sort | more

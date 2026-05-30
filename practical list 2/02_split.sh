#!/bin/sh
# Split a file containing 100 lines into 25 lines each

printf "Enter the file name: "
read filename

split "$filename" -l 25 file_

n=1

for f in file_*
do
	mv "$f" "file$n.txt"
	n=$((n+1))
done

echo "File split was successful"

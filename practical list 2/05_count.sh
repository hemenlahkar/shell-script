#!/bin/sh
# Count the following in a text file:
# 	* Number of vowels
# 	* Number of blank spaces
# 	* Number of characters
# 	* Number of symbols
# 	* Number of lines

printf "Enter the file: "
read file

if [ ! -f "$file" ]; then
	echo "File doesn't exists"
	exit 1
fi

vowels=$(tr -cd 'AEIOUaeiou' < "$file" | wc -c)

spaces=$(tr -cd ' ' < "$file" | wc -c)

chars=$(wc -m < "$file")

symbols=$(tr -cd '[:punct:]' < "$file" | wc -c)

lines=$(wc -l < "$file")

echo "Number of vowels    : $vowels"
echo "Number of spaces    : $spaces"
echo "Number of characters: $chars"
echo "Number of symbols   : $symbols"
echo "Number of lines     : $lines"

#!/bin/sh
# Read the contents in a text file and remove all the blank spaces
# in them and redirect the output to a file.

printf "Enter input file: "
read input_file

printf "Enter output file: "
read output_file

tr -d ' ' < "$input_file" > "$output_file"

echo "Output written to $output_file" 

#!/bin/bash

# Prompt user for input file name
echo "Enter the input file name: "
read INPUT_FILE

# Output file
OUTPUT_FILE=unique_lines.txt

# Check if input file exists
if [ ! -f "$INPUT_FILE" ]; then
  echo "Error: Input file not found!"
  exit 1
fi

# Use sort and uniq to remove duplicate lines
sort "$INPUT_FILE" | uniq > "$OUTPUT_FILE"

# Print a message
echo "Duplicate lines removed. Unique lines written to $OUTPUT_FILE"
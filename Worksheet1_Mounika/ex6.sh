#!/bin/bash

# Prompt the user to enter the directory to search
echo "Please enter the directory to search for empty subfolders:"
read directory

# Output file to store the names of empty subfolders
output_file="empty_subfolders.txt"

# Check if the directory exists
if [ -d "$directory" ]; then
    # Find all subfolders that are empty and write them to the output file
    find "$directory" -type d -empty > "$output_file"

    # Check if the output file has any results
    if [ -s "$output_file" ]; then
        echo "Empty subfolders are listed in $output_file."
    else
        echo "No empty subfolders found in $directory."
        # Optionally, remove the empty output file
        rm "$output_file"
    fi
else
    echo "The directory $directory does not exist."
fi

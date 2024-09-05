#!/bin/bash
#to list all executable files available in system 
# Iterate over each file and directory in the root directory
for file in /*; do
  # Check if the file is executable
  if [ -x "$file" ]; then
    # Print the executable file path
    echo "$file"
  fi
  
  # Check if the file is a directory
  if [ -d "$file" ]; then
    # Iterate over each file and subdirectory in the current directory
    for subfile in "$file"/*; do
      # Check if the subfile is executable
      if [ -x "$subfile" ]; then
        # Print the executable subfile path
        echo "$subfile"
      fi
    done
  fi
done
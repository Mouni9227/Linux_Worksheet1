#!/bin/bash

#!/bin/bash

# Get a list of all .fasta files in the current directory
file_list=$(ls *.fasta)

# Define an array of motifs that we want to search for in the files
motifs=("YVDRHPDDTINDYLNSI" "MGNHTWDHPDIFEILTTK")

# Enable debugging mode (set -x) - it's commented out, but if enabled, it shows each command as it's executed
#set -x

# Loop through each .fasta file in the list
for file in $file_list; do
  # Output which file is currently being processed
  echo "Processing $file"
  
  # Check if the file exists and is a regular file
  if [ -f "$file" ]; then
    # Extract the sequence from the .fasta file by removing lines that start with ">" (headers)
    sequence=$(grep -v ">" "$file")

    # Loop through each motif in the motifs array
    for motif in "${motifs[@]}"; do
      # Search for the motif in the sequence, returning the byte offset and matched text (-b gives the offset, -o gives only the matched text)
      pos=$(echo "$sequence" | grep -b -o "$motif")
      
      # Check if the motif was found (if 'pos' is non-empty)
      if [ -n "$pos" ]; then
        # If found, output the motif and its position in the file
        echo "$motif found in $file at $pos"
      else
        # If not found, output that the motif was not found
        echo "$motif not found in $file"
      fi
    done
  else
    # If the file is not a regular file (or doesn't exist), output a warning
    echo "$file is not a file"
  fi
done

# Disable debugging mode (set +x) - it's commented out, but if used, it disables command tracing
#set +x

#!/bin/bash

# Get the total size of the root directory (in KB)
root_total=$(df / | awk 'NR==2 {print $2}')

# Get the used size of the $HOME directory (in KB)
home_used=$(du -s "$HOME" | awk '{print $1}')

# Calculate the usage percentage (integer approximation)
usage_percent=$(( 100 * home_used / root_total ))

# Display the percentage of $HOME usage relative to the root directory
echo "The $HOME directory is using approximately $usage_percent% of the root directory's total space."

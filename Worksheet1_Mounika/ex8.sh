#!/bin/bash

# Set the threshold value
threshold=90

# Loop through numbers 1 to 100
for ((i=1; i<=100; i++)); do
    # Print the current number
    echo "Number: $i"
    
    # Check if the number is greater than the threshold
    if [ $i -gt $threshold ]; then
        echo "This number is greater than the threshold ($threshold)."
    fi
done
#!/bin/bash

# Set the threshold for disk usage (e.g., 70%)
threshold=70

# Get the disk usage percentage of the partition where $HOME is located
# df -h returns the disk usage in human-readable format
# awk filters the percentage value of the partition where $HOME is located
usage=$(df "$HOME" | awk 'NR==2 {print $5}' | sed 's/%//')

# Check if disk usage exceeds the threshold
if [ "$usage" -ge "$threshold" ]; then
  echo "Alert: Disk usage for the partition where \$HOME is located is at ${usage}% (Threshold: ${threshold}%)"
else
  echo "Disk usage for the partition where \$HOME is located is at ${usage}%. All good!"
fi

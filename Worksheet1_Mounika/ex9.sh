#!/bin/bash
 # Get the current hour using date command
CURRENT_HOUR=$(date +%H)

# Determine the greeting based on the current hour
if [ $CURRENT_HOUR -ge 05 ] && [ $CURRENT_HOUR -lt 12 ]; then
  echo "Good morning!"
elif [ $CURRENT_HOUR -ge 12 ] && [ $CURRENT_HOUR -lt 18 ]; then
  echo "Good afternoon!"
else
  echo "Good night!"
fi
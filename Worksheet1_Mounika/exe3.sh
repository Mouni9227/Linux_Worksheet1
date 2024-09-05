#!/bin/bash

file_list=$(ls *.fasta)
motifs=("YVDRHPDDTINDYLNSI" "MGNHTWDHPDIFEILTTK")
#set -x
for file in $file_list; do
	echo "Processing $file"
	if [ -f "$file" ]; then
		sequence=$( grep -v ">" "$file")
	for motif in "${motifs[@]}"; do
	pos=$( echo "$sequence" | grep -b -o "$motif")
		if [ -n  "$pos" ]; then
			echo "$motif found in $file at $pos"
		else
			echo "$motif not found in $file"
		fi
	done
	else
		echo "$file is not a file"
		
	fi
done
#set +x

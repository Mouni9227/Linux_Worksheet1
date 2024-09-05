#!/bin/bash

# Hardcoded DNA sequence
dna_sequence="AGCTAGCTGCGTAGCTAGCGGTTAC"

# Function to validate the DNA sequence
validate_dna() {
    local sequence="$1"
    if [[ ! "$sequence" =~ ^[ACGT]+$ ]]; then
        echo "Error: The DNA sequence contains invalid characters."
        exit 1
    fi
}

# Function to count nucleotides
count_nucleotides() {
    local sequence="$1"
    local a_count=$(echo "$sequence" | grep -o "A" | wc -l)
    local c_count=$(echo "$sequence" | grep -o "C" | wc -l)
    local g_count=$(echo "$sequence" | grep -o "G" | wc -l)
    local t_count=$(echo "$sequence" | grep -o "T" | wc -l)

    echo "A: $a_count"
    echo "C: $c_count"
    echo "G: $g_count"
    echo "T: $t_count"
}

# Validate the DNA sequence
validate_dna "$dna_sequence"

# Count and print nucleotide occurrences
count_nucleotides "$dna_sequence"

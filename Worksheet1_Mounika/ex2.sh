#!/bin/bash

 #!/bin/bash

# Prompt the user to enter the CSV file name
read -p "Please enter the CSV file name: " input_file

# Check if the file exists
if [[ ! -f "$input_file" ]]; then
  echo "File not found!"
  exit 1
fi

# Read the CSV file line by line
while IFS= read -r line; do
  # Use awk to parse and print the required fields
  echo "$line" | awk -F '[,:]' '{print "UserID: " $1 "\nUsername: " $2 "\nDepartment: " $3 "\n"}'
done < "$input_file"


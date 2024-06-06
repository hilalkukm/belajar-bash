#!/bin/bash

# Read input from user | masukan file CSV
read -p "Enter the path input CSV file : " in_file

# Read input from user | output file CSV
read -p "Enter the path input CSV file : " out_file

# Check if the CSV file exists
if [[ ! -f "$in_file" ]]; then
    echo "Error : CSV file '$in_file' not found" >&2
    exit 1
fi

echo "Domain,Status" > "$out_file"

# Read the CSV file line by line
while IFS= read -r domain || [[ -n "$domain" ]];
do
    domain=$(echo "$domain" | xargs)

    # Skip empty lines
    if [[ -z "$domain" ]]; then
        continue
    fi

    # Debug: Print the domain being checked
    echo "Checking domain: $domain"

    # Ping the domain with 4 packets and suppress the output
    if ping -c 4 "$domain" > /dev/null 2>&1; then
        echo "Host $domain is alive."
	echo "$domain,Alive" >> "$out_file"
    else
        echo "Host $domain is unreachable."
	echo "$domain,Unreachable" >> "$out_file"
    fi

    # Introduce a delay of 1 second
    sleep 2

done < "$in_file"

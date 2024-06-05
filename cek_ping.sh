#!/bin/bash

# Define the path to the CSV file
csv_file="/home/sempak/Documents/cek_domain/domain_kukm.csv"

# Check if the CSV file exists
if [[ ! -f "$csv_file" ]]; then
    echo "CSV file not found: $csv_file"
    exit 1
fi

# Read the CSV file line by line
while IFS= read -r domain
do
    # Trim any leading or trailing whitespace (if necessary)
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
    else
        echo "Host $domain is unreachable."
    fi

    # Introduce a delay of 1 second
    sleep 4

done < "$csv_file"

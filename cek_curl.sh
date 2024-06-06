#!/bin/bash

# Read input from user | masukan file csv yang akan diuji
read -p "Enter the path input CSV file : " in_file

# Read input from user | ouput file
read -p "Enter the path output CSV file : " out_file

if [[ ! -f "$in_file" ]]; then
	echo "Error: CSV file '$in_file' not found" >&2
	exit 1
fi

echo "Domain,Status" > "$out_file"

# Read input CSV file line by line
while IFS= read -r domain; do
	URL="https://$domain"

	if curl -IkLs $URL | grep -q "HTTP/1.1 200 OK"; then
		echo "Success : The host $URL is alive with HTTP code 200"
		echo "$URL,Success" >> "$out_file"
	else
		echo "Error : The host $URL not return HTTP/1.1 200 OK" >&2
		echo "$URL,Error" >> "$out_file"
	fi
done << EOF
$(cat "$in_file")
EOF

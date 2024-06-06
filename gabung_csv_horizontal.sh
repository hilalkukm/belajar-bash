#!/bin/bash

# Read input file csv pertama
read -p "Enter the path input first CSV file : " first_file

# Read input file csv kedua
read -p "Enter the path input second CSV file : " second_file

# Read input hasil gabung
read -p "Enter the name result CSV file : " result_file

awk 'BEGIN{FS=OFS=","} NR==FNR{a[NR]=$0; next} {print a[FNR], $0}' "$first_file" "$second_file" > "$result_file"

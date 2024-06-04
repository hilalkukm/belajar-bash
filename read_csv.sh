#!/bin/bash

file="/home/sempak/Documents/cek_domain/domain_kukm.csv"

while IFS= read -r f1

do

	printf 'Domain kukm : %s\n' "$f1"

done <"$file"

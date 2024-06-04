#!/bin/bash

host="www.kemenkopukm.go.id"

# Ping the host with 4 packets and suppress the output
ping -c 4 "$host" > /dev/null 2>&1

# Check the exit status of the ping command
if [ $? -eq 0 ]; then
    echo "Host $host is alive."
else
    echo "Host $host is unreachable."
fi

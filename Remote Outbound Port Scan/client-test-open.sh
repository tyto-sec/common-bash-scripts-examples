#!/bin/bash
if [ -z "$1" ]; then
    echo "Port Scan"
    echo "Example: $0 192.168.0.2 2>&1 | grep succeeded"
else
    ports=$(cat nmap-ports-top1000.txt | tr ',' ' ')

    for port in $ports; do
        if [[ "$port" == *-* ]]; then
            start=$(echo $port | cut -d'-' -f1)
            end=$(echo $port | cut -d'-' -f2)
            for p in $(seq $start $end); do
                nc -v $1 $p &
            done
        else
            nc -v $1 $port & 
        fi
    done
fi
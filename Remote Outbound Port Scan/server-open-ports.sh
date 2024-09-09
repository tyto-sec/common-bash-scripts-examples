#!/bin/bash
ports=$(cat nmap-ports-top1000.txt | tr ',' ' ')

for port in $ports; do
    if [[ "$port" == *-* ]]; then
        start=$(echo $port | cut -d'-' -f1)
        end=$(echo $port | cut -d'-' -f2)
        for p in $(seq $start $end); do
            nc -l -v -p $p &
        done
    else
        nc -l -v -p $port &
    fi
done

wait
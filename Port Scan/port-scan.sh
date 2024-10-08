#!/bin/bash
if [ -z "$1" ]; then
    echo "Port Scan"
    echo "Example: $0 192.168.0.2"
else
    ports=$(cat nmap-ports-top1000.txt | tr ',' ' ')

    for port in $ports; do
        if [[ "$port" == *-* ]]; then
            start=$(echo $port | cut -d'-' -f1)
            end=$(echo $port | cut -d'-' -f2)
            for p in $(seq $start $end); do
                if hping3 -S -p $p -c 1 $1 2> /dev/null | grep -q "SA"; then
                    echo "port $p is up."
                fi
            done
        else
            if hping3 -S -p $port -c 1 $1 2> /dev/null | grep -q "SA"; then
                echo "port $port is up."
            fi
        fi
    done
fi
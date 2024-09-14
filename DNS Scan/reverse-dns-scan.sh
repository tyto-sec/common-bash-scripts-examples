#!/bin/bash

ip_to_int() {
    local ip=$1
    local a b c d
    IFS=. read -r a b c d <<< "$ip"
    echo "$((a << 24 | b << 16 | c << 8 | d))"
}

int_to_ip() {
    local int_ip=$1
    echo "$((int_ip >> 24 & 255)).$((int_ip >> 16 & 255)).$((int_ip >> 8 & 255)).$((int_ip & 255))"
}

if [ -z "$2" ]; then
    echo "DNS Bruteforce"
    echo "Example: $0 37.59.174.224 37.59.174.239"
else 
    start_int=$(ip_to_int $1)
    end_int=$(ip_to_int $2)

    for ((i=start_int; i<=end_int; i++)); do
        current_ip=$(int_to_ip $i)
        
        result=$(host $current_ip)
        
        if [[ $result != *"not found"* ]]; then
            echo "$result" | cut -d " " -f 5
        else
            echo "No domain found for $current_ip"
        fi
    done
fi
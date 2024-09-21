#!/bin/bash

if [ -z  "$1" ] 
then
	echo "Parsing HTML"
	echo "Example: $0 google.com.br"
else
    echo -e "\nHosts:\n"

    curl -s -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36" $1 \
        | grep -oP 'href="\Khttps?://[^"]*' | sed 's~https\?://~~' | cut -d':' -f 1 | cut -d'/' -f 1 > temp
    
    for host in $(cat temp)
    do  
        if echo "$host" | grep -Eq '^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$'; then
            echo "<unknown name>: $host" 
        else
            echo -n "$host: "
            result=$(host $host | grep -v NXDOMAIN | awk '/has address/ {print $4}' )
            if [ -z "$result" ]; then
                echo "<unknown ip>"
            else
                echo "$result"
            fi
        fi
    done
    echo -e "\n"
    rm temp
fi

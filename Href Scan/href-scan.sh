#!/bin/bash

if [ -z  "$1" ] 
then
	echo "Parsing HTML"
	echo "Example: $0 google.com.br"
else
    echo "\nHosts:\n"

    curl -s $1 | grep -oP 'href="\Khttps?://[^"]*' | sed 's~https\?://~~' | cut -d':' -f 1 | cut -d'/' -f 1 > temp
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
    echo "\n"
fi

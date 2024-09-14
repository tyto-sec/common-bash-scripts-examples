#!/bin/bash

if [ -z "$2" ]; then
    echo "DNS Bruteforce"
    echo "Example: $0 domain.com wordlists/subdomains-100.txt"
else
	for subdomain in $(cat $2); do
		host $subdomain.$1 | grep -v "NXDOMAIN"
	done
fi
#!/bin/bash

if [ -z "$2" ]; then
    echo "Subdomain Takeover Scan"
    echo "Example: $0 domain.com wordlists/subdomains-100.txt"
else
	for subdomain in $(cat $2); do
		host -t cname $subdomain.$1 | grep "alias for"
	done
fi
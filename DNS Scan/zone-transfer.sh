#!/bin/bash

if [ -z "$1" ]; then
	echo "Zone Transfer"
	echo "Example: $0 domain.com"
else
	for server in $(host -t ns $1 | cut -d " " -f4); do
		host -l $1 $server | grep "has address"
	done
fi
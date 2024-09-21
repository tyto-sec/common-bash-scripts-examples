#!/bin/bash
if [ -z  "$1" ] 
then
	echo "Arp Sweep"
	echo "Example: $0 192.168.0"
else
	for host in $(seq 1 254); do
		if arping -c 1 "$1.$host" | grep -q "time"; then
			echo "$1.$host is up."
		fi
	done
fi

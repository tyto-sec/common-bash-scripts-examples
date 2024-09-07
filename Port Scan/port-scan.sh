#!/bin/bash
if [ -z  "$1" ] 
then
	echo "Port Scan"
	echo "Example: $0 192.168.0.2"
else
	for port in $(seq 1 995); do
		if hping3 -S -p $port -c 1 $1  2> /dev/null | grep -q "SA"; then
			echo "port $port is up."
		fi
	done
fi

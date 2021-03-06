#!/bin/bash
## Take input from user for IP Address Network
echo "This tool allows users to scan IP Addresses in their network"

if [ "$1" == "" ]
	then
	echo "You forgot an IP address!"
	echo "Syntax: ./ipsweep.sh 192.168.1"
else
	for ip in `seq 1 254`; do
	ping -c 1 $1.$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" &
	ping -c 1 $1.$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" >> iplist.txt &
done
fi
echo " "
echo "Complete - the list can also be found in file iplist.txt"

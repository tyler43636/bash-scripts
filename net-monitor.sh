#!/bin/bash
#net-connect.sh
#Shows active connections of a user defined process
#

#Check for root user
if [ $UID != 0 ]; then
	echo "Please run as root"
	exit 0
fi

#Get process from command line user. 
#@Add option to enter a process if not passed at runtime
PROCESS=$1

lsof -i -n -P | grep $PROCESS

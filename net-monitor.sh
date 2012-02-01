#!/bin/bash
#net-connect.sh
#Shows active connections of a user defined process
#

PROCESS=$1
echo $PROCESS
lsof -i -n -P | grep $PROCESS

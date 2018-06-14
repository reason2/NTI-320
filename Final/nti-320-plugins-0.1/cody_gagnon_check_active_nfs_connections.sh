#!/bin/bash
# This is a script meant to let us test if a file exists
# using an NRPE plugin

IP=$1 # input used to test the connections to an nfs server

number_of_connections=$(netstat -an | grep $IP:2049 | wc -l)

if [ $number_of_connections -gt 100 ]; then
    echo "STATUS:CRITICAL"
    exit 2;

elif [ $number_of_connections -gt 50 ]; then
    echo "STATUS:WARNING"
    exit 1;

elif [ $number_of_connections -lt 50 ]; then
    echo "STATUS:OK"
    exit 0;

else
   # not sure how we got here...
   echo "STATUS:UNKNOWN"
   exit 3;
fi

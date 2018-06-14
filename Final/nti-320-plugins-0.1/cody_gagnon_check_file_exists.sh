#!/bin/bash
# This is a script meant to let us test if a file exists
# using an NRPE plugin

FILE=$1 # input used to test the status of a files' existence

if [ ! -e "$FILE" ]; then
    # check if a file/directory/symlink doesn't exist
    echo "STATUS:CRITICAL"
    exit 2;

elif [ -x "$FILE"]; then
    # check for an executable file on the nfs server
    # alerts if found to be executable
    echo "STATUS:CRITICAL"
    exit 2;

elif [ -L "$FILE"]; then
    # check for broken symlink
    echo "STATUS:WARNING"
    exit 1;

elif [ ! -r "$FILE" || ! -w "$FILE" ]; then
    # check for file permissions
    # in this case, not readable/writable
    echo "STATUS:WARNING"
    exit 1;

elif [ -e "$FILE"]; then
    # the file does exist and
    # can possibly be a functioning symlink
    echo "STATUS:OK"
    exit 0;

else
   # not sure how we got here...
   echo "STATUS:UNKNOWN"
   exit 3;
fi

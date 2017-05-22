#!/bin/bash

if [ -n "$1" ]; then                        # If no arguments are given to the script
   echo "Usage:                             # then print a usage statement and exit
   generate_config.sh hostname ip
   "
   exit 0;
fi

host="$1"
ip="$2"

echo "
# Host Definition
define host {
    use         linux-server        ; Inherit default values from a template
    host_name   $host               ; The name we're giving to this host
    alias       web server          ; A longer name associated with the host
    address     $ip                 ; IP address of the host
}
# Service Definition
define service{
        use                             generic-service         ; Name of service template to
 use
        host_name                       $host
        service_description             load
        check_command                   check_nrpe!check_load
}
define service{
        use                             generic-service         ; Name of service template to
 use
        host_name                       $host
        service_description             users
        check_command                   check_nrpe!check_users
}


">> /ect/nagios/conf.d/"$host".cfg




#!/bin/bash
# Need to put the NRPE changes into your config file
echo "########### NRPE CONFIG LINE #######################
        define command{
        command_name check_nrpe
        command_line $USER1$/check_nrpe -H $HOSTADDRESS$ -c $ARG1$
}" >> /etc/nagios/objects/commands.cfg



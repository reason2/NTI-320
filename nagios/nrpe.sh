#!/bin/bash
###############
#On the server#
###############
# Need to put the NRPE changes into your config file
echo "########### NRPE CONFIG LINE #######################
        define command{
        command_name check_nrpe
        command_line $USER1$/check_nrpe -H $HOSTADDRESS$ -c $ARG1$
}" >> /etc/nagios/objects/commands.cfg


###############
#On the client#
###############
sed -i "s,command[check_hda1]=/usr/lib64/nagios/plugins/check_disk -w 20% -c 10% -p /dev/hda1,command[check_disk]=/usr/lib64/nagios/plugins/check_disk -w 20% -c 10% -p /dev/sda1,g" /etc/nagios/nrpe.cfg

echo "command[check_mem]=/usr/lib64/nagios/plugins/check_mem.sh -w 80 -c 90" >> /etc/nagios/nrpe.cfg

# this should happen as part of the packaging of the rpm...
/etc/init.d/nagios-nrpe-server restart

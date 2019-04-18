#!/bin/bash
yum install -y nagios-nrpe-server nagios-plugins nrpe
systemctl enable nrpe
systemctl start nrpe
sed -i 's/allowed_hosts=127.0.0.1/allowed_hosts=127.0.0.1, 10.142.0.15/g' /etc/nagios/nrpe.cfg
sed -i "s,command[check_hda1]=/usr/lib64/nagios/plugins/check_disk -w 20% -c 10% -p /dev/hda1,command[check_disk]=/usr/lib64/nagios/plugins/check_disk -w 20% -c 10% -p /dev/sda1,g" /etc/nagios/nrpe.cfg
systemctl restart nrpe

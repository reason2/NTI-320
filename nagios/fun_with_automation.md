## Automating new machines in nagios

https://cloud.google.com/sdk/gcloud/reference/compute/copy-files
Allows you to copy files to any remote instance, meaning you can configure new machines on your laptop/local machine and scp those 
config files up to your nagios server.  You can also use it to make wide configuration changes on your machines.

```
Example usage:

create_instance.sh spins up a new machine on the cloud with a finishing script
then outputs the default nagios template to your local machine.  It adds any additional monitoring
you want to add (you can hard code this or use classes), then SCP's it up to your nagios server

```

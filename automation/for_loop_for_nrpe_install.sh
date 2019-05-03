for servername in $( gcloud compute instances list | awk '{print $1}' | sed "1 d" | grep -v nagios-a );  do 
    gcloud compute ssh --zone us-east4-c nicolebade@$servername --command='yum -y install wget && wget https://raw.githubusercontent.com/nic-instruction/NTI-320/master/nagios/nrpe_install.sh && bash nrpe_install.sh'
done

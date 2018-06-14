Name:		nti-320-plugins
Version: 	0.1
Release:	1%{?dist}
Summary: 	NTI-320 NRPE plugins

Group:		NTI-320
License:	GPL2+
URL:		https://github.com/nic-instruction/NTI-320
Source0:	https://github.com/nic-instruction/nti-320-plugins-0.1.tar.gz

BuildRequires:	gcc, python >= 1.3
Requires:	nrpe, nagios-plugins-all, bash, net-snmp, net-snmp-utils

%description
'nti-320-plugins' provides custom NRPE plugins
written by the NTI-320 class of 2017 with some additional fixes for our gcloud/centos 7 
environment.

%prep								

%setup -q	
		
%build					
%define _unpackaged_files_terminate_build 0

%install

rm -rf %{buildroot}
mkdir -p %{buildroot}/usr/lib64/nagios/plugins/
mkdir -p %{buildroot}/etc/nrpe.d/

install -m 0755 * %{buildroot}/usr/lib64/nagios/plugins/

install -m 0744 nti320.cfg %{buildroot}/etc/nrpe.d/

%clean

%files					
%defattr(-,root,root)	
/usr/lib64/nagios/plugins/nfs-service-check
/usr/lib64/nagios/plugins/cody_gagnon_check_file_exists.sh
/usr/lib64/nagios/plugins/cody_gagnon_check_active_nfs_connections.sh
/usr/lib64/nagios/plugins/check_nfs_dirs.sh
/usr/lib64/nagios/plugins/apachetestfromjoe


%config
/etc/nrpe.d/nti320.cfg

%doc			

%post

nagiosip=""
rsyslogip=""

touch /thisworked
systemctl enable snmpd
systemctl start snmpd
sed -i 's,/dev/hda1,/dev/sda1,'  /etc/nagios/nrpe.cfg
sed -i "s/allowed_hosts=127.0.0.1/allowed_hosts=127.0.0.1, $nagiosip/g" /etc/nagios/nrpe.cfg
echo "*.info;mail.none;authpriv.none;cron.none   @$rsyslogip" >> /etc/rsyslog.conf

systemctl enable nrpe
systemctl restart nrpe
systemctl restart rsyslog

%postun
rm /etc/nrpe.d/nti320.cfg
rm /thisworked
%changelog				# changes you (and others) have made and why

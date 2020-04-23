

# based on: https://www.tecmint.com/upgrade-mariadb-5-5-to-10-centos-rhel-debian-ubuntu/
# with some modifications

mysqldump -u root -ppassword --all-databases > /tmp/all-database.sql

systemctl stop mariadb

cp -a /var/lib/mysql/ /var/lib/mysql.bak
# at this point we would run an update, but updates hang on the latest google package... bad google

echo "# MariaDB 10.1 CentOS repository list - created 2016-01-18 09:58 UTC
# http://mariadb.org/mariadb/repositories/
[mariadb]
name = MariaDB
baseurl = http://yum.mariadb.org/10.1/centos7-amd64
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
gpgcheck=1" > /etc/yum.repos.d/MariaDB10.repo

yum -y remove mariadb-server mariadb mariadb-libs 
yum clean all 

yum -y install MariaDB-server MariaDB-client 
systemctl enable mariadb
systemctl start mariadb

mysql_upgrade -pP@ssw0rd1



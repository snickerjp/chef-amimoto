link "/etc/localtime" do
    to "/usr/share/zoneinfo/Asia/Tokyo"
end

#cp etc/motd.jp /etc/motd
#
#yum -y update
%w{zip unzip wget iptables}.each do |package_name|
  package package_name do
    action :install
  end
end

template "/etc/sysconfig/iptables" do
  source "sysconfig.iptables.erb"
end

service "iptables" do
  action [:enable,:restart]
end

#if [ -f /etc/sysconfig/iptables ]; then
#  mv /etc/sysconfig/iptables /etc/sysconfig/iptables.origin
#fi
#cp etc/sysconfig/iptables /etc/sysconfig/iptables
#service iptables restart; chkconfig iptables on
#iptables -L
#
#rpm --import http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL
#rpm -ivh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
#yum install -y denyhosts
#service denyhosts start; chkconfig denyhosts on
#
#yum install -y memcached
#service memcached start; chkconfig memcached on
#
#rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
#yum install --enablerepo=remi -y php php-cli php-devel php-mbstring php-gd php-pear php-xml php-fpm php-pecl-apc php-pecl-memcache
#
#service httpd stop > /dev/null 2>&1; chkconfig httpd off
#rpm -ivh http://nginx.org/packages/centos/6/noarch/RPMS/nginx-release-centos-6-0.el6.ngx.noarch.rpm
#yum install -y nginx
#service nginx start; chkconfig nginx on
#
#rpm --import http://www.percona.com/redir/downloads/percona-release/RPM-GPG-KEY-percona
#rpm -ivh http://www.percona.com/redir/downloads/percona-release/percona-release-0.0-1.x86_64.rpm
#yum install -y Percona-Server-server-55 Percona-Server-client-55 Percona-Server-shared-compat
#service mysql start; chkconfig mysql on
#
#yum install --enablerepo=remi -y php-mysqlnd php-mdo phpMyAdmin
#sed -e "s/\date\.timezone = \"UTC\"/date\.timezone = \"Asia\/Tokyo\"/" etc/php.ini > /etc/php.ini
#cp -Rf etc/php.d/* /etc/php.d/
#cp etc/php-fpm.conf /etc/
#cp -Rf etc/php-fpm.d/* /etc/php-fpm.d/
#rm -Rf /var/log/php-fpm/*
#service php-fpm start; chkconfig php-fpm on
#
#mkdir -p /var/tmp/php/session
#mkdir /var/www/vhosts
#chown -R nginx:nginx /var/tmp/php/session
#chown -R nginx:nginx /var/log/php-fpm
#chown -R nginx:nginx /var/www/vhosts
#
#cp usr/local/bin/wp-setup /usr/local/bin/; chmod +x /usr/local/bin/wp-setup
#cp usr/local/bin/wp-replace-siteurl /usr/local/bin/; chmod +x /usr/local/bin/wp-replace-siteurl
#
#/usr/local/bin/wp-setup default
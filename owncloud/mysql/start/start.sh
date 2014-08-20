#!/bin/sh
# based on https://github.com/BlackIkeEagle/docker-archlinux-images
DB_ADMIN_USER=${DB_ADMIN_USER:-admin}
DB_ADMIN_PASS=${DB_ADMIN_PASS:-admin}
set -x
MYSQLD=/usr/libexec/mysqld
if [[ ! -e "/var/lib/mysql/.installed" ]]; then
	/usr/bin/mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

	su - mysql -s /bin/bash -c "$MYSQLD --pid-file=/var/run/mysqld/mysqld.pid --bind-address=0.0.0.0 --skip-name-resolve --datadir=/var/lib/mysql" &
	MYSQLPID=$!
	sleep 5
	mysql -uroot -e "CREATE USER '$DB_ADMIN_USER'@'%' IDENTIFIED BY '$DB_ADMIN_PASS'; GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION; FLUSH PRIVILEGES;"
	sleep 1
	killall mysqld
	wait $MYSQLPID
	touch /var/lib/mysql/.installed
fi

exec su - mysql -c "$MYSQLD --general-log=on --log-warnings"



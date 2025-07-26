#!/bin/sh

# init DB if it did not exit #
if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo -e "\e[33Initializing MariaDB database...\e[0m"
    mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi

mysqld_safe --datadir=/var/lib/mysql --user=mysql &
MYSQL_PID=$!

while ! mysqladmin ping --silent; do
	sleep 1
done


mysql -u root << EOF

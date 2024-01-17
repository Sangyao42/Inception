#!/bin/bash

# ls -la /etc/mysql
# echo "config files are above"
ls -la /etc/mysql/mariadb.conf.d
# cat /etc/mysql/my.cnf
# echo "finished the file"
# cat /etc/mysql/mariadb.conf.d/50-server.cnf
# chmod -R 770 /var/lib/mysql
# ls -la /var/lib/mysql
#mariadbd
#service mariadb restart

# Set MariaDB credentials
# DB_USER="${MYSQL_USER}"
# DB_PASSWORD="${MYSQL_PASSWORD}"
# DB_NAME="${MYSQL_DATABASE}"
# DB_ROOT_PASSWORD="${MYSQL_ROOT_PASSWORD}"

service mariadb start

mariadb << EOF
CREATE DATABASE IF NOT EXISTS '${MYSQL_DATABASE}';
FLUSH PRIVILEGES;
SHOW DATABASES;
EOF

# mariadb << EOF
# CREATE DATABASE IF NOT EXISTS test;
# FLUSH PRIVILEGES;
# SHOW DATABASES;
# EOF

#kill $(cat /var/run/mysqld/mysqld.pid)

mariadb-admin -u root -p$SQL_ROOT_PASSWORD shutdown

echo "hi"

#exec mysqld_safe
exec mariadbd-safe

#CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';
#GRANT ALL PRIVILEGES ON '${MYSQL_DATABASE}'.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
#ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
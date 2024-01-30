#!/bin/bash

# chmod -R 770 /var/lib/mysql

service mariadb start

#sleep 10

mariadb -u root -p$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;\
CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';\
GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%';\
FLUSH PRIVILEGES;\
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';\
FLUSH PRIVILEGES;"

#echo $MYSQL_ROOT_PASSWORD;

#mariadb-admin -u root -p$MYSQL_ROOT_PASSWORD shutdown
mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown

#service mariadb stop

exec mariadbd-safe








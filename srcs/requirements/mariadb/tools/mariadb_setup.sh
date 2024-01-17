#!/bin/bash

# chmod -R 770 /var/lib/mysql

# Set MariaDB credentials
# DB_USER="${MYSQL_USER}"
# DB_PASSWORD="${MYSQL_PASSWORD}"
# DB_NAME="${MYSQL_DATABASE}"
# DB_ROOT_PASSWORD="${MYSQL_ROOT_PASSWORD}"

service mariadb start

mariadb -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;\
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';\
GRANT ALL PRIVILEGES ON '${MYSQL_DATABASE}'.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';\
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';\
FLUSH PRIVILEGES;\
SHOW DATABASES;"

#sleep 5

#mariadb-admin -u root -p$SQL_ROOT_PASSWORD shutdown

service mariadb stop

exec mariadbd-safe








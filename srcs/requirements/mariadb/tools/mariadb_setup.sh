#!/bin/bash

# chmod -R 770 /var/lib/mysql

# Set MariaDB credentials
# DB_USER="${MYSQL_USER}"
# DB_PASSWORD="${MYSQL_PASSWORD}"
# DB_NAME="${MYSQL_DATABASE}"
# DB_ROOT_PASSWORD="${MYSQL_ROOT_PASSWORD}"

if service mariadb start; then
	 echo "INFO: Started MariaDB as a background service"
else
	 echo "ERROR: Failed to start MariaDB service."
fi

sleep 10
#mariadb -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;\
#CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';\
#GRANT ALL PRIVILEGES ON '${MYSQL_DATABASE}'.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';\
#ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';\
#FLUSH PRIVILEGES;\
#SHOW DATABASES;"


if mariadb -u root -p$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;\
CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';\
GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';\
FLUSH PRIVILEGES;\
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';\
FLUSH PRIVILEGES;"; then
	 echo "INFO: MariaDB database created successfully"
else
	 echo "ERROR: Failed to create MariaDB database."
fi


#if mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';\
#FLUSH PRIVILEGES;";then
#	 echo "INFO: MariaDB credentials set successfully"
#else
#	 echo "ERROR: Failed to set MariaDB credentials."
#fi


echo $MYSQL_ROOT_PASSWORD;

#mariadb-admin -u root -p$MYSQL_ROOT_PASSWORD shutdown
if mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown; then
     echo "INFO: Stopped MariaDB as a background service"
else
     echo "ERROR: Failed to stop MariaDB service."
fi

#service mariadb stop

#
#ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';\

if exec mariadbd-safe; then
	 echo "INFO: Started MariaDB as a foreground service"
else
	 echo "ERROR: Failed to start MariaDB service."
fi








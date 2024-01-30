#!/bin/bash

#wait until mariabd starts
sleep 10

wp-cli.phar core download --allow-root --path='/var/www/wordpress'

#check if wp-config.php already exists
if [ ! -e "/var/www/wordpress/wp-config.php" ]; then
	#config the database
	echo "create"
	wp-cli.phar config create --allow-root --path='/var/www/wordpress' \
		--dbname=$MYSQL_DATABASE \
		--dbuser=$MYSQL_USER \
		--dbpass=$MYSQL_PASSWORD \
		--dbhost=mariadb:3306
fi

#configure the wordpress admin
wp-cli.phar core install --url=$DOMAIN_NAME --title=$WP_TITLE \
	--admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL \
	--skip-email --allow-root --path='/var/www/wordpress'

#create a new user in wordpress
wp-cli.phar user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASSWORD --allow-root --path='/var/www/wordpress'

if [ ! -e "/run/php" ]; then
	mkdir /run/php
fi

/usr/sbin/php-fpm8.2 -F

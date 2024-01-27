#wait until mariabd starts
sleep 10

#check if wp-config.php already exists
if test -e "/var/www/wordpress/wp-config.php"; then
	exit
else
	#config the database
	wp config create --allow-root \
		--dbname=$MYSQL_DATABASE \
		--dbuser=$MYSQL_USER \
		--dbpass=$MYSQL_PASSWORD \
		#--dbhost=mariadb:3306 \
		--dbhost=localhost:3306
		--path='/var/www/wordpress'
fi

#configure the wordpress admin
wp core install --url=$DOMAIN_NAME --title=$WP_TITLE \
	--admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL \
	--skip-email --allow-root

#create a new user in wordpress
wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASSWORD --allow-root

#
if test -e "/run/php"; then
	exit
else
	mkdir /run/php

/usr/sbin/php-fpm8.2 -F
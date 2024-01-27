# syntax=docker/dockerfile:1
FROM debian:bullseye

RUN apt-get -y update && \
	apt-get -y upgrade && \
	apt-get -y install wget && \
	apt-get -y install mariadb-client

#install php8.2 on debian 11
RUN apt -y install lsb-release apt-transport-https ca-certificates && \
	wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install -y php8.2 php8.2-fpm php8.2-mysql

#install wordpress
RUN wget https://wordpress.org/latest.tar.gz -P /var/www
RUN cd /var/www && tar -xzf latest.tar.gz && rm latest.tar.gz
RUN chown -R root:root /var/www/wordpress

#configure php
COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf

#configure wordpress using wp-cli.phar
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

#for testing
ENV MYSQL_DATABASE=syntx \
	MYSQL_USER=sydb \
	MYSQL_PASSWORD=7890 \
	MYSQL_ROOT_PASSWORD=0987

COPY ./tools/auto_wp_config.sh /
RUN chmod +x /auto_wp_config.sh

EXPOSE 9000

ENTRYPOINT ["./auto_wp_config.sh"]
FROM debian:bullseye

RUN apt-get -y update && \
	apt-get -y upgrade && \
	apt-get -y install mariadb-server mariadb-client

RUN mkdir -p /run/mysqld && \
	chown -R mysql:mysql /run/mysqld

#	mkdir -p /var/lib/mysql && \
#	chown -R mysql:mysql /var/lib/mysql

# RUN mariadb-install-db

#ENV MYSQL_DATABASE=syntx

COPY ./conf/mariadb.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/mariadb_setup.sh .

RUN chmod +x /mariadb_setup.sh
# EXPOSE 3306
CMD ["./mariadb_setup.sh"]
# syntax=docker/dockerfile:1
FROM debian:bullseye

RUN apt-get -y update && \
	apt-get -y upgrade && \
	apt-get -y install mariadb-server mariadb-client

RUN mkdir -p /run/mysqld && \
	chown -R mysql:mysql /run/mysqld && \
	mkdir -p /var/lib/mysql && \
	chown -R mysql:mysql /var/lib/mysql

COPY ./conf/mariadb.cnf /etc/mysql/mariadb.conf.d/mariadb.cnf
COPY ./tools/mariadb_setup.sh /
RUN chmod +x /mariadb_setup.sh

RUN mariadb-install-db
#RUN mysql_secure_installation

#for documenation reason
EXPOSE 3306

ENTRYPOINT ["./mariadb_setup.sh"]

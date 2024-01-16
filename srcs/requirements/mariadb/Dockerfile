FROM debian:bullseye

RUN apt-get -y update && \
	apt-get -y upgrade && \
	apt-get -y install mariadb-server mariadb-client && \
	mkdir -p /run/mysqld && \
	chown -R mysql:mysql /run/mysqld
# RUN mariadb-install-db

COPY ./conf/mariadb.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/mariadb_setup.sh .

RUN chmod +x /mariadb_setup.sh
# EXPOSE 3306
CMD ["./mariadb_setup.sh"]
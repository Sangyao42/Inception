# syntax=docker/dockerfile:1
FROM debian:bullseye

ARG CERTS

RUN apt-get -y update && \
	apt-get -y upgrade && \
	apt-get -y install nginx && \
	apt-get -y install openssl

#TLS (Transport Layer Security) and its predecessor SSL (Secure Sockets Layer)
#are cryptographic protocols that provide secure communication over a computer network.
#These protocols are commonly used to secure the communication
#between a web server (such as Nginx) and web clients (such as web browsers).
#It locates at the application layer in OSI model.

#create the directory to store the ssl_certificate and ssl_certificate_key
RUN mkdir -p /etc/nginx/ssl

#req command creates and processes the certificate requests
#-x509 is self-signed certificate
RUN echo hi
RUN openssl req -new -x509 -nodes -out $CERTS -keyout /etc/nginx/ssl/inception.key -subj "/C=DE/ST=BW/L=Heilbronn/O=42/OU=42/CN=sawang.42.fr/UID=sawang"
#RUN chmod 644 /etc/nginx/ssl/inception*

#for nginx to store runtime information
RUN mkdir -p /var/run/nginx

COPY ./conf/nginx.conf /etc/nginx/sites-available/mynginx.conf
COPY ./tools/nginx_setup.sh /

RUN chmod +x /nginx_setup.sh
RUN ./nginx_setup.sh

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

EXPOSE 443
#runnning nginx
ENTRYPOINT ["nginx", "-g", "daemon off;"]
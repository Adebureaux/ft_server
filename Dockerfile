#INSTALL DEBIAN BUSTER
FROM debian:buster

#UPDATE SOFTWARE PACKAGES
RUN apt update
RUN apt upgrade -y
RUN apt install -y wget

#INSTALL NGINX
RUN apt install -y nginx
RUN rm -f /etc/nginx/sites-available/default
COPY srcs/default /etc/nginx/sites-available/default

#INSTALL PHP
RUN apt install -y php7.3 php-mysql php-fpm php-pdo php-gd php-cli php-mbstring

#INSTALL AND START DATABASE
RUN apt install -y mariadb-server
RUN start-db.sh

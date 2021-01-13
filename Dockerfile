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
RUN mkdir script
COPY srcs/start.sh script/start.sh
RUN bash script/start.sh

WORKDIR /var/www/html/
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz
RUN tar -xf phpMyAdmin-5.0.1-english.tar.gz && rm -rf phpMyAdmin-5.0.1-english.tar.gz
RUN mv phpMyAdmin-5.0.1-english phpmyadmin

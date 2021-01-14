#INSTALL DEBIAN BUSTER
FROM debian:buster

#UPDATE SOFTWARE PACKAGES
RUN apt update
RUN apt upgrade -y
RUN apt install -y wget

#INSTALL NGINX
RUN apt install -y nginx
COPY srcs/default /etc/nginx/sites-available

#INSTALL PHP
RUN apt install -y php7.3 php-mysql php-fpm php-pdo php-gd php-cli php-mbstring

#INSTALL AND START DATABASE
RUN apt install -y mariadb-server

#INSTALL PHPMYADMIN
WORKDIR /var/www/html
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz
RUN tar -xf phpMyAdmin-5.0.1-english.tar.gz && rm -rf phpMyAdmin-5.0.1-english.tar.gz
RUN mv phpMyAdmin-5.0.1-english phpmyadmin
COPY srcs/config.inc.php phpmyadmin

#INSTALL WORDPRESS
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvzf latest.tar.gz && rm -rf latest.tar.gz
COPY srcs/wp-config.php /var/www/html

#SSL CERTIFICATE
RUN openssl req -x509 -nodes -days 365 -subj "/C=FR/ST=France/L=Paris/O=42/OU=42Paris/CN=adeburea" -newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt;

#AUTHORIZATION
RUN chown -R www-data:www-data *
RUN chmod -R 755 /var/www/*
COPY ./srcs/start.sh .
CMD bash start.sh

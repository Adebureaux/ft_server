#INSTALL DEBIAN BUSTER
FROM debian:buster

#SETUP APT
RUN apt update
RUN apt -y upgrade

#INSTALL SERVICES
RUN apt -y install nginx
RUN apt -y install wget
RUN apt -y install openssl
RUN apt -y install mariadb-server
RUN apt -y install php-fpm php-mysql

#SETUP NGINX
RUN mkdir /var/www/wordpress
RUN chmod -R 755 /var/www/*
COPY srcs/default.conf /etc/nginx/sites-available/wordpress
RUN ln -s /etc/nginx/sites-available/wordpress /etc/nginx/sites-enabled/

#AUTO-INDEX
COPY srcs/auto-index.sh ./
RUN chmod +x auto-index.sh

#SET MYSQL
COPY srcs/wordpress.sql /tmp/
COPY srcs/mysql.sh /tmp/
RUN bash /tmp/mysql.sh

#SETUP WORDPRESS
COPY srcs/wp-config.php /var/www/wordpress/
RUN cd /tmp && wget https://wordpress.org/latest.tar.gz && tar xzvf latest.tar.gz
RUN mv /tmp/wordpress/* /var/www/wordpress/
RUN chown -R www-data:www-data /var/www/*

# SETUP PhpMyAdmin
RUN mkdir /var/www/phpmyadmin
RUN cd /tmp && wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz  && tar xzf phpMyAdmin-5.0.1-english.tar.gz
RUN mv /tmp/phpMyAdmin-5.0.1-english/* /var/www/phpmyadmin/

#SET SSL
RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -newkey rsa:4096 -sha256 -nodes -keyout /etc/nginx/ssl/key.pem -out /etc/nginx/ssl/local.pem -days 365 -subj "/C=FR/ST=FRANCE/L=PARIS/O=42/OU=42PARIS/CN=adeburea"

#START
COPY srcs/start.sh ./
RUN chmod +x start.sh
CMD bash start.sh

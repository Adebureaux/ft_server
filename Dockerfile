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

# SET AUTOINDEX SWITCHABLE COMMAND
COPY srcs/auto-index.sh ./
RUN chmod +x auto-index.sh

# SET MYSQL
COPY srcs/wordpress.sql /tmp/
COPY srcs/mysql.sh /tmp/
RUN bash /tmp/mysql.sh

# SETUP wordpress
COPY srcs/wp-config.php /var/www/wordpress/
RUN cd /tmp && wget https://wordpress.org/latest.tar.gz && tar xzvf latest.tar.gz
RUN mv /tmp/wordpress/* /var/www/wordpress/
RUN chown -R www-data:www-data /var/www/*
RUN rm /tmp/latest.tar.gz

# SETUP PHPMYADMIN
RUN mkdir /var/www/phpmyadmin
RUN cd /tmp && wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-english.tar.gz  && tar xzf phpMyAdmin-4.9.0.1-english.tar.gz --strip-components=1 -C /var/www/phpmyadmin

# SET SSL
RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -newkey rsa:4096 -sha256 -nodes -keyout /etc/nginx/ssl/localhost_key.pem -out /etc/nginx/ssl/localhost.pem -days 365 -subj "/C=FR/ST=FRANCE/L=PARIS/O=42/OU=42PARIS/CN=adeburea"

#START
COPY srcs/start.sh /tmp
RUN chmod +x /tmp/start.sh
CMD bash /tmp/start.sh

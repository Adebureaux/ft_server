#FROM qui vous permet de définir l'image source ;
#RUN qui vous permet d’exécuter des commandes dans votre conteneur ;
#ADD qui vous permet d'ajouter des fichiers dans votre conteneur ;
#WORKDIR qui vous permet de définir votre répertoire de travail ;
#EXPOSE qui permet de définir les ports d'écoute par défaut ;
#VOLUME qui permet de définir les volumes utilisables ;
#CMD qui permet de définir la commande par défaut lors de l’exécution de vos conteneurs Docker.
FROM debian:buster

#UPDATE SYSTEM
RUN apt update
RUN apt upgrade

#INSTALL NGINX
RUN apt install -y nginx
RUN apt install -y mariadb-server
RUN apt install -y wget
RUN apt install -y php-fpm php-mysql
RUN apt install -y openssl

#INSTALL WORDPRESS WITH NGINX
RUN mkdir -p /var/www/wordpress
RUN chmod -R 777 /var/www/*


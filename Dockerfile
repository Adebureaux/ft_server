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

#INSTALLL NGINX
RUN apt install nginx
RUN apt install mariadb-server
RUN apt install wget
RUN apt install php-fpm php-mysql
RUN apt install openssl

#https://www.hostinger.com/tutorials/how-to-install-wordpress-with-nginx-on-ubuntu/

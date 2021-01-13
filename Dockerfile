#INSTALL DEBIAN BUSTER
FROM debian:buster

#UPDATE SOFTWARE PACKAGES
RUN apt update
RUN apt upgrade -y
RUN apt install -y wget

#INSTALL NGINX
RUN apt install -y nginx

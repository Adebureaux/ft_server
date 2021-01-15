#!/bin/bash

service nginx configtest
service nginx start
service mysql start
service php7.3-fpm start
service --status-all
rm -rf /var/www/html

/bin/bash

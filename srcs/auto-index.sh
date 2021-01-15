#!/bin/bash

if grep "autoindex on;" /etc/nginx/sites-enabled/wordpress > /dev/null; then
	echo "AUTOINDEX: OFF"
	sed -i 's/autoindex on/autoindex off/' /etc/nginx/sites-available/wordpress
else
	echo "AUTOINDEX: ON"
	sed -i 's/autoindex off/autoindex on/' /etc/nginx/sites-available/wordpress
fi
nginx -s reload

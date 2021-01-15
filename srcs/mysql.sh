service mysql restart
echo "CREATE DATABASE wordpress;" | mysql -u root
echo "CREATE USER 'admin' identified by 'admin';" | mysql -u root
echo "GRANT USAGE ON wordpress.* TO 'admin'@'localhost' identified by 'admin';" | mysql -u root
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'admin'@'localhost' identified by 'admin';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
mysql wordpress -u root < ./tmp/wordpress.sql

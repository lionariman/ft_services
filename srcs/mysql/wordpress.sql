CREATE DATABASE wordpress_db;
GRANT ALL ON wordpress_db.* TO 'admin'@'wordpress-host' IDENTIFIED BY 'admin' WITH GRANT OPTION;
FLUSH PRIVILEGES;
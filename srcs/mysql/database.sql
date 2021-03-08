CREATE DATABASE wordpress_db;
GRANT ALL PRIVILEGES ON wordpress_db.* TO 'admin'@'%' identified by 'admin' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EXIT
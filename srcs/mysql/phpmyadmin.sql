CREATE DATABASE phpmyadmin_db;
GRANT ALL ON phpmyadmin_db.* TO 'admin'@'phpmyadmin-host' IDENTIFIED BY 'admin' WITH GRANT OPTION;
FLUSH PRIVILEGES;
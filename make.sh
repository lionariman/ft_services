eval $(minikube docker-env)
./nginx.sh
./wordpress.sh
./phpmyadmin.sh
./mysql.sh
./influxdb.sh
./grafana.sh
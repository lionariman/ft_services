eval $(minikube docker-env)
echo y | docker image prune
./nginx.sh
./wordpress.sh
./phpmyadmin.sh
./mysql.sh
# ./ftps.sh
# ./grafana.sh
# ./influxdb.sh
#minikube dashboard

echo "stop and delete cluster"
minikube stop
minikube delete

echo "create cluster"
minikube start --vm-driver=virtualbox --cpus=4 --memory=4096 --disk-size=50G

echo "switch docker to work inside the cluster"
eval $(minikube docker-env)


#---------------create-pods-----------------
echo "docker builds"
docker build -t mysql-image srcs/mysql/
docker build -t phpmyadmin-image srcs/phpmyadmin/
docker build -t wordpress-image srcs/wordpress/
docker build -t nginx-image srcs/nginx/
docker build -t influxdb-image srcs/influxdb/
docker build -t grafana-image srcs/grafana/
docker build -t ftps-image srcs/ftps/

echo "apply yamls"
kubectl apply -f srcs/mysql/mysql.yaml
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml
kubectl apply -f srcs/wordpress/wordpress.yaml
kubectl apply -f srcs/nginx/nginx.yaml
kubectl apply -f srcs/influxdb/influxdb.yaml
kubectl apply -f srcs/grafana/grafana.yaml
kubectl apply -f srcs/ftps/ftps.yaml
#-------------------------------------------

echo "enable metallb and dashboard"
minikube addons enable metallb
minikube addons enable dashboard
minikube addons list

echo "apply config map"
kubectl apply -f srcs/confmap.yaml

kubectl get pods
minikube dashboard

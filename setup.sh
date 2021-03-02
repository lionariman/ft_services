echo "stop and delete cluster"
minikube stop
minikube delete

echo "create cluster"
minikube start --vm-driver=virtualbox --memory 4096

echo "swith docker to work inside the cluster"
eval $(minikube docker-env)

#---------------create-pods-----------------
echo "docker builds"
docker build -t nginx-image srcs/nginx/
docker build -t wordpress-image srcs/wordpress/

echo "apply yamls"
kubectl apply -f srcs/nginx/nginx.yaml
kubectl apply -f srcs/wordpress/wordpress.yaml
#-------------------------------------------

echo "enable metallb and dashboard"
minikube addons enable metallb
minikube addons enable dashboard
minikube addons list

echo "apply config map"
kubectl apply -f srcs/confmap.yaml

kubectl get pods
minikube dashboard
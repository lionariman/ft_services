echo "delete cluster"
minikube delete

echo "create cluster"
minikube start --vm-driver=virtualbox --memory 4096

echo "swith docker to work inside the cluster"
eval $(minikube docker-env)

echo "delete docker image for nginx"
kubectl delete pods nginx

#---------------create-pods-----------------
echo "docker builds"
docker build -t nginx-image srcs/nginx/

echo "apply yamls"
kubectl apply -f srcs/nginx/nginx.yaml
#-------------------------------------------

echo "enable metallb and dashboard"
minikube addons enable metallb
minikube addons enable dashboard
minikube addons list

echo "apply config map"
kubectl apply -f srcs/confmap.yaml

minikube dashboard
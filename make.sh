eval $(minikube docker-env)
./delete.sh
./build.sh
./apply.sh
#minikube dashboard

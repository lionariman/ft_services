kubectl delete -f srcs/ftps/ftps.yaml
docker build -t ftps-image srcs/ftps/
kubectl apply -f srcs/ftps/ftps.yaml

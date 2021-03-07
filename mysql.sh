kubectl delete -f srcs/mysql/mysql.yaml
docker build -t mysql-image srcs/mysql/
kubectl apply -f srcs/mysql/mysql.yaml

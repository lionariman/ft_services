kubectl delete -f srcs/influxdb/influxdb.yaml
docker build -t influxdb-image srcs/influxdb/
kubectl apply -f srcs/influxdb/influxdb.yaml

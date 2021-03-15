kubectl delete -f srcs/grafana/grafana.yaml
docker build -t grafana-image srcs/grafana/
kubectl apply -f srcs/grafana/grafana.yaml

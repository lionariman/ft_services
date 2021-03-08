kubectl delete -f srcs/nginx/nginx.yaml
docker build -t nginx-image srcs/nginx/
kubectl apply -f srcs/nginx/nginx.yaml

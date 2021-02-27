echo "kubectl delete pods nginx"
kubectl delete pods nginx
echo "docker build -t nginx-image ."
docker build -t nginx-image .
echo "kubectl apply -f nginx.yaml"
kubectl apply -f nginx.yaml

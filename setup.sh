echo "kubectl delete pods nginx"
kubectl delete pods nginx

echo "docker build"
docker build -t nginx-image nginx/

kubectl apply -f nginx/confmap.yaml

echo "apply nginx.yaml"
kubectl apply -f nginx/nginx.yaml

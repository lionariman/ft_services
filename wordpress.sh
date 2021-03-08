kubectl delete -f srcs/wordpress/wordpress.yaml
docker build -t wordpress-image srcs/wordpress/
kubectl apply -f srcs/wordpress/wordpress.yaml

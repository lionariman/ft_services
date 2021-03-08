kubectl delete -f srcs/phpmyadmin/phpmyadmin.yaml
docker build -t phpmyadmin-image srcs/phpmyadmin/
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml
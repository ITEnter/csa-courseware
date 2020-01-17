##Move through subscriptions
```
az account list --output table
az account set --subscription "My Demos"

az aks get-credentials --resource-group Contemporary-DevOps --name Contemporary-DevOps
```

##Role management
```
az aks list --resource-group <your-resource-group>

az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/<your-subscription-id>/resourceGroups/contemporary-devops"
```

###Install istio
```
GRAFANA_USERNAME=$(echo -n "grafana" | base64)
GRAFANA_PASSPHRASE=$(echo -n "KDJSKJFK##xx2#" | base64)

cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Secret
metadata:
  name: grafana
  namespace: istio-system
  labels:
    app: grafana
type: Opaque
data:
  username: $GRAFANA_USERNAME
  passphrase: $GRAFANA_PASSPHRASE
EOF

KIALI_USERNAME=$(echo -n "kiali" | base64)
KIALI_PASSPHRASE=$(echo -n "KWJDksJDKHW@12" | base64)

cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Secret
metadata:
  name: kiali
  namespace: istio-system
  labels:
    app: kiali
type: Opaque
data:
  username: $KIALI_USERNAME
  passphrase: $KIALI_PASSPHRASE
EOF

helm install install/kubernetes/helm/istio --name istio --namespace istio-system \
  --set global.controlPlaneSecurityEnabled=true \
  --set mixer.adapters.useAdapterCRDs=false \
  --set grafana.enabled=true --set grafana.security.enabled=true \
  --set tracing.enabled=true \
  --set kiali.enabled=true
```

#Docker demo
```
docker run -d --hostname my-rabbit --name some-rabbit rabbitmq:3

docker run -d --hostname my-rabbit --name some-rabbit -e RABBITMQ_DEFAULT_USER=user -e RABBITMQ_DEFAULT_PASS=password rabbitmq:3-management


docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' container_name_or_id
```

##Dockerfile
```
FROM ubuntu
MAINTAINER Romin Irani
RUN apt-get update
RUN apt-get install -y nginx
COPY index.html /usr/share/nginx/html/
ENTRYPOINT [“/usr/sbin/nginx”,”-g”,”daemon off;”]
EXPOSE 80
```
`docker build -t myimage:latest .`



az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/8adc1d25-72b7-4d8a-87e6-9bdca36a256f/resourceGroups/ 
kubectl config set-cluster Contemporary-Devops
istioctl manifest apply -f ../istio.aks.yaml --logtostderr --set installPackagePath=./install/kubernetes/operator/charts

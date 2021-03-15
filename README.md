## on docker for mac need to install metrics-server
```
k apply -f metrics-server.yaml
```

## install prometheus
```
git clone https://github.com/prometheus-operator/kube-prometheus
cd kube-prometheus
kubectl create -f manifests/setup
until kubectl get servicemonitors --all-namespaces ; do date; sleep 1; echo ""; done
kubectl create -f manifests/
```

to delete:
```
kubectl delete --ignore-not-found=true -f manifests/ -f manifests/setup
```

## build standard mtail image
```
git clone https://github.com/google/mtail
docker build -t mtail .
```

## build runner image
```
cd runner
docker build -t runner .
```

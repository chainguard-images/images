#!/bin/bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# shellcheck disable=SC1091
source ../libs/libs.sh

image="$(get_test_image 'haproxy')"

retry_until 5 20 apk add wait-for-it

while ! kubectl get serviceaccount default; do
    echo "Waiting for default service account"
    sleep 2
done

kubectl run nginx -l app=nginx --image "${NGINX_IMAGE}"
kubectl wait --for=condition=Ready pod -l app=nginx --timeout=60s
kubectl expose pod nginx --port 8080 --target-port 8080 --name=nginx --type=ClusterIP

kubectl create configmap haproxy-config --from-file=haproxy-slim.cfg

cat <<YAML | kubectl apply -f -
apiVersion: v1
kind: Pod
metadata:
  name: haproxy
  labels:
    app: haproxy
spec:
  containers:
  - name: haproxy
    image: "$image"
    command: [ "haproxy" ]
    args: [ "-f", "/etc/haproxy.cfg" ]
    volumeMounts:
    - name: haproxy-config-volume
      mountPath: /etc/haproxy.cfg # single file mount, no subpath needed
    ports:
    - containerPort: 8080
  volumes:
  - name: haproxy-config-volume
    configMap:
      name: haproxy-config
YAML

kubectl wait --for=condition=Ready pod -l app=haproxy --timeout=60s
kubectl expose pod haproxy --port 8888 --target-port 8080 --name=haproxy --type=ClusterIP
retry_until 5 3 sh -c "curl -sI http://haproxy.default.svc.cluster.local:8888 |grep 'nginx'"


#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

TMPDIR=$(mktemp -d)

cleanup() {
	rm -rf $TMPDIR
}

trap cleanup EXIT

# Install a dev etcd
set +u
cat >$TMPDIR/etcd.yaml <<EOF
apiVersion: v1
kind: Service
metadata:
  name: etcd-client
spec:
  type: ClusterIP
  ports:
  - name: etcd-client
    port: 2379
    protocol: TCP
    targetPort: 2379
  selector:
    app.kubernetes.io/name: etcd
---
apiVersion: v1
kind: Service
metadata:
  name: etcd
spec:
  clusterIP: None
  ports:
  - port: 2379
    name: client
  - port: 2380
    name: peer
  selector:
    app.kubernetes.io/name: etcd
---
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: etcd
  labels:
    app.kubernetes.io/name: etcd
spec:
  serviceName: etcd
  replicas: 1
  selector:
    matchLabels:
      app.kubernetes.io/name: etcd
  template:
    metadata:
      name: etcd
      labels:
        app.kubernetes.io/name: etcd
    spec:
      containers:
      - name: etcd
        image: cgr.dev/chainguard/etcd:latest-dev
        ports:
        - containerPort: 2379
          name: client
        - containerPort: 2380
          name: peer
        volumeMounts:
        - name: data
          mountPath: /var/run/etcd
        command:
          - /bin/sh
          - -c
          - |
            PEERS="etcd-0=http://etcd-0.etcd:2380"
            exec etcd --name \$HOSTNAME \
              --listen-peer-urls http://0.0.0.0:2380 \
              --listen-client-urls http://0.0.0.0:2379 \
              --advertise-client-urls http://\$HOSTNAME.etcd:2379 \
              --initial-advertise-peer-urls http://\$HOSTNAME:2380 \
              --initial-cluster-token etcd-cluster-1 \
              --initial-cluster \$PEERS \
              --initial-cluster-state new
  volumeClaimTemplates:
  - metadata:
      name: data
    spec:
      storageClassName: local-path # NOTE: This assumes k3s
      accessModes: [ "ReadWriteOnce" ]
      resources:
        requests:
          storage: 10Mi
EOF
set -u

kubectl apply -f $TMPDIR/etcd.yaml
kubectl rollout status --timeout 5m statefulset/etcd
kubectl wait --for=condition=ready pod --selector app.kubernetes.io/name=etcd --timeout 60s
etcd_ip=$(kubectl get svc etcd-client -ojsonpath='{.spec.clusterIP}')

# Install CoreDNS
cat >$TMPDIR/coredns-values.yaml <<EOF
image:
  repository: cgr.dev/chainguard/coredns
  tag: latest
isClusterService: false
servers:
- zones:
  - zone: .
  port: 53
  plugins:
  - name: errors
  - name: health
    configBlock: |-
      lameduck 5s
  - name: ready
  - name: kubernetes
    parameters: cluster.local in-addr.arpa ip6.arpa
    configBlock: |-
      pods insecure
      fallthrough in-addr.arpa ip6.arpa
      ttl 30
  - name: etcd
    parameters: example.org
    configBlock: |-
      stubzones
      path /skydns
      endpoint http://${etcd_ip}:2379
  - name: forward
    parameters: . /etc/resolv.conf
  - name: reload
  - name: loadbalance
EOF
helm repo add coredns https://coredns.github.io/helm
helm upgrade -i coredns coredns/coredns -f $TMPDIR/coredns-values.yaml

# Install External DNS
cat >$TMPDIR/external-dns-values.yaml <<EOF
provider: coredns
logLevel: debug
image:
  repository: ${IMAGE_REGISTRY_REPO}
  tag: ${IMAGE_TAG}
env:
- name: ETCD_URLS
  value: http://${etcd_ip}:2379
EOF
helm repo add external-dns https://kubernetes-sigs.github.io/external-dns/
helm upgrade -i edns external-dns/external-dns -f $TMPDIR/external-dns-values.yaml

kubectl rollout status --timeout 5m deployment/coredns-coredns
kubectl wait --for=condition=ready pod --selector app.kubernetes.io/name=coredns --timeout 120s

kubectl rollout status --timeout 5m deployment/edns-external-dns
kubectl wait --for=condition=ready pod --selector app.kubernetes.io/name=external-dns --timeout 60s

domain="foo.example.org"

# apply the ingress
ingress_class=""
# Try the built-in one, to avoid flakiness as they are up when the cluster is.
for c in nginx traefik; do
  set +e
  ingress_class=$(kubectl get ingressclasses.networking.k8s.io $c -ojsonpath="{.metadata.name}")
done
set -e
# The built-in ones aren't available, just use any other.
if [ -z "$ingress_class" ]; then
  ingress_class=$(kubectl get ingressclasses.networking.k8s.io -ojsonpath="{.metadata.name}" | cut -f1 -d' ')
fi
if [ -z "$ingress_class" ]; then
  echo "Cluster has no ingress class"
  exit 1
else
  echo "Testing using ingressClass=$ingress_class"
fi

cat >$TMPDIR/ingress.yaml <<EOF
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: dummy
spec:
  ingressClassName: ${ingress_class}
  rules:
  - host: ${domain}
    http:
      paths:
      - path: /testpath
        pathType: Prefix
        backend:
          service:
            name: test
            port:
              number: 80
EOF
kubectl apply -f $TMPDIR/ingress.yaml


ingress_ip=""

# There is no kubectl wait for Ingress
for i in {1..10}; do
    echo "Waiting for Ingress..."
    ingress_ip=$(kubectl get ingress dummy -ojsonpath='{.status.loadBalancer.ingress[0].ip}')
    if [ -z "$ingress_ip" ]; then
        sleep 15
    else
        break
    fi
done

if [ -z "$ingress_ip" ]; then
    echo "Ingress does not become Ready"
    exit 1
fi

cleanup_pid() {
	kill -9 $fwd_pid
}
kubectl port-forward svc/coredns-coredns ${FREE_PORT}:53 &
fwd_pid=$!
trap cleanup_pid EXIT

for i in {1..10}; do
  digged=$(dig +short -p ${FREE_PORT} +tcp @localhost "$domain" A || true)

  if [ "$digged" == "$ingress_ip" ]; then
    break
  else
    echo "Record hasn't propagated.. retrying #$i.."
    sleep 5
  fi
done

kill -9 $fwd_pid
[[ "$digged" == "$ingress_ip" ]] || exit 1

#!/usr/bin/env bash

# monopod:tag:k8s

set -o errexit -o nounset -o errtrace -o pipefail -x
set +t

function preflight() {
	if [[ "${IMAGE_REGISTRY}" == "" ]]; then
		echo "Must set IMAGE_REGISTRY environment variable. Exiting."
		exit 1
	fi

	if [[ "${IMAGE_REPOSITORY}" == "" ]]; then
		echo "Must set IMAGE_REPOSITORY environment variable. Exiting."
		exit 1
	fi

	if [[ "${IMAGE_TAG}" == "" ]]; then
		echo "Must set IMAGE_TAG environment variable. Exiting."
		exit 1
	fi
}

preflight

# Install a dev etcd
set +u
cat >etcd.yaml <<EOF
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
        image: quay.io/coreos/etcd:v3.4.2
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
            exec etcd --name \$$HOSTNAME \
              --listen-peer-urls http://0.0.0.0:2380 \
              --listen-client-urls http://0.0.0.0:2379 \
              --advertise-client-urls http://\$$HOSTNAME.etcd:2379 \
              --initial-advertise-peer-urls http://\$$HOSTNAME:2380 \
              --initial-cluster-token etcd-cluster-1 \
              --initial-cluster \$$PEERS \
              --initial-cluster-state new \
              --data-dir /var/run/etcd/default.etcd
  volumeClaimTemplates:
  - metadata:
      name: data
    spec:
      storageClassName: standard
      accessModes: [ "ReadWriteOnce" ]
      resources:
        requests:
          storage: 10Mi
EOF
set -u

kubectl apply -f etcd.yaml

etcd_ip=$(kubectl get svc etcd-client -ojsonpath='{.spec.clusterIP}')

# Install CoreDNS
cat >coredns-values.yaml <<EOF
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
helm install coredns coredns/coredns -f coredns-values.yaml

# Install External DNS
cat >external-dns-values.yaml <<EOF
provider: coredns
logLevel: debug
env:
- name: ETCD_URLS
  value: http://${etcd_ip}:2379
EOF
helm repo add external-dns https://kubernetes-sigs.github.io/external-dns/
helm install edns external-dns/external-dns -f external-dns-values.yaml

sleep 10

kubectl get ingressclass

domain="foo.example.org"

# apply the ingress
cat >ingress.yaml <<EOF
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: dummy
spec:
  ingressClassName: nginx
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
kubectl apply -f ingress.yaml

# TODO: This sucks, but edns doesn't always forward the ingress request fast enough
sleep 20

ing_ip=$(kubectl get ingress dummy -ojsonpath='{.status.loadBalancer.ingress[0].ip}')
kubectl port-forward svc/coredns-coredns 5353:53 &

max_attempts=10
attempt=0
while [[ $attempt -lt $max_attempts ]]; do
	output=$(dig +short -p 5353 +tcp @localhost "$domain" A)

	if [[ -n "$output" ]]; then
		echo "A record found: $output"
		break
	fi

	echo "Attempt $((attempt + 1)): No A record found yet"
	((attempt++))
	sleep 1
done

if [[ $attempt -ge $max_attempts ]]; then
	echo "Maximum number of attempts reached. Unable to find A record for $domain"
	exit 1
fi

digged=$(dig +short -p 5353 +tcp @localhost "$domain" A)
[[ "$digged" == "$ing_ip" ]] || exit 1

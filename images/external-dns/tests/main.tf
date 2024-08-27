terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "target_repository" {}

variable "digest" {
  description = "The image digest to run tests over."
}

locals { parsed = provider::oci::parse(var.digest) }

data "imagetest_inventory" "this" {}

module "cluster_harness" {
  source = "../../../tflib/imagetest/harnesses/k3s/"

  inventory         = data.imagetest_inventory.this
  name              = basename(path.module)
  target_repository = var.target_repository
  cwd               = path.module
}

resource "imagetest_feature" "basic" {
  name        = "basic"
  description = "Basic installation test"
  harness     = module.cluster_harness.harness

  steps = [
    {
      name = "Run tests"
      cmd  = <<EOF
cat <<YAML | kubectl apply -f -
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
YAML

kubectl rollout status --timeout 5m statefulset/etcd
kubectl wait --for=condition=ready pod --selector app.kubernetes.io/name=etcd --timeout 60s
etcd_ip=$(kubectl get svc etcd-client -ojsonpath='{.spec.clusterIP}')

tmp=$(mktemp -d)
cat >$tmp/coredns-values.yaml <<YAML
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
      endpoint http://$etcd_ip:2379
  - name: forward
    parameters: . /etc/resolv.conf
  - name: reload
  - name: loadbalance
YAML

helm repo add coredns https://coredns.github.io/helm
helm upgrade --install coredns coredns/coredns --values $tmp/coredns-values.yaml

# Install External DNS
cat >$tmp/external-dns-values.yaml <<YAML
provider: coredns
logLevel: debug
image:
  repository: ${local.parsed.registry_repo}
  tag: ${local.parsed.pseudo_tag}
env:
- name: ETCD_URLS
  value: http://$etcd_ip:2379
YAML

helm repo add external-dns https://kubernetes-sigs.github.io/external-dns/
helm upgrade --install edns external-dns/external-dns --values $tmp/external-dns-values.yaml

kubectl rollout status --timeout 5m deployment/coredns
kubectl wait --for=condition=ready pod --selector app.kubernetes.io/name=coredns --timeout 120s

kubectl rollout status --timeout 5m deployment/edns-external-dns
kubectl wait --for=condition=ready pod --selector app.kubernetes.io/name=external-dns --timeout 60s

      EOF
    },
    {
      name = "Check A record"
      cmd  = <<EOF
apk add bind-tools

domain="foo.example.org"
ip="42.42.42.42"

# Create an external name service handled by ExternalDNS
kubectl apply -f- <<YAML
kind: Service
apiVersion: v1
metadata:
  name: external-dns-test
  annotations:
    external-dns.alpha.kubernetes.io/hostname: $domain
spec:
  type: ExternalName
  externalName: $ip
YAML

# TODO: Can remove this abstraction and terrible shell/tf escaping once
# imagetest runs tests within the cluster
cat <<YAML | kubectl apply -f -
apiVersion: batch/v1
kind: Job
metadata:
  name: dig-check
spec:
  template:
    spec:
      containers:
      - name: dig
        image: cgr.dev/chainguard/wolfi-base:latest
        command: ["sh", "-c"]
        args:
          - |
            apk add bind-tools
            [ "\$(dig +short +retry=10 +tcp @coredns "$domain" A)" = "$ip" ] || exit 1
      restartPolicy: Never
  backoffLimit: 10
YAML

# Wait for the Job to complete
kubectl wait --for=condition=complete job/dig-check --timeout=120s
      EOF
    },
  ]

  labels = {
    type = "k8s"
  }
}

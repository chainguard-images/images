terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_exec_test" "smoke" {
  digest = var.digest
  script = <<EOF
set -ex

tmp_dir=$(mktemp -d)

cid=$(docker run -d \
  -e ETCD_UNSUPPORTED_ARCH=arm64 \
  $IMAGE_NAME \
  /usr/bin/etcd \
  --name s1 \
  --data-dir /etcd-data \
  --listen-client-urls http://0.0.0.0:2379 \
  --advertise-client-urls http://0.0.0.0:2379 \
  --listen-peer-urls http://0.0.0.0:2380 \
  --initial-advertise-peer-urls http://0.0.0.0:2380 \
  --initial-cluster s1=http://0.0.0.0:2380 \
  --initial-cluster-token tkn \
  --initial-cluster-state new \
  --log-level info \
  --logger zap \
  --log-outputs stderr)

kill() {
  docker rm -f $cid
}

trap kill EXIT

docker exec $cid /usr/bin/etcd --version
docker exec $cid /usr/bin/etcdctl version
docker exec $cid /usr/bin/etcdctl endpoint health
docker exec $cid /usr/bin/etcdctl put foo bar
docker exec $cid /usr/bin/etcdctl get foo
  EOF
}

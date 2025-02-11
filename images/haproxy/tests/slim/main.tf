terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "target_repository" {}


variable "test_repository" {}

variable "digest" {
  description = "The image digest to run tests over."
}

locals { parsed = provider::oci::parse(var.digest) }

data "imagetest_inventory" "this" {}

module "cluster_harness" {
  source = "../../../../tflib/imagetest/harnesses/k3s/"

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
      name = "run nginx and add haproxy configmap"
      cmd  = <<EOF
        while ! kubectl get serviceaccount default; do
            echo "Waiting for default service account"
            sleep 2
        done
        kubectl run nginx -l app=nginx --image ${var.test_repository}/nginx:latest
        kubectl wait --for=condition=Ready pod -l app=nginx --timeout=60s
        kubectl expose pod nginx --port 8080 --target-port 8080 --name=nginx --type=ClusterIP
        EOF
    },
    {
      name = "run it"
      cmd  = <<EOF
        kubectl create configmap haproxy-config --from-file=haproxy.cfg

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
    image: "${local.parsed.registry}/${local.parsed.repo}:${local.parsed.pseudo_tag}"
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
EOF
    },
    {

      name = "curl it"
      cmd  = <<EOF
            kubectl wait --for=condition=Ready pod -l app=haproxy --timeout=60s
            kubectl expose pod haproxy --port 8888 --target-port 8080 --name=haproxy --type=ClusterIP
            kubectl create job curl --image=${var.test_repository}/curl:latest -- curl -sI http://haproxy:8888
        EOF
    },
    {
      name  = "check it"
      cmd   = <<EOF
            kubectl logs job/curl --all-pods |grep "nginx"
        EOF
      retry = { attempts = 3, delay = "5s", factor = 2 }
    }
  ]

  labels = {
    type = "k8s"
  }

  timeouts = {
    # The redis-ha rollout is painfully slow and prone to fruitless polling
    create = "15m"
  }
}

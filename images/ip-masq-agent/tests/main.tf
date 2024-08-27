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

data "oci_exec_test" "has-iptables" {
  digest = var.digest
  script = "docker run --rm --entrypoint iptables $IMAGE_NAME --version"
}

data "oci_exec_test" "has-ip6tables" {
  digest = var.digest
  script = "docker run --rm --entrypoint ip6tables $IMAGE_NAME --version"
}

data "oci_exec_test" "help" {
  digest = var.digest
  script = "docker run --rm $IMAGE_NAME --help"
}

data "oci_exec_test" "check-iptables" {
  digest      = var.digest
  script      = "./check-iptables.sh"
  working_dir = path.module
}

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
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: ip-masq-agent
spec:
  selector:
    matchLabels:
      k8s-app: ip-masq-agent
  template:
    metadata:
      labels:
        k8s-app: ip-masq-agent
    spec:
      hostNetwork: true
      containers:
      - name: ip-masq-agent
        image: "${var.digest}"
        securityContext:
          privileged: false
          capabilities:
            add: ["NET_ADMIN", "NET_RAW"]
        volumeMounts:
          - name: config
            mountPath: /etc/config
      volumes:
        - name: config
          configMap:
            name: ip-masq-agent
            optional: true
            items:
              - key: config
                path: ip-masq-agent
YAML

kubectl rollout status --timeout=5m daemonset/ip-masq-agent
      EOF
    },
  ]

  labels = {
    type = "k8s"
  }
}

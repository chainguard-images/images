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

module "helm" {
  source = "../../../tflib/imagetest/helm"

  name  = "prometheus"
  repo  = "https://prometheus-community.github.io/helm-charts"
  chart = "kube-prometheus-stack"

  values = {
    prometheus = {
      prometheusSpec = {
        image = {
          registry   = local.parsed.registry
          repository = local.parsed.repo
          sha        = trimprefix(local.parsed.digest, "sha256:")
        }
      }
    }
    // Test with our kube-state-metrics, even if its not a fresh build.
    kube-state-metrics = {
      image = {
        registry   = "cgr.dev"
        repository = "chainguard/kube-state-metrics"
        tag        = "latest"
      }
    }
  }
}

resource "imagetest_feature" "basic" {
  name        = "basic"
  description = "Basic installation"
  harness     = module.cluster_harness.harness

  steps = [
    {
      name = "Helm Install"
      cmd  = module.helm.install_cmd
    },
    {
      name = "Ensure we can run a vanilla install"
      cmd  = <<EOF

kubectl apply -f - <<EOm
apiVersion: apps/v1
kind: Deployment
metadata:
  name: prometheus-server
  namespace: default
spec:
  replicas: 1
  selector:
    matchLabels:
      app: prometheus-server
  template:
    metadata:
      labels:
        app: prometheus-server
    spec:
      containers:
        - name: prometheus
          image: ${var.digest}
          ports:
            - containerPort: 9090
          volumeMounts:
            - name: config-volume
              mountPath: /prometheus.yml
              subPath: prometheus.yml
      volumes:
        - name: config-volume
          configMap:
            name: prometheus-server-conf
            defaultMode: 420
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: prometheus-server-conf
  namespace: default
data:
  prometheus.yml: |
    global:
      scrape_interval: 15s
      evaluation_interval: 15s
    scrape_configs:
      - job_name: 'prometheus'
        static_configs:
          - targets: ['localhost:9090']
EOm

kubectl wait --for=condition=available deployment prometheus-server --timeout=120s
      EOF
    },
  ]

  labels = {
    type = "k8s"
  }
}


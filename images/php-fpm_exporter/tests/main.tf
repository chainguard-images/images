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
  description = "Basic test"
  harness     = module.cluster_harness.harness

  steps = [
    {
      name = "Install"
      cmd  = <<EOF
# TODO: Remove this once its fixed in the imagetest provider
until kubectl get sa default; do sleep 1; done

kubectl apply -f - <<YAML
apiVersion: v1
kind: Namespace
metadata:
  name: monitoring
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: prometheus-config
  namespace: monitoring
data:
  prometheus.yml: |
    global:
      scrape_interval: 15s

    scrape_configs:
      - job_name: 'php-fpm'
        static_configs:
          - targets: ['localhost:9103']
---
apiVersion: v1
kind: Service
metadata:
  name: promfooey
  namespace: monitoring
spec:
  selector:
    app: promfooey
  ports:
    - name: prometheus
      protocol: TCP
      port: 9090
      targetPort: 9090
---
apiVersion: v1
kind: Pod
metadata:
  name: promfooey
  namespace: monitoring
  labels:
    app: promfooey
spec:
  containers:
    - name: php-fpm-exporter
      image: ${local.parsed.registry_repo}:${local.parsed.pseudo_tag}
      args: ["--phpfpm.scrape-uri=http://127.0.0.1:9000/status"]
      ports:
        - containerPort: 9103
    - name: prometheus
      image: cgr.dev/chainguard/prometheus:latest
      args: ["--config.file=/etc/prometheus/prometheus.yml"]
      volumeMounts:
        - name: prometheus-config-volume
          mountPath: /etc/prometheus/prometheus.yml
          subPath: prometheus.yml
        - name: data
          mountPath: /data
      ports:
        - containerPort: 9090
  volumes:
    - name: prometheus-config-volume
      configMap:
        name: prometheus-config
    - name: data
      emptyDir:
        sizeLimit: 200Mi
---
apiVersion: batch/v1
kind: Job
metadata:
  name: test
  namespace: monitoring
spec:
  backoffLimit: 5
  template:
    spec:
      containers:
        - name: test-container
          image: cgr.dev/chainguard/curl:latest-dev
          command: ["sh", "-c", "curl -s http://promfooey.monitoring.svc.cluster.local:9090/api/v1/targets | grep '\"job\":\"php-fpm\"'"]
      restartPolicy: Never
YAML
    EOF
    },
    {
      name  = "Run tests"
      cmd   = <<EOF
kubectl wait --for=condition=complete --timeout=60s job/test -n monitoring
      EOF
      retry = { attempts = 5, delay = "15s" }
    },
  ]

  labels = {
    type = "k8s"
  }
}

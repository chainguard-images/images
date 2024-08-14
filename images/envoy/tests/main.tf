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
      name = "Install and tickle"
      cmd  = <<EOF
kubectl create ns envoy-static

cat <<YAML | kubectl apply -f -
apiVersion: v1
kind: ConfigMap
metadata:
  name: envoy-config
  namespace: envoy-static
data:
  static.yaml: |
    static_resources:
      listeners:
      - name: listener_0
        address:
          socket_address:
            address: 0.0.0.0
            port_value: 8080
        filter_chains:
        - filters:
          - name: envoy.filters.network.http_connection_manager
            typed_config:
              "@type": type.googleapis.com/envoy.extensions.filters.network.http_connection_manager.v3.HttpConnectionManager
              stat_prefix: edge
              http_filters:
              - name: envoy.filters.http.router
                typed_config:
                  "@type": type.googleapis.com/envoy.extensions.filters.http.router.v3.Router
              route_config:
                virtual_hosts:
                - name: direct_response_service
                  domains: ["*"]
                  routes:
                  - match:
                      prefix: "/test-envoy-static"
                    direct_response:
                      status: 200
                      body:
                        inline_string: |
                          Yes it's working
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: envoy
  namespace: envoy-static
spec:
  selector:
    matchLabels:
      app: envoy
  template:
    metadata:
      labels:
        app: envoy
    spec:
      containers:
      - name: envoy
        image: ${var.digest}
        args:
          - "--config-path"
          - "/etc/envoy-config/static.yaml"
        ports:
        - containerPort: 8080
        readinessProbe:
          httpGet:
            port: 8080
            path: /test-envoy-static
        volumeMounts:
        - name: envoy-config
          mountPath: /etc/envoy-config
      volumes:
      - name: envoy-config
        configMap:
          name: envoy-config
YAML

kubectl rollout status deployment -n envoy-static envoy --timeout=5m
      EOF
    },
  ]

  labels = {
    type = "k8s"
  }
}

terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.11.0"
    }
  }
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "kind-kind"
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" { input = var.digest }

data "oci_exec_test" "test" {
  for_each = toset(fileset(path.module, "*.sh"))

  digest = var.digest
  script = "${path.module}/${each.value}"
}

resource "kubernetes_manifest" "prerequisites" {
  for_each = fileset(path.module, "manifests/*.yaml")
  manifest = yamldecode(file("${path.module}/${each.value}"))
}

# resource "kubectl_manifest" "stateful_set" {
#   depends_on = [kubernetes_manifest.prerequisites]
#   yaml_body = templatefile("${path.module}/manifests/cassandra-stateful-set.yaml.tpl",
#     {
#       cassandra_tag  = data.oci_string.ref.pseudo_tag
#       cassandra_repo = data.oci_string.ref.registry_repo
#   })
# }

resource "kubernetes_stateful_set" "cassandra" {
  depends_on = [kubernetes_manifest.prerequisites]
  metadata {
    name      = "cassandra"
    namespace = "cassandra"

    labels = {
      app = "cassandra"
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = "cassandra"
      }
    }

    template {
      metadata {
        labels = {
          app = "cassandra"
        }
      }

      spec {
        container {
          name  = "cassandra"
          image = "${data.oci_string.ref.registry_repo}/${data.oci_string.ref.pseudo_tag}"

          port {
            name           = "intra-node"
            container_port = 7000
          }

          port {
            name           = "tls-intra-node"
            container_port = 7001
          }

          port {
            name           = "jmx"
            container_port = 7199
          }

          port {
            name           = "cql"
            container_port = 9042
          }

          env {
            name  = "MAX_HEAP_SIZE"
            value = "512M"
          }

          env {
            name  = "HEAP_NEWSIZE"
            value = "100M"
          }

          env {
            name  = "CASSANDRA_SEEDS"
            value = "cassandra-0.cassandra.default.svc.cluster.local"
          }

          env {
            name  = "CASSANDRA_CLUSTER_NAME"
            value = "K8Demo"
          }

          env {
            name  = "CASSANDRA_DC"
            value = "DC1-K8Demo"
          }

          env {
            name  = "CASSANDRA_RACK"
            value = "Rack1-K8Demo"
          }

          env {
            name = "POD_IP"

            value_from {
              field_ref {
                field_path = "status.podIP"
              }
            }
          }

          resources {
            limits = {
              cpu = "500m"

              memory = "1Gi"
            }

            requests = {
              cpu = "500m"

              memory = "1Gi"
            }
          }

          readiness_probe {
            exec {
              command = ["/bin/bash", "-c", "/ready-probe.sh"]
            }

            initial_delay_seconds = 15
            timeout_seconds       = 5
          }

          lifecycle {
            pre_stop {
              exec {
                command = ["/bin/sh", "-c", "nodetool drain"]
              }
            }
          }

          image_pull_policy = "Always"

          security_context {
            capabilities {
              add = ["IPC_LOCK"]
            }
          }
        }

        termination_grace_period_seconds = 1800
      }
    }

    service_name = "cassandra"
  }
}

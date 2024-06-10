terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.28.1"
    }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

locals { parsed = provider::oci::parse(var.digest) }

resource "random_pet" "suffix" {}

resource "kubernetes_namespace" "cassandra" {
  metadata {
    name = "cassandra-${random_pet.suffix.id}"
  }
}

resource "kubernetes_service" "cassandra" {
  metadata {
    name      = "cassandra"
    namespace = kubernetes_namespace.cassandra.metadata[0].name

    labels = {
      app = "cassandra"
    }
  }

  spec {
    port {
      port = 9042
    }

    selector = {
      app = "cassandra"
    }

    cluster_ip = "None"
  }
}

resource "kubernetes_stateful_set" "cassandra" {
  metadata {
    name      = "cassandra"
    namespace = kubernetes_namespace.cassandra.metadata[0].name

    labels = {
      app = "cassandra"
    }
  }

  spec {
    replicas = 1

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
          image = "${local.parsed.registry_repo}:${local.parsed.pseudo_tag}"

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

          volume_mount {
            name       = "cassandra-data"
            mount_path = "/cassandra_data"
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

    volume_claim_template {
      metadata {
        name = "cassandra-data"
      }

      spec {
        access_modes = ["ReadWriteOnce"]

        resources {
          requests = {
            storage = "1Gi"
          }
        }

        storage_class_name = "local-path" # Assumes K3s, use standard for KinD
      }
    }

    service_name = kubernetes_service.cassandra.metadata[0].name
  }
}


data "imagetest_inventory" "this" {}

resource "imagetest_harness_docker" "docker" {
  name      = "cassandra"
  inventory = data.imagetest_inventory.this

  mounts = [{
    source      = path.module
    destination = "/tests"
  }]

  envs = {
    IMAGE_NAME : var.digest
  }
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_docker.docker
  name        = "Basic"
  description = "Run Cassandra functionality tests."

  steps = [
    {
      name = "Cassandra tests"
      cmd  = "/tests/run-tests.sh"
    }
  ]
}

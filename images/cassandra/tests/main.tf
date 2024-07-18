terraform {
  required_providers {
    imagetest  = { source = "chainguard-dev/imagetest" }
    kubernetes = { source = "hashicorp/kubernetes" }
    oci        = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

locals {
  parsed = provider::oci::parse(var.digest)
}

resource "random_pet" "suffix" {
}

resource "kubernetes_namespace" "cassandra" {
  metadata {
    name = "cassandra-${random_pet.suffix.id}"
  }
}

resource "kubernetes_service" "cassandra" {
  metadata {
    labels = {
      app = "cassandra"
    }
    name      = "cassandra"
    namespace = kubernetes_namespace.cassandra.metadata[0].name
  }
  spec {
    cluster_ip = "None"
    selector = {
      app = "cassandra"
    }
    port {
      port = 9042
    }
  }
}

resource "kubernetes_stateful_set" "cassandra" {
  metadata {
    labels = {
      app = "cassandra"
    }
    name      = "cassandra"
    namespace = kubernetes_namespace.cassandra.metadata[0].name
  }
  spec {
    replicas     = 1
    service_name = kubernetes_service.cassandra.metadata[0].name
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
        termination_grace_period_seconds = 1800
        container {
          image             = "${local.parsed.registry_repo}:${local.parsed.pseudo_tag}"
          image_pull_policy = "Always"
          name              = "cassandra"
          port {
            container_port = 7000
            name           = "intra-node"
          }
          port {
            container_port = 7001
            name           = "tls-intra-node"
          }
          port {
            container_port = 7199
            name           = "jmx"
          }
          port {
            container_port = 9042
            name           = "cql"
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
            mount_path = "/cassandra_data"
            name       = "cassandra-data"
          }
          lifecycle {
            pre_stop {
              exec {
                command = ["/bin/sh", "-c", "nodetool drain"]
              }
            }
          }
          security_context {
            capabilities {
              add = ["IPC_LOCK"]
            }
          }
        }
      }
    }
    volume_claim_template {
      metadata {
        name = "cassandra-data"
      }
      spec {
        access_modes       = ["ReadWriteOnce"]
        storage_class_name = "local-path"
        resources {
          requests = {
            storage = "1Gi"
          }
        }
      }
    }
  }
}

data "imagetest_inventory" "this" {
}

resource "imagetest_harness_docker" "docker" {
  envs = {
    IMAGE_NAME : var.digest
  }
  inventory = data.imagetest_inventory.this
  mounts = [{
    source      = path.module
    destination = "/tests"
  }]
  name = "cassandra"
}

resource "imagetest_feature" "basic" {
  description = "Run Cassandra functionality tests."
  harness     = imagetest_harness_docker.docker
  name        = "Basic"
  steps = [
    {
      name = "Cassandra tests"
      cmd  = "/tests/run-tests.sh"
    }
  ]
}


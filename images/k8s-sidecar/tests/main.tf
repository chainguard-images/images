terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

resource "kubernetes_config_map_v1" "sample" {
  metadata {
    name = "sample-configmap"
    labels = {
      findme : "yea"
    }
  }
  data = {
    "hello.world" = <<EOF
    Hello World!
    EOF
  }
}

resource "kubernetes_config_map_v1" "sample-url" {
  metadata {
    name = "sample-configmap-from-url"
    labels = {
      findme = "yea"
    }
  }
  data = {
    "nginx-ingress.json.url" = "https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/grafana/dashboards/nginx.json"
  }
}

resource "kubernetes_secret_v1" "sample" {
  metadata {
    name = "sample-secret"
    labels = {
      findme = "yea"
    }
  }

  type = "Opaque"
  data = {
    # base64 encoded: my super cool \n multiline \ secret
    "secret.world" = "bXkgc3VwZXIgY29vbAptdWx0aWxpbmUKc2VjcmV0"
  }
}

resource "kubernetes_cluster_role" "sample" {
  metadata {
    name = "sample-role"
  }
  rule {
    api_groups = [""]
    resources  = ["configmaps", "secrets"]
    verbs      = ["get", "watch", "list"]
  }
}

resource "kubernetes_service_account_v1" "sample" {
  metadata {
    name = "sample-acc"
  }
}

resource "kubernetes_cluster_role_binding_v1" "sample" {
  metadata {
    name = "sample-rolebind"
  }
  role_ref {
    kind      = "ClusterRole"
    name      = "sample-role"
    api_group = "rbac.authorization.k8s.io"
  }
  subject {
    kind      = "ServiceAccount"
    name      = "sample-acc"
    namespace = "default"
  }
}

resource "kubernetes_deployment_v1" "sample" {
  metadata {
    name = "sample-deployment"
    labels = {
      app = "sample"
    }
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "sample"
      }
    }
    template {
      metadata {
        labels = {
          app = "sample"
        }
      }
      spec {
        service_account_name = kubernetes_service_account_v1.sample.metadata[0].name
        container {
          name    = "busybox"
          image   = "cgr.dev/chainguard/busybox:latest"
          command = ["watch"]
          args    = ["ls", "/tmp"]
          volume_mount {
            name       = "shared-volume"
            mount_path = "/tmp/"
          }
        }
        container {
          name  = "sidecar"
          image = var.digest
          volume_mount {
            name       = "shared-volume"
            mount_path = "/tmp/"
          }
          env {
            name  = "LABEL"
            value = "findme"
          }
          env {
            name  = "FOLDER"
            value = "/tmp/"
          }
          env {
            name  = "RESOURCE"
            value = "both"
          }
        }
        volume {
          name = "shared-volume"
          empty_dir {}
        }
      }
    }
  }

  wait_for_rollout = true
}

terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" {
  input = var.digest
}

resource "kubernetes_manifest" "sa" {
  manifest = {
    "apiVersion" = "v1"
    "kind"       = "ServiceAccount"
    "metadata" = {
      "labels" = {
        "addonmanager.kubernetes.io/mode" = "Reconcile"
        "kubernetes.io/cluster-service"   = "true"
      }
      "name"      = "node-local-dns"
      "namespace" = "kube-system"
    }
  }
}

resource "kubernetes_manifest" "svc" {
  manifest = {
    "apiVersion" = "v1"
    "kind"       = "Service"
    "metadata" = {
      "labels" = {
        "addonmanager.kubernetes.io/mode" = "Reconcile"
        "k8s-app"                         = "kube-dns"
        "kubernetes.io/cluster-service"   = "true"
        "kubernetes.io/name"              = "KubeDNSUpstream"
      }
      "name"      = "kube-dns-upstream"
      "namespace" = "kube-system"
    }
    "spec" = {
      "ports" = [
        {
          "name"       = "dns"
          "port"       = 53
          "protocol"   = "UDP"
          "targetPort" = 53
        },
        {
          "name"       = "dns-tcp"
          "port"       = 53
          "protocol"   = "TCP"
          "targetPort" = 53
        },
      ]
      "selector" = {
        "k8s-app" = "kube-dns"
      }
    }
  }
}

# kubectl get svc kube-dns -n kube-system -o jsonpath={.spec.clusterIP}
data "kubernetes_service" "kube-dns" {
  metadata {
    name      = "kube-dns"
    namespace = "kube-system"
  }
}

resource "kubernetes_manifest" "cm" {
  manifest = {
    "apiVersion" = "v1"
    "data" = {
      "Corefile" = <<-EOT
    cluster.local:53 {
        errors
        cache {
                success 9984 30
                denial 9984 5
        }
        reload
        loop
        bind 169.254.20.10 ${data.kubernetes_service.kube-dns.spec[0].cluster_ip}
        forward . ${data.kubernetes_service.kube-dns.spec[0].cluster_ip} {
                force_tcp
        }
        prometheus :9253
        health 169.254.20.10:8093
        }
    in-addr.arpa:53 {
        errors
        cache 30
        reload
        loop
        bind 169.254.20.10 ${data.kubernetes_service.kube-dns.spec[0].cluster_ip}
        forward . ${data.kubernetes_service.kube-dns.spec[0].cluster_ip} {
                force_tcp
        }
        prometheus :9253
        }
    ip6.arpa:53 {
        errors
        cache 30
        reload
        loop
        bind 169.254.20.10 ${data.kubernetes_service.kube-dns.spec[0].cluster_ip}
        forward . ${data.kubernetes_service.kube-dns.spec[0].cluster_ip} {
                force_tcp
        }
        prometheus :9253
        }
    .:53 {
        errors
        cache 30
        reload
        loop
        bind 169.254.20.10 ${data.kubernetes_service.kube-dns.spec[0].cluster_ip}
        forward . ${data.kubernetes_service.kube-dns.spec[0].cluster_ip}
        prometheus :9253
        }
    
    EOT
    }
    "kind" = "ConfigMap"
    "metadata" = {
      "labels" = {
        "addonmanager.kubernetes.io/mode" = "Reconcile"
      }
      "name"      = "node-local-dns"
      "namespace" = "kube-system"
    }
  }
}

resource "kubernetes_daemon_set_v1" "ds" {
  metadata {
    name      = "node-local-dns"
    namespace = "kube-system"
    labels = {
      "addonmanager.kubernetes.io/mode" = "Reconcile"
      "k8s-app"                         = "node-local-dns"
      "kubernetes.io/cluster-service"   = "true"
    }
  }

  spec {
    selector {
      match_labels = {
        "k8s-app" = "node-local-dns"
      }
    }
    template {
      metadata {
        annotations = {
          "prometheus.io/port"   = "9253"
          "prometheus.io/scrape" = "true"
        }
        labels = {
          "k8s-app" = "node-local-dns"
        }
      }
      spec {
        container {
          name  = "node-cache"
          image = data.oci_string.ref.id
          args = [
            "-localip",
            "169.254.20.10,${data.kubernetes_service.kube-dns.spec[0].cluster_ip}",
            "-conf",
            "/etc/Corefile",
            "-upstreamsvc",
            "kube-dns-upstream",
          ]
          port {
            name           = "dns"
            container_port = 53
            host_port      = 53
            protocol       = "UDP"
          }
          port {
            name           = "dns-tcp"
            container_port = 53
            host_port      = 53
            protocol       = "TCP"
          }
          port {
            name           = "metrics"
            container_port = 9253
            host_port      = 9253
            protocol       = "TCP"
          }
          resources {
            requests = {
              "cpu"    = "25m"
              "memory" = "5Mi"
            }
          }
          security_context {
            capabilities {
              add = ["NET_ADMIN"]
            }
          }
          liveness_probe {
            http_get {
              host = data.kubernetes_service.kube-dns.spec[0].cluster_ip
              path = "/health"
              port = 8080
            }
            initial_delay_seconds = 60
            timeout_seconds       = 5
          }
          volume_mount {
            name       = "xtables-lock"
            mount_path = "/run/xtables.lock"
          }
          volume_mount {
            name       = "config-volume"
            mount_path = "/etc/coredns"
          }
          volume_mount {
            name       = "kube-dns-config"
            mount_path = "/etc/kube-dns"
          }
        }
        service_account_name = "node-local-dns"
        priority_class_name  = "system-node-critical"
        dns_policy           = "Default"
        host_network         = true
        toleration {
          key      = "CriticalAddonsOnly"
          operator = "Exists"
        }
        toleration {
          effect   = "NoExecute"
          operator = "Exists"
        }
        toleration {
          effect   = "NoSchedule"
          operator = "Exists"
        }
        volume {
          name = "xtables-lock"
          host_path {
            path = "/run/xtables.lock"
            type = "FileOrCreate"
          }
        }
        volume {
          name = "kube-dns-config"
          config_map {
            name     = "kube-dns"
            optional = true
          }
        }
        volume {
          name = "config-volume"
          config_map {
            name = "node-local-dns"
            items {
              key  = "Corefile"
              path = "Corefile.base"
            }
          }
        }
      }
    }
  }

  wait_for_rollout = true
}

resource "kubernetes_manifest" "svc-headless" {
  manifest = {
    "apiVersion" = "v1"
    "kind"       = "Service"
    "metadata" = {
      "annotations" = {
        "prometheus.io/port"   = "9253"
        "prometheus.io/scrape" = "true"
      }
      "labels" = {
        "k8s-app" = "node-local-dns"
      }
      "name"      = "node-local-dns"
      "namespace" = "kube-system"
    }
    "spec" = {
      "clusterIP" = "None"
      "ports" = [
        {
          "name"       = "metrics"
          "port"       = 9253
          "targetPort" = 9253
        },
      ]
      "selector" = {
        "k8s-app" = "node-local-dns"
      }
    }
  }
}

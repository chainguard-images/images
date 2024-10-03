terraform {
  required_providers {
    imagetest = { source = "chainguard-dev/imagetest" }
    oci       = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

locals {
  parsed = provider::oci::parse(var.digest)
}

data "imagetest_inventory" "this" {
}

resource "imagetest_harness_k3s" "k3s" {
  inventory = data.imagetest_inventory.this
  name      = "gitlab-exporter-k3s"
  resources = {
    cpu = {
      request = "7"
    }
    memory = {
      request = "16Gi"
    }
  }
  sandbox = {
    mounts = [
      {
        source      = path.module
        destination = "/tests"
      }
    ]
  }
}

module "helm" {
  chart   = "gitlab"
  name    = "gitlab"
  repo    = "https://charts.gitlab.io"
  source  = "../../../tflib/imagetest/helm"
  timeout = "45m"
  values = {
    create_namespace = false
    global = {
      upgradeCheck = {
        enabled = false
      }
      hosts = {
        domain     = "default.cluster.local"
        https      = false
        externalIP = "10.0.0.1"
        gitlab = {
          serviceName = "webservice"
        }
        registry = {
          serviceName = "registry"
        }
        minio = {
          serviceName = "minio"
        }
      }
      ingress = {
        configureCertmanager = false
        tls = {
          enabled = false
        }
      }
      shell = {
        port = 32022
      }
      gitlab = {
        hostnameOverride = "gitlab.cluster.local"
      }
    }
    certmanager = {
      install = false
    }
    gitlab-runner = {
      install = false
    }
    gitlab = {
      gitlab-root-password = {
        secret = "P@ssw3rd"
      }
      kas = {
        minReplicas = 1
        maxReplicas = 1
      }
      webservice = {
        minReplicas = 1
        maxReplicas = 1
      }
      gitlab-shell = {
        minReplicas = 1
        maxReplicas = 1
      }
      gitlab-exporter = {
        image = {
          tag        = local.parsed.pseudo_tag
          repository = local.parsed.registry_repo
        }
        minReplicas = 1
        maxReplicas = 1
      }
      gitlab-runner = {
        install = false
      }
    }
    nginx-ingress = {
      controller = {
        replicaCount  = 1
        minAavailable = 1
        service = {
          type = "NodePort"
          nodePorts = {
            gitlab-shell = 32022
            http         = 32080
          }
        }
      }
    }
    prometheus = {
      install = false
    }
    redis = {
      # Expose Redis metrics for the exporter
      metrics = {
        enabled = true
      }
    }
    psql = {
      metrics = {
        enabled = false
      }
    }
    registry = {
      hpa = {
        minReplicas = 1
        maxReplicas = 1
      }
    }
  }
}

resource "imagetest_feature" "k3s" {
  description = "Functional tests for GitLab exporter"
  harness     = imagetest_harness_k3s.k3s
  labels = {
    type = "k8s"
    # Group this image into a gitlab only shard
    "shard::group" = "gitlab"
  }
  name = "GitLab-Exporter Test"
  steps = [
    {
      name = "Create Secret"
      cmd  = <<EOF
        kubectl create secret generic gitlab-gitlab-initial-root-password --from-literal=password='P@ssw3rd'
      EOF
    },
    {
      name = "Helm installation script"
      cmd  = module.helm.install_cmd
    },
    {
      name  = "Wait for gitlab to be ready"
      cmd   = <<EOF
        kubectl rollout status deployment/gitlab-gitlab-exporter
        kubectl wait --for=condition=available --timeout=600s deployment gitlab-webservice-default
      EOF
      retry = { attempts = 5, delay = "15s", factor = 3 }
    },
    {
      name = "Expose gitlab-exporter Service"
      cmd  = <<-EOF
        kubectl expose deployment gitlab-gitlab-exporter --type=NodePort --name=gitlab-exporter-service --port=9168
      EOF
    },
    {
      name = "Wait for gitlab-exporter to be accessible"
      cmd  = "sleep 10"
    },
    {
      name = "Install required packages",
      cmd  = "apk add curl"
    },
    {
      name = "Test and Validate gitlab-exporter Metrics"
      cmd  = "./tests/test_gitlab_exporter.sh"
    }
  ]
  timeouts = {
    create = "45m"
  }
}


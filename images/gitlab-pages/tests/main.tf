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
  name      = "gitlab-pages-k3s"
  resources = {
    cpu = {
      request = "8Gi"
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
  timeout = "20m"
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
        enabled = false
      }
      gitlab-pages = {
        image = {
          tag        = local.parsed.pseudo_tag
          repository = local.parsed.registry_repo
        }
        resources = {
          requests = {
            memory = "250M"
            cpu    = "50m"
          }
        }
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
      metrics = {
        enabled = false
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
  description = "Basic functionality of GitLab pages"
  harness     = imagetest_harness_k3s.k3s
  labels = {
    type = "k8s"
  }
  name = "Basic"
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
        kubectl rollout status deployment/gitlab-gitlab-pages
        kubectl wait --for=condition=available --timeout=600s deployment gitlab-webservice-default
      EOF
      retry = { attempts = 5, delay = "15s", factor = 3 }
    }
  ]
  timeouts = {
    create = "20m"
  }
}


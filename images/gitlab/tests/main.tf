terraform {
  required_providers {
    imagetest = { source = "chainguard-dev/imagetest" }
    oci       = { source = "chainguard-dev/oci" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    kas   = string
    pages = string
    shell = string
    #exporter = string
  })
}

locals { parsed = { for k, v in var.digests : k => provider::oci::parse(v) } }

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "workhorse-k3s"
  inventory = data.imagetest_inventory.this

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
  source = "../../../tflib/imagetest/helm"

  name    = "gitlab"
  repo    = "https://charts.gitlab.io"
  chart   = "gitlab"
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

      webservice = {
        minReplicas = 1
        maxReplicas = 1
      }
      kas = {
        image = {
          tag        = local.parsed["kas"].pseudo_tag
          repository = local.parsed["kas"].registry_repo
        }
        minReplicas = 1
        maxReplicas = 1
      }
      gitlab-exporter = {
        #image = {
        #tag        = local.parsed["exporter"].pseudo_tag
        #repository = local.parsed["exporter"].registry_repo
        #}
        #extraEnv = {
        #CONFIG_FILENAME = "gitlab-exporter.yml"
        #}
        enabled = false
      }
      gitlab-shell = {
        image = {
          tag        = local.parsed["shell"].pseudo_tag
          repository = local.parsed["shell"].registry_repo
        }
        minReplicas = 1
        maxReplicas = 1
      }
      gitlab-pages = {
        image = {
          tag        = local.parsed["pages"].pseudo_tag
          repository = local.parsed["pages"].registry_repo
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
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of gitlab-workhorse"

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
        kubectl rollout status deployment/gitlab-kas
        #kubectl rollout status deployment/gitlab-gitlab-exporter
        kubectl rollout status deployment/gitlab-gitlab-pages
        kubectl rollout status deployment/gitlab-gitlab-shell
        kubectl wait --for=condition=available --timeout=600s deployment gitlab-webservice-default
      EOF
      retry = { attempts = 5, delay = "15s", factor = 3 }
    },
  ]

  labels = {
    type = "k8s"
  }

  timeouts = {
    create = "20m"
  }
}

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

resource "imagetest_harness_k3s" "this" {
  inventory = data.imagetest_inventory.this
  name      = "gitlab-shell"
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
    envs = {
      IMAGE_NAME : "${local.parsed.registry_repo}@${local.parsed.digest}"
    }
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

      webservice = {
        minReplicas = 1
        maxReplicas = 1
      }
      gitlab-shell = {
        minReplicas = 1
        maxReplicas = 1
        image = {
          repository = local.parsed.registry_repo
          tag        = local.parsed.pseudo_tag
        }
        # these work with FIPS 140-2, hopefully there's a compatible
        # combination that also works with newer clients/servers
        config = {
          ciphers             = ["aes128-ctr", "aes192-ctr", "aes256-ctr"]
          kexAlgorithms       = ["ecdh-sha2-nistp384", "ecdh-sha2-nistp521"]
          macs                = ["hmac-sha2-256", "hmac-sha2-512"]
          publicKeyAlgorithms = ["ssh-rsa", "ecdsa-sha2-nistp256", "ecdsa-sha2-nistp384", "ecdsa-sha2-nistp521"]
        }
      }
      gitlab-exporter = {
        enabled = false
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
  description = "Basic functionality of gitlab-shell"
  harness     = imagetest_harness_k3s.this
  labels = {
    type = "k8s"
    # Group this image into a gitlab only shard
    "shard::group" = "gitlab"
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
      cmd   = "kubectl wait --for=condition=available --timeout=600s deployment gitlab-gitlab-shell"
      retry = { attempts = 5, delay = "15s", factor = 3 }
    },
    {
      name = "apk add"
      cmd  = "apk add curl openssh jq"
    },
    {
      name = "Run tests"
      cmd  = "./tests/gitlab-shell-test.sh"
    },
  ]
  timeouts = {
    create = "45m"
  }
}


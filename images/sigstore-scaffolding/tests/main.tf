terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "target_repository" {}

variable "scaffolding-images" {
  description = "The image digests to run tests over."
  type = object({
    cloudsqlproxy        = string
    ctlog-createctconfig = string
    ctlog-managectroots  = string
    ctlog-verifyfulcio   = string
    fulcio-createcerts   = string
    getoidctoken         = string
    rekor-createsecret   = string
    trillian-createdb    = string
    trillian-createtree  = string
    trillian-updatetree  = string
    tsa-createcertchain  = string
    tuf-createsecret     = string
    tuf-server           = string
  })

  default = {
    cloudsqlproxy        = "cgr.dev/chainguard/sigstore-scaffolding-cloudsqlproxy:latest"
    ctlog-createctconfig = "cgr.dev/chainguard/sigstore-scaffolding-ctlog-createctconfig:latest"
    ctlog-managectroots  = "cgr.dev/chainguard/sigstore-scaffolding-ctlog-managectroots:latest"
    ctlog-verifyfulcio   = "cgr.dev/chainguard/sigstore-scaffolding-ctlog-verifyfulcio:latest"
    fulcio-createcerts   = "cgr.dev/chainguard/sigstore-scaffolding-fulcio-createcerts:latest"
    getoidctoken         = "cgr.dev/chainguard/sigstore-scaffolding-getoidctoken:latest"
    rekor-createsecret   = "cgr.dev/chainguard/sigstore-scaffolding-rekor-createsecret:latest"
    trillian-createdb    = "cgr.dev/chainguard/sigstore-scaffolding-trillian-createdb:latest"
    trillian-createtree  = "cgr.dev/chainguard/sigstore-scaffolding-trillian-createtree:latest"
    trillian-updatetree  = "cgr.dev/chainguard/sigstore-scaffolding-trillian-updatetree:latest"
    tsa-createcertchain  = "cgr.dev/chainguard/sigstore-scaffolding-tsa-createcertchain:latest"
    tuf-createsecret     = "cgr.dev/chainguard/sigstore-scaffolding-tuf-createsecret:latest"
    tuf-server           = "cgr.dev/chainguard/sigstore-scaffolding-tuf-server:latest"
  }
}

variable "support-images" {
  description = "The image digests to run tests over."
  type = object({
    curl   = string
    mysql  = string
    netcat = string
    redis  = string
  })

  default = {
    curl   = "cgr.dev/chainguard/curl:latest-dev"
    mysql  = "gcr.io/trillian-opensource-ci/db_server:v1.5.2"
    netcat = "cgr.dev/chainguard/netcat:latest"
    redis  = "cgr.dev/chainguard/redis:latest"
  }
}

variable "rekor-images" {
  description = "The image digests to run tests over."
  type = object({
    rekor-server   = string
    rekor-cli      = string
    backfill-redis = string
  })

  default = {
    rekor-server   = "cgr.dev/chainguard/rekor-server:latest"
    rekor-cli      = "cgr.dev/chainguard/rekor-cli:latest"
    backfill-redis = "cgr.dev/chainguard/rekor-backfill-redis:latest"
  }
}

variable "trillian-images" {
  description = "The image digests to run tests over."
  type = object({
    logserver = string
    logsigner = string
  })

  default = {
    logserver = "cgr.dev/chainguard/trillian-logserver:latest"
    logsigner = "cgr.dev/chainguard/trillian-logsigner:latest"
  }
}

variable "tsa-server" {
  description = "The TSA image to use in testing"
  type        = string
  default     = "cgr.dev/chainguard/timestamp-authority-server"
}

variable "ctlog-server" {
  description = "The image digests to run tests over."
  type        = string
  default     = "cgr.dev/chainguard/ctlog-trillian-ctserver:latest"
}

variable "fulcio-server" {
  description = "The image digests to run tests over."
  type        = string
  default     = "cgr.dev/chainguard/fulcio:latest"
}

variable "cosign-cli" {
  description = "The image digests to run tests over."
  type        = string
  default     = "cgr.dev/chainguard/cosign:latest"
}

locals {
  all-images = merge(var.scaffolding-images, var.support-images, var.rekor-images, var.trillian-images, { "ctlog-server" : var.ctlog-server }, { "fulcio-server" : var.fulcio-server }, { "cosign-cli" : var.cosign-cli }, { "tsa-server" : var.tsa-server })
  fetched    = { for k, v in local.all-images : k => provider::oci::get(v) }
  parsed     = { for k, v in local.fetched : k => provider::oci::parse(v.full_ref) }
}

data "imagetest_inventory" "this" {}

module "cluster_harness" {
  source = "../../../tflib/imagetest/harnesses/k3s/"

  inventory         = data.imagetest_inventory.this
  name              = basename(path.module)
  target_repository = var.target_repository
  cwd               = path.module
}

module "helm" {
  source = "../../../tflib/imagetest/helm"

  repo    = "https://sigstore.github.io/helm-charts"
  chart   = "scaffold"
  timeout = "10m"

  values = {
    fulcio = {
      server = {
        image = {
          registry   = local.parsed["fulcio-server"].registry
          repository = local.parsed["fulcio-server"].repo
          version    = local.parsed["fulcio-server"].digest
        }
        ingress = {
          http = {
            enabled = false
          }
        }
      }
      createcerts = {
        image = {
          registry   = local.parsed["fulcio-createcerts"].registry
          repository = local.parsed["fulcio-createcerts"].repo
          version    = local.parsed["fulcio-createcerts"].digest
        }
      }
    }

    ctlog = {
      createctconfig = {
        image = {
          registry   = local.parsed["ctlog-createctconfig"].registry
          repository = local.parsed["ctlog-createctconfig"].repo
          version    = local.parsed["ctlog-createctconfig"].digest
        }
        initContainerImage = {
          curl = {
            registry   = local.parsed["curl"].registry
            repository = local.parsed["curl"].repo
            version    = local.parsed["curl"].digest
          }
        }
      }
      createtree = {
        image = {
          registry   = local.parsed["trillian-createtree"].registry
          repository = local.parsed["trillian-createtree"].repo
          version    = local.parsed["trillian-createtree"].digest
        }
      }
      server = {
        image = {
          registry   = local.parsed["ctlog-server"].registry
          repository = local.parsed["ctlog-server"].repo
          version    = local.parsed["ctlog-server"].digest
        }
      }
    }

    rekor = {
      initContainerImage = {
        curl = {
          registry   = local.parsed["curl"].registry
          repository = local.parsed["curl"].repo
          version    = local.parsed["curl"].digest
        }
      }
      backfillredis = {
        image = {
          registry   = local.parsed["backfill-redis"].registry
          repository = local.parsed["backfill-redis"].repo
          version    = local.parsed["backfill-redis"].digest
        }
      }
      createtree = {
        image = {
          registry   = local.parsed["trillian-createtree"].registry
          repository = local.parsed["trillian-createtree"].repo
          version    = local.parsed["trillian-createtree"].digest
        }
      }
      server = {
        image = {
          registry   = local.parsed["rekor-server"].registry
          repository = local.parsed["rekor-server"].repo
          version    = local.parsed["rekor-server"].digest
        }
        ingress = {
          enabled = false
        }
      }
      redis = {
        registry   = local.parsed["redis"].registry
        repository = local.parsed["redis"].repo
        version    = local.parsed["redis"].digest
      }
    }

    trillian = {
      createdb = {
        image = {
          registry   = local.parsed["trillian-createdb"].registry
          repository = local.parsed["trillian-createdb"].repo
          version    = local.parsed["trillian-createdb"].digest
        }
      }
      mysql = {
        image = {
          registry   = local.parsed["mysql"].registry
          repository = local.parsed["mysql"].repo
          version    = local.parsed["mysql"].digest
        }
      }
      initContainerImage = {
        curl = {
          registry   = local.parsed["curl"].registry
          repository = local.parsed["curl"].repo
          version    = local.parsed["curl"].digest
        }
        netcat = {
          registry   = local.parsed["netcat"].registry
          repository = local.parsed["netcat"].repo
          version    = local.parsed["netcat"].digest
        }
      }
      logServer = {
        image = {
          registry   = local.parsed["logserver"].registry
          repository = local.parsed["logserver"].repo
          version    = local.parsed["logserver"].digest
        }
      }
      logSigner = {
        image = {
          registry   = local.parsed["logsigner"].registry
          repository = local.parsed["logsigner"].repo
          version    = local.parsed["logsigner"].digest
        }
      }
    }

    tuf = {
      enabled = true
      deployment = {
        registry   = local.parsed["tuf-server"].registry
        repository = local.parsed["tuf-server"].repo
        version    = local.parsed["tuf-server"].digest
      }
      ingress = {
        create = false
      }
      forceNamespace = "tuf-system"
    }

    tsa = {
      enabled = true
      server = {
        args = {
          signer = "memory"
        }
        image = {
          registry   = local.parsed["tsa-server"].registry
          repository = local.parsed["tsa-server"].repo
          version    = local.parsed["tsa-server"].digest
        }
      }
    }

    copySecretJob = {
      enabled = true
      name    = "copy-secrets-job"
    }
  }
}

resource "random_pet" "test-value" {}

resource "imagetest_feature" "basic" {
  name        = "basic"
  description = "Basic installation"
  harness     = module.cluster_harness.harness

  steps = [
    {
      name = "Helm Install"
      cmd  = module.helm.install_cmd
    },
    # Double check that helm is properly waiting for jobs to complete
    {
      name = "copy-secrets-job completed"
      cmd  = "kubectl wait --for=condition=complete --timeout=120s --namespace=tuf-system job/copy-secrets-job"
    },
    {
      name = "Apply job to verify keyless signing"
      cmd  = <<EOF
        cat <<EOF2 | kubectl apply -f -
          apiVersion: batch/v1
          kind: Job
          metadata:
            name: keyless-sign-verify
            namespace: tuf-system
            labels:
              test: keyless-sign-verify
          spec:
            template:
              spec:
                initContainers:
                - name: copy-tuf-root
                  image: cgr.dev/chainguard/wolfi-base:latest
                  workingDir: /workspace
                  command: [cp]
                  args: [/tuf-root/root, /workspace/root.json]
                  volumeMounts:
                  - name: workspace
                    mountPath: /workspace
                  - name: tuf-root
                    mountPath: /tuf-root

                - name: initialize
                  image: ${local.fetched["cosign-cli"].full_ref}
                  workingDir: /workspace
                  args:
                  - initialize
                  - --mirror=https://tuf-server.tuf-system.svc
                  - --root=./root.json
                  volumeMounts:
                  - name: workspace
                    mountPath: /workspace
                  - name: tuf-config
                    mountPath: /home/nonroot/.sigstore

                - name: sign
                  image: ${local.fetched["cosign-cli"].full_ref}
                  workingDir: /workspace
                  args:
                  - sign-blob
                  - /etc/os-release
                  - --fulcio-url=http://fulcio-server.fulcio-system.svc
                  - --rekor-url=http://rekor-server.rekor-system.svc
                  - --output-certificate=cert.pem
                  - --output-signature=sig
                  - --yes
                  - --identity-token=/var/sigstore/token/oidc-token
                  volumeMounts:
                  - name: workspace
                    mountPath: /workspace
                  - name: tuf-config
                    mountPath: /home/nonroot/.sigstore
                  - name: oidc-token
                    mountPath: /var/sigstore/token

                containers:
                - name: verify
                  image: ${local.fetched["cosign-cli"].full_ref}
                  workingDir: /workspace
                  args:
                  - verify-blob
                  - /etc/os-release
                  - --rekor-url=http://rekor-server.rekor-system.svc
                  - --certificate=cert.pem
                  - --signature=sig
                  - --certificate-oidc-issuer=https://kubernetes.default.svc
                  - --certificate-identity=https://kubernetes.io/namespaces/tuf-system/serviceaccounts/default
                  volumeMounts:
                  - name: workspace
                    mountPath: /workspace
                  - name: tuf-config
                    mountPath: /home/nonroot/.sigstore

                volumes:
                - name: workspace
                  emptyDir: {}
                - name: tuf-root
                  secret:
                    secretName: tuf-root
                - name: tuf-config
                  emptyDir: {}
                - name: oidc-token
                  projected:
                    sources:
                    - serviceAccountToken:
                        audience: sigstore
                        path: oidc-token
                        expirationSeconds: 600

                restartPolicy: Never
        EOF2
        kubectl wait --for=condition=complete --timeout=120s --namespace=tuf-system job/keyless-sign-verify
      EOF
    },
    {
      name = "Apply job to check rekor"
      cmd  = <<EOF
        cat <<EOF2 | kubectl apply -f -
          apiVersion: batch/v1
          kind: Job
          metadata:
            name: rekor-test
            namespace: rekor-system
            labels:
              test: rekor-test
          spec:
            template:
              spec:
                initContainers:
                - name: sign
                  image: cgr.dev/chainguard/wolfi-base:latest
                  workingDir: /workspace
                  command: [/bin/sh, -c]
                  args: [<<EOF3
                  set -ex 
                  apk add openssl
                  openssl ecparam -genkey -name prime256v1 > ec_private.pem
                  openssl ec -in ec_private.pem -pubout > ec_public.pem
                  echo -n ${random_pet.test-value.id} | openssl dgst -sha256 -sign ec_private.pem -out foo.sig
                  EOF3
                  ]
                  volumeMounts:
                  - name: workspace
                    mountPath: /workspace

                containers:
                - name: check-rekor
                  image: ${local.fetched["rekor-cli"].full_ref}
                  workingDir: /workspace
                  args:
                  - upload
                  - --rekor_server=http://rekor-server.rekor-system.svc
                  - --type=hashedrekord:0.0.1
                  - --artifact-hash=${sha256(random_pet.test-value.id)}
                  - --signature=foo.sig
                  - --pki-format=x509
                  - --public-key=ec_public.pem
                  volumeMounts:
                  - name: workspace
                    mountPath: /workspace

                volumes:
                - name: workspace
                  emptyDir: {}

                restartPolicy: Never
        EOF2
        kubectl wait --for=condition=complete --timeout=120s --namespace=rekor-system job/rekor-test
      EOF
    },
    {
      name = "Apply job to test tsa verification"
      cmd  = <<EOF
        cat <<EOF2 | kubectl apply -f -
          apiVersion: batch/v1
          kind: Job
          metadata:
            name: tsa-sign-verify
            namespace: tuf-system
            labels:
              test: tsa-sign-verify
          spec:
            template:
              spec:
                initContainers:
                - name: copy-tuf-root
                  image: cgr.dev/chainguard/wolfi-base:latest
                  workingDir: /workspace
                  command: [cp]
                  args: [/tuf-root/root, /workspace/root.json]
                  volumeMounts:
                  - name: workspace
                    mountPath: /workspace
                  - name: tuf-root
                    mountPath: /tuf-root

                - name: initialize
                  image: ${local.fetched["cosign-cli"].full_ref}
                  workingDir: /workspace
                  args:
                  - initialize
                  - --mirror=https://tuf-server.tuf-system.svc
                  - --root=./root.json
                  volumeMounts:
                  - name: workspace
                    mountPath: /workspace
                  - name: tuf-config
                    mountPath: /home/nonroot/.sigstore
                
                - name: tsa-certchain
                  image: ${local.fetched["curl"].full_ref}
                  workingDir: /workspace
                  args:
                  - Lo
                  - /workspace/tsa-cert-chain.pem
                  - http://tsa-server.tsa-system.svc/api/v1/timestamp/certchain
                  volumeMounts:
                  - name: workspace
                    mountPath: /workspace

                - name: sign
                  image: ${local.fetched["cosign-cli"].full_ref}
                  workingDir: /workspace
                  args:
                  - sign-blob
                  - /etc/os-release
                  - --fulcio-url=http://fulcio-server.fulcio-system.svc
                  - --timestamp-server-url=http://tsa-server.tsa-system.svc/api/v1/timestamp
                  - --output-certificate=cert.pem
                  - --output-signature=sig
                  - --yes
                  - --identity-token=/var/sigstore/token/oidc-token
                  - --tlog-upload=false
                  - --rfc3161-timestamp=/workspace/timestamp.tsp
                  volumeMounts:
                  - name: workspace
                    mountPath: /workspace
                  - name: tuf-config
                    mountPath: /home/nonroot/.sigstore
                  - name: oidc-token
                    mountPath: /var/sigstore/token

                containers:
                - name: verify
                  image: ${local.fetched["cosign-cli"].full_ref}
                  workingDir: /workspace
                  args:
                  - verify-blob
                  - /etc/os-release
                  - --insecure-ignore-tlog=true
                  - --certificate=cert.pem
                  - --signature=sig
                  - --certificate-oidc-issuer=https://kubernetes.default.svc
                  - --certificate-identity=https://kubernetes.io/namespaces/tuf-system/serviceaccounts/default
                  - --timestamp-certificate-chain=/workspace/tsa-cert-chain.pem
                  - --rfc3161-timestamp=/workspace/timestamp.tsp
                  volumeMounts:
                  - name: workspace
                    mountPath: /workspace
                  - name: tuf-config
                    mountPath: /home/nonroot/.sigstore

                volumes:
                - name: workspace
                  emptyDir: {}
                - name: tuf-root
                  secret:
                    secretName: tuf-root
                - name: tuf-config
                  emptyDir: {}
                - name: oidc-token
                  projected:
                    sources:
                    - serviceAccountToken:
                        audience: sigstore
                        path: oidc-token
                        expirationSeconds: 600

                restartPolicy: Never
        EOF2
        kubectl wait --for=condition=complete --timeout=120s --namespace=tuf-system job/tsa-sign-verify
      EOF
    },
  ]

  labels = {
    type = "k8s"
  }
}

# TODO: More tests!

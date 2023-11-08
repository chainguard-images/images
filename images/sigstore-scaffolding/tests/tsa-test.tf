resource "kubernetes_job_v1" "tsa_sign_verify" {
  depends_on = [helm_release.scaffold]

  metadata {
    name      = "tsa-sign-verify"
    namespace = "tuf-${random_pet.suffix.id}" // To mount the tuf root secret
  }

  spec {
    template {
      metadata {}
      spec {
        init_container {
          name        = "copy-tuf-root"
          image       = "cgr.dev/chainguard/wolfi-base:latest"
          working_dir = "/workspace"
          command     = ["/bin/sh", "-c"]
          args = [<<EOF
          set -ex
          ls /tuf-root/
          cp /tuf-root/root /workspace/root.json
          EOF
          ]
          volume_mount {
            name       = "workspace"
            mount_path = "/workspace"
          }
          volume_mount {
            name       = "tuf-root"
            mount_path = "/tuf-root"
          }
        }

        init_container {
          name        = "initialize"
          image       = data.oci_string.images["cosign-cli"].id
          working_dir = "/workspace"
          args = [
            "initialize",
            "--mirror", "http://tuf-server.tuf-${random_pet.suffix.id}.svc",
            "--root", "./root.json",
          ]
          volume_mount {
            name       = "workspace"
            mount_path = "/workspace"
          }
          volume_mount {
            name       = "tuf-config"
            mount_path = "/home/nonroot/.sigstore"
          }
        }

        init_container {
          name        = "tsa-certchain"
          image       = data.oci_string.images["curl"].id
          working_dir = "/workspace"
          args = [
            "-Lo", "/workspace/tsa-cert-chain.pem",
            "http://tsa-server.tsa-system.svc/api/v1/timestamp/certchain",
          ]
          volume_mount {
            name       = "workspace"
            mount_path = "/workspace"
          }
        }

        init_container {
          name        = "sign"
          image       = data.oci_string.images["cosign-cli"].id
          working_dir = "/workspace"
          args = [
            "sign-blob", "/etc/os-release",
            "--fulcio-url", "http://fulcio-server.fulcio-${random_pet.suffix.id}.svc",
            "--timestamp-server-url", "http://tsa-server.tsa-system.svc/api/v1/timestamp",
            "--output-certificate", "cert.pem",
            "--output-signature", "sig",
            "--yes",
            "--identity-token", "/var/sigstore/token/oidc-token",
            "--tlog-upload=false",
            "--rfc3161-timestamp=/workspace/timestamp.tsp",
          ]
          volume_mount {
            name       = "workspace"
            mount_path = "/workspace"
          }
          volume_mount {
            name       = "oidc-token"
            mount_path = "/var/sigstore/token"
          }
          volume_mount {
            name       = "tuf-config"
            mount_path = "/home/nonroot/.sigstore"
          }
        }

        container {
          name        = "verify"
          image       = data.oci_string.images["cosign-cli"].id
          working_dir = "/workspace"
          args = [
            "verify-blob", "/etc/os-release",
            "--insecure-ignore-tlog=true",
            "--certificate", "cert.pem",
            "--signature", "sig",
            "--certificate-oidc-issuer", "https://kubernetes.default.svc.cluster.local",
            "--certificate-identity", "https://kubernetes.io/namespaces/tuf-${random_pet.suffix.id}/serviceaccounts/default",
            "--timestamp-certificate-chain=/workspace/tsa-cert-chain.pem",
            "--rfc3161-timestamp=/workspace/timestamp.tsp",
          ]
          volume_mount {
            name       = "workspace"
            mount_path = "/workspace"
          }
          volume_mount {
            name       = "tuf-config"
            mount_path = "/home/nonroot/.sigstore"
          }
        }

        volume {
          name = "workspace"
          empty_dir {}
        }
        volume {
          name = "oidc-token"
          projected {
            sources {
              service_account_token {
                path               = "oidc-token"
                expiration_seconds = 600
                audience           = "sigstore"
              }
            }
          }
        }
        volume {
          name = "tuf-root"
          secret {
            secret_name = "tuf-root"
          }
        }
        volume {
          name = "tuf-config"
          empty_dir {}
        }
        restart_policy = "Never"
      }
    }
  }

  wait_for_completion = true
  // Give this time to complete on a potentially busy cluster.
  timeouts {
    create = "5m"
    update = "5m"
  }
}

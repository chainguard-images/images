resource "random_pet" "test-value" {}

# Based on https://github.com/sigstore/rekor/blob/main/types.md#hashed-rekord
resource "kubernetes_job_v1" "check_rekor" {
  depends_on = [helm_release.scaffold]

  metadata {
    name      = "check-rekor"
    namespace = "rekor-${random_pet.suffix.id}"
  }

  spec {
    template {
      metadata {}
      spec {
        init_container {
          name        = "sign"
          image       = "cgr.dev/chainguard/wolfi-base:latest"
          working_dir = "/workspace"
          command     = ["/bin/sh", "-c"]
          args = [<<EOF
          set -ex
          apk add openssl
          openssl ecparam -genkey -name prime256v1 > ec_private.pem
          openssl ec -in ec_private.pem -pubout > ec_public.pem
          echo -n ${random_pet.test-value.id} | openssl dgst -sha256 -sign ec_private.pem -out foo.sig
          EOF
          ]
          volume_mount {
            name       = "workspace"
            mount_path = "/workspace"
          }
        }
        container {
          name  = "check-rekor"
          image = data.oci_string.images["rekor-cli"].id
          args = [
            "upload",
            "--rekor_server=http://rekor-server.rekor-${random_pet.suffix.id}.svc",
            "--type=hashedrekord:0.0.1",
            "--artifact-hash=${sha256(random_pet.test-value.id)}",
            "--signature=foo.sig",
            "--pki-format=x509",
            "--public-key=ec_public.pem",
          ]
          working_dir = "/workspace"
          volume_mount {
            name       = "workspace"
            mount_path = "/workspace"
          }
        }
        volume {
          name = "workspace"
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
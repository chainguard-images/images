terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_exec_test" "minio" {
  digest = var.digest
  # Deploy velero's sample minio test deployment
  script = "kubectl apply -f https://raw.githubusercontent.com/vmware-tanzu/velero/main/examples/minio/00-minio-deployment.yaml --wait=true"
}

data "oci_string" "ref" { input = var.digest }

resource "random_pet" "suffix" {}

resource "helm_release" "velero" {
  name             = "velero-${random_pet.suffix.id}"
  namespace        = "velero"
  repository       = "https://vmware-tanzu.github.io/helm-charts/"
  chart            = "velero"
  create_namespace = true

  values = [
    jsonencode({
      image = {
        repository = data.oci_string.ref.registry_repo
        digest     = data.oci_string.ref.digest
      }

      snapshotsEnabled = false

      configuration = {
        backupStorageLocation = [{
          provider = "aws"
          bucket   = "velero"
          config = {
            region           = "minio"
            s3ForcePathStyle = "true"
            s3Url            = "http://minio.velero.svc:9000"
          }
        }]
      }

      credentials = {
        secretContents = {
          cloud = <<EOF
          [default]
          aws_access_key_id = minio
          aws_secret_access_key = minio123
          EOF
        }
      }

      initContainers = [{
        name  = "velero-plugin-for-aws"
        image = "velero/velero-plugin-for-aws:v1.2.0"
        volumeMounts = [{
          mountPath = "/target"
          name      = "plugins"
        }]
      }]
    })
  ]

  depends_on = [data.oci_exec_test.minio]
}

# module "helm_cleanup" {
#   source    = "../../../tflib/helm-cleanup"
#   name      = helm_release.helm.id
#   namespace = helm_release.helm.namespace
# }

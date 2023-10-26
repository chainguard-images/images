terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    cli                 = string
    exec                = string
    worfkflowcontroller = string
  })
}



data "oci_string" "ref" {
  for_each = var.digests
  input    = each.value
}


resource "helm_release" "argo" {
  name = "argo-workflows"

  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-workflows"

  namespace        = "argo-workflows"
  create_namespace = true

  values = [
    jsonencode({
      image = {
        tag = ""
      }
      server = {
        image = {
          registry   = join("", [data.oci_string.ref["cli"].registry, ""])
          repository = data.oci_string.ref["cli"].repo
          tag        = data.oci_string.ref["cli"].pseudo_tag

        }
        executor = {
          image = {
            registry   = join("", [data.oci_string.ref["exec"].registry, ""])
            repository = data.oci_string.ref["exec"].repo
            tag        = data.oci_string.ref["exec"].pseudo_tag
          }
        }
        controller = {
          image = {
            registry   = join("", [data.oci_string.ref["worfkflowcontroller"].registry, ""])
            repository = data.oci_string.ref["worfkflowcontroller"].repo
            tag        = data.oci_string.ref["worfkflowcontroller"].pseudo_tag
          }
        }

      }

    }),
  ]
}


data "oci_exec_test" "check-argo" {
  digest      = var.digests["cli"] # we are testing the whole helm release digest here is a place holder
  script      = "./check-argo-workflow.sh"
  working_dir = path.module
  depends_on  = [helm_release.argo]

}

module "helm_cleanup" {
  depends_on = [data.oci_exec_test.check-argo]
  source     = "../../../tflib/helm-cleanup"
  name       = helm_release.argo.id
  namespace  = helm_release.argo.namespace
}

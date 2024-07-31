terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    server      = string
    repo-server = string
  })
}

locals { parsed = { for k, v in var.digests : k => provider::oci::parse(v) } }

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "argocd"
  inventory = data.imagetest_inventory.this
}

module "install" {
  source = "../../../tflib/imagetest/helm"

  chart     = "argo-cd"
  namespace = "argocd"
  repo      = "https://argoproj.github.io/argo-helm"

  values = {
    config = {
      params = {
      }
    }
    image = {
      tag        = local.parsed["server"].pseudo_tag
      repository = local.parsed["server"].registry_repo
    }
    repoServer = {
      image = {
        tag        = local.parsed["repo-server"].pseudo_tag
        repository = local.parsed["repo-server"].registry_repo
      }
    }
  }
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of the argocd helm chart."

  steps = [
    {
      name = "Helm install"
      cmd  = module.install.install_cmd
    },
    {
      name = "Deploy the guestbook"
      cmd  = <<EOF
        apk add argo-cd
        args="--port-forward --port-forward-namespace=argocd"
        password=$(kubectl get secrets -n argocd argocd-initial-admin-secret -ojsonpath='{.data.password}' | base64 -d -)
        argocd login $args --password $password --username admin
        argocd app create guestbook $args \
          --repo https://github.com/argoproj/argocd-example-apps.git \
          --path guestbook \
          --dest-server https://kubernetes.default.svc \
          --dest-namespace default

        argocd app sync guestbook $args --timeout "120"
        argocd app wait guestbook $args --timeout "120"
      EOF
    },
  ]

  labels = {
    type = "k8s"
  }
}

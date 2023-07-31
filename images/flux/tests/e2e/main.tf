terraform {
  required_providers {
    kubernetes = { source = "hashicorp/kubernetes" }
  }
}

resource "kubernetes_manifest" "gitrepo" {
  manifest = {
    apiVersion = "source.toolkit.fluxcd.io/v1"
    kind       = "GitRepository"
    metadata = {
      name      = "podinfo"
      namespace = "flux-system"
    }
    spec = {
      interval = "1m0s"
      ref = {
        branch = "master"
      }
      url = "https://github.com/stefanprodan/podinfo"
    }
  }

  wait {
    condition {
      status = "True"
      type   = "ArtifactInStorage"
    }
  }
}

resource "kubernetes_manifest" "kustomization" {
  manifest = {
    apiVersion = "kustomize.toolkit.fluxcd.io/v1"
    kind       = "Kustomization"
    metadata = {
      name      = "podinfo"
      namespace = "flux-system"
    }
    spec = {
      interval = "1m0s"
      path     = "./kustomize"
      prune    = true
      sourceRef = {
        kind = "GitRepository"
        name = "podinfo"
      }
      targetNamespace = "default"
      timeout         = "3m0s"
      wait            = true
    }
  }

  wait {
    condition {
      status = "True"
      type   = "Healthy"
    }
  }

  timeouts {
    create = "1m0s"
    update = "1m0s"
    delete = "1m0s"
  }
}

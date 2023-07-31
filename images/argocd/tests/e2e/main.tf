terraform {
  required_providers {
    helm = { source = "hashicorp/helm" }
  }
}

resource "random_id" "suffix" {
  byte_length = 2
}

resource "kubernetes_manifest" "guestbook" {
  for_each = toset(["guestbook", "helm-guestbook", "kustomize-guestbook"])

  manifest = yamldecode(<<-YAML
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: ${each.key}-${random_id.suffix.hex}
  namespace: argocd
spec:
  project: default
  source:
    repoURL: "https://github.com/argoproj/argocd-example-apps.git"
    path: ${each.key}
    targetRevision: "HEAD"
  destination:
    namespace: "default"
    server: "https://kubernetes.default.svc"
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
YAML
  )

  wait {
    fields = {
      "status.health.status" = "Healthy"
    }
  }
}

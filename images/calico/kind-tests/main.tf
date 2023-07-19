terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
    kind = {
      source  = "tehcyx/kind"
      version = ">=0.0.16"
    }
    kubernetes = {}
    helm       = {}
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">=1.14.0"
    }
  }
}

variable "refs" {
  type = map(string)
  default = {
    "cni"              = "cgr.dev/chainguard/calico-cni:latest"
    "node"             = "cgr.dev/chainguard/calico-node:latest"
    "kube_controllers" = "cgr.dev/chainguard/calico-kube-controllers:latest"
    "typha"            = "cgr.dev/chainguard/calico-typha:latest"
    "csi"              = "cgr.dev/chainguard/calico-csi:latest"
  }
}

data "oci_ref" "refs" {
  for_each = var.refs

  ref = each.value
}

data "kubectl_file_documents" "docs" {
  for_each = toset([
    "csi-driver",
    "typha"
  ])

  content = templatefile("${path.module}/manifests/${each.value}.yaml.tpl", {
    CNI_IMAGE              = data.oci_ref.refs["cni"].ref
    NODE_IMAGE             = data.oci_ref.refs["node"].ref
    KUBE_CONTROLLERS_IMAGE = data.oci_ref.refs["kube_controllers"].ref
    TYPHA_IMAGE            = data.oci_ref.refs["typha"].ref
    CSI_IMAGE              = data.oci_ref.refs["csi"].ref
  })
}

locals {
  yaml_file = flatten([
    for doc in data.kubectl_file_documents.docs : [
      for v in doc.documents : {
        data : yamldecode(v)
        content : v
      }
    ]
  ])
}

provider "kubernetes" {
  host                   = kind_cluster.no_cni.endpoint
  client_certificate     = kind_cluster.no_cni.client_certificate
  client_key             = kind_cluster.no_cni.client_key
  cluster_ca_certificate = kind_cluster.no_cni.cluster_ca_certificate
}

provider "kubectl" {
  host                   = kind_cluster.no_cni.endpoint
  client_certificate     = kind_cluster.no_cni.client_certificate
  client_key             = kind_cluster.no_cni.client_key
  cluster_ca_certificate = kind_cluster.no_cni.cluster_ca_certificate
}

provider "helm" {
  kubernetes {
    host                   = kind_cluster.no_cni.endpoint
    client_certificate     = kind_cluster.no_cni.client_certificate
    client_key             = kind_cluster.no_cni.client_key
    cluster_ca_certificate = kind_cluster.no_cni.cluster_ca_certificate
  }
}

resource "kubectl_manifest" "install" {
  for_each = {
    for v in local.yaml_file : lower(join("/", compact([
      v.data.apiVersion,
      v.data.kind,
      lookup(lookup(v.data, "metadata", {}), "namespace", ""),
      lookup(lookup(v.data, "metadata", {}), "name", "")
    ]))) => v.content
  }
  yaml_body = each.value

  depends_on = [kind_cluster.no_cni]
}

resource "kind_cluster" "no_cni" {
  name = "kind-no-cni"

  # This needs to be disabled, the provider checks assume a default CNI
  # wait_for_ready = true

  kind_config {
    kind        = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"
    networking {
      disable_default_cni = true
    }
  }
}

data "oci_exec_test" "smoke" {
  # This is unused in the script, but required for the data block
  digest = "cgr.dev/chainguard/calico-node@sha256:324d5ef1335c8d10314ed2000a521b8f3eba9f2c133fd1f68ecc68986369a7d7"

  script     = "${path.module}/smoke.sh"
  depends_on = [kubectl_manifest.install]
}

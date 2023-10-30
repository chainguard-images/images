terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digests" {
  description = "The image digest to run tests over."
  type = object({
    kubectl                 = string
    kubeadm                 = string
    kubelet                 = string
    kube-scheduler          = string
    kube-proxy              = string
    kube-controller-manager = string
    kube-apiserver          = string
    pause                   = string
  })
}

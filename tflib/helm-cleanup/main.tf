variable "name" {
  type        = string
  description = "Name of the helm release to cleanup"

}
variable "namespace" {
  default     = "default"
  type        = string
  description = "Namespace of the helm release to cleanup"
}

resource "null_resource" "cleanup" {
  provisioner "local-exec" {
    command = <<EOF
    set -ex
    helm list -n ${var.namespace}
    helm uninstall -n ${var.namespace} ${var.name} --wait
    EOF
  }
}

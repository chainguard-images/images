variable "name" {}
variable "namespace" {
  default = "default"
}

resource "null_resource" "cleanup" {
  provisioner "local-exec" {
    command = <<EOF
    set -ex
    helm list -n ${var.namespace}
    helm get all -n ${var.namespace} ${var.name}
    helm uninstall -n ${var.namespace} ${var.name} --wait
    EOF
  }
}

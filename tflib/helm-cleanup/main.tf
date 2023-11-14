variable "name" {
  type        = string
  description = "Name of the helm release to cleanup"

}
variable "namespace" {
  type        = string
  description = "Namespace of the helm release to cleanup"
}

resource "null_resource" "cleanup" {
  provisioner "local-exec" {
    command = <<EOF
set -e
if [[ "${var.namespace}" == "" ]]; then
  helm uninstall ${var.name} --wait --cascade=foreground
else
  helm uninstall -n ${var.namespace} ${var.name} --wait --cascade=foreground
fi
EOF
  }
}

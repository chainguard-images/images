variable "name" {}

variable "namespace" {
  default = "default"
}

variable "repo" {}

variable "chart" {}

variable "chart_version" {
  default = "latest"
}

variable "timeout" {
  default = "10m"
}

variable "values" {
  type    = any
  default = {}
}

output "install_cmd" {
  value = <<EOF
helm install ${var.name} -n ${var.namespace} --create-namespace \
  ${var.chart} --repo ${var.repo} \
  --wait --timeout=${var.timeout} \
  --values - <<EOV
${jsonencode(var.values)}
EOV
EOF
}

output "destroy_cmd" {
  value = <<EOF
EOF
}

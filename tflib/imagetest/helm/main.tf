terraform {
  required_providers {
    random = { source = "hashicorp/random" }
  }
}

locals {
  name = var.name != "" ? var.name : random_pet.name.id
}

resource "random_pet" "name" {}

locals {
  install_cmd = <<-EOinstall
apk add helm
if ! helm install ${local.name} ${var.chart} \
  --namespace ${var.namespace} --create-namespace \
  %{if var.repo != ""}--repo ${var.repo}%{endif} \
  %{if var.chart_version != ""}--version ${var.chart_version}%{endif} \
  --wait --wait-for-jobs \
  --timeout ${var.timeout} \
  %{if length(var.values_files) != 0}--values ${join(",", var.values_files)}%{endif} \
  --values <(echo '${jsonencode(var.values)}'); then

  printf "\\nFailed to install helm chart\\n"

  printf "\\n\\nGet Pods:\\n\\n"
  kubectl get pods -n ${var.namespace} -l app.kubernetes.io/instance=${local.name} || true

  printf "\\n\\nDescribe Pods:\\n\\n"
  kubectl describe pods -n ${var.namespace} -l app.kubernetes.io/instance=${local.name} || true

  printf "\\n\\nEvents:\\n\\n"
  kubectl get events --field-selector type!=Normal --sort-by=.metadata.creationTimestamp -o wide -n ${var.namespace} || true

  exit 1
fi
  EOinstall

  uninstall_cmd = <<-EOuninstall
helm uninstall ${var.name} --namespace ${var.namespace} \
  --wait \
  --timeout ${var.timeout}
  EOuninstall
}

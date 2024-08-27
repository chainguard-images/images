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
set -o errexit -o nounset -o errtrace -o pipefail -x

apk add helm

chart=${var.chart}

%{if var.git_repo != ""}
apk add patch git

repo_path=$(mktemp -d)
git clone --depth 1 ${var.git_repo} $repo_path

(
  cd $repo_path || exit
  echo "${join(" ", var.patches)}" | tr ' ' '\n' | while read -r patchfile; do
    if [ ! -f "$patchfile" ]; then
      echo "Patch file $patchfile does not exist"
      exit 1
    fi
    echo "Applying patch: $patchfile..."
    patch '-p1' < $patchfile || echo "Failed to apply patch: $patchfile" && exit
  done
)

chart=$repo_path/${var.chart}
%{endif}

echo "Installing chart: $chart"

if ! helm install ${local.name} $chart \
  --namespace ${var.namespace} --create-namespace \
  %{if var.repo != ""}--repo ${var.repo}%{endif} \
  %{if var.git_repo != ""}--dependency-update%{endif} \
  %{if var.chart_version != ""}--version ${var.chart_version}%{endif} \
  %{if var.wait}--wait --wait-for-jobs%{endif} \
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

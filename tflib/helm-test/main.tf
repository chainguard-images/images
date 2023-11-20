resource "null_resource" "test" {
  provisioner "local-exec" {
    command = <<EOF
set -eux

script=$(mktemp)
cat <<'SCRIPT' > $${script}

#!/usr/bin/env bash

set -eux

function cleanup() {
  # Uninstall everything, and make double triple sure it's fully uninstalled.
  helm uninstall ${var.name} -n ${var.namespace} --wait --cascade=foreground --timeout=10m

  kubectl delete pods -n ${var.namespace} --all --wait=true
  kubectl delete ns ${var.namespace} --wait=true

  if [ -n "${var.crd_pattern}" ]; then
    for crd in $(kubectl get crds -o name | grep "${var.crd_pattern}"); do
      kubectl delete $${crd}
      kubectl wait --for=delete $${crd} --timeout=120s
    done
  fi
}
trap cleanup EXIT

values=/tmp/values-$${RANDOM}.yaml
cat << EOV > $${values}
${var.values}
EOV

helm install ${var.name} ${var.chart} -n ${var.namespace} --repo ${var.repository} --create-namespace -f $${values}

# Wait for the pods to be ready.
kubectl wait --for=condition=Ready -n ${var.namespace} pod --all --timeout=120s

scripts=${join(" ", var.test_scripts)}
if [ -n "$${scripts}" ]; then
  for t in $${scripts}; do
    echo "=== Running $${t} ==="
    bash $${t}
  done
fi
SCRIPT

chmod +x $${script}

if [ -n "${var.flock_key}" ]; then
  flock --verbose --exclusive --timeout ${var.flock_timeout} /tmp/${var.flock_key} $${script}
else
  $${script}
fi
    EOF
  }
}

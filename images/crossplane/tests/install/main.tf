terraform {
  required_providers {
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "values" {
  type = any
  default = {
    image = {
      repository = "cgr.dev/chainguard/crossplane"
      tag        = "latest"
    }
  }
}

module "helm_crossplane" {
  source = "../../../../tflib/imagetest/helm"

  name      = "crossplane"
  namespace = "crossplane-system"
  repo      = "https://charts.crossplane.io/stable"
  chart     = "crossplane"

  values = merge(var.values, {
    // Our images have package config in one big layer, which might cause the
    // Crossplane control plane to have difficulty.
    resourcesCrossplane = {
      limits = {
        # Make these bigger so we can accommodate images with bigger layers
        cpu    = "2"
        memory = "2Gi"
      }
      requests = {
        cpu    = "1"
        memory = "1Gi"
      }
    }
  })
}

output "install_cmd" {
  value = <<EOF
${module.helm_crossplane.install_cmd}

apk add jq yq

yq eval -o=json /k3s-config/registries.yaml | jq '
{
  "auths": (
    .configs | to_entries | map({
      key: .key,
      value: { auth: ((.value.auth.username + ":" + .value.auth.password) | @base64) }
    }) | from_entries
  )
}' | kubectl create secret generic regcred \
  -n crossplane-system \
  --from-file=.dockerconfigjson=/dev/stdin \
  --type=kubernetes.io/dockerconfigjson || true
  EOF
}

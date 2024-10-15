terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digests" {
  description = "The image digest to run tests over."
  type = object({
    crossplane = string
  })
}

locals { parsed = { for k, v in var.digests : k => provider::oci::parse(v) } }

module "crossplane_harness" {
  source = "../../crossplane/tests/harness/"

  tests_path = path.module
}

module "helm_crossplane" {
  source = "../../crossplane/tests/install"

  values = {
    image = {
      repository = local.parsed["crossplane"].registry_repo
      tag        = local.parsed["crossplane"].pseudo_tag
    }
  }
}

resource "imagetest_feature" "basic" {
  harness     = module.crossplane_harness.harness
  name        = "Basic"
  description = "Basic functionality of the cert-manager helm chart."

  steps = [
    {
      name = "Install crossplane",
      cmd  = module.helm_crossplane.install_cmd
    },
    {
      name = "Let's trigger the e2e tests"
      cmd  = <<EOEe2e
          kubectl apply -f /tests/provider-nop.yaml

          # wait until provider-nop is Healthy
          kubectl wait --for=condition=Healthy providers/provider-nop --timeout 5m

          # let's apply the nopresource
          kubectl apply -f /tests/nopresource.yaml

          # wait until nopresource is Ready
          kubectl wait --for=condition=Ready nopresources/example --timeout 5m

          # now let's check the secret in crossplane-system named nop-example-resource and wait until its available
          until kubectl get secret nop-example-resource -n crossplane-system >/dev/null 2>&1; do
             echo "Waiting for secret nop-example-resource to be available..."
             sleep 5
          done
          
          echo "Secret nop-example-resource is now available."

          # Extract and decode secret values
          secret_data=$(kubectl get secret nop-example-resource -n crossplane-system -o json | jq -r '.data | to_entries[] | .key + ": " + (.value | @base64d)' | sort)
          
          # Extract YAML values
          yaml_data=$(yq '.spec.forProvider.connectionDetails[] | "\(.name): \(.value)"' /tests/nopresource.yaml | sort)
          
          # Compare sorted data
          echo "Comparing Secret with YAML values:"
          diff <(echo "$secret_data") <(echo "$yaml_data")
          
          if [ $? -eq 0 ]; then
              echo "The secret data matches the YAML values."
          else
              echo "The secret data does not match the YAML values."
              exit 1
          fi
EOEe2e
    }
  ]

  labels = {
    type = "k8s"
  }
}

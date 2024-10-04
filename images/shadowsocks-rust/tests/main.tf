terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    sslocal  = string
    ssserver = string
  })
}

locals { parsed = { for k, v in var.digests : k => provider::oci::parse(v) } }

data "oci_exec_test" "smoke" {
  digest = var.digests["ssserver"] # This doesn't actually matter here, just pass it something valid
  script = "${path.module}/01-smoke.sh"

  env {
    name  = "SERVER_IMAGE_NAME"
    value = "${local.parsed["ssserver"].registry_repo}:${local.parsed["ssserver"].pseudo_tag}"
  }
  env {
    name  = "LOCAL_IMAGE_NAME"
    value = "${local.parsed["sslocal"].registry_repo}:${local.parsed["sslocal"].pseudo_tag}"
  }
}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "shadowsocks-rust"
  inventory = data.imagetest_inventory.this

  sandbox = {
    envs = {
      "IMAGE_NAME_SSLOCAL"  = "${local.parsed["sslocal"].registry_repo}:${local.parsed["sslocal"].pseudo_tag}"
      "IMAGE_NAME_SSSERVER" = "${local.parsed["ssserver"].registry_repo}:${local.parsed["ssserver"].pseudo_tag}"
    }
  }
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of the shadowsocks-rust."

  steps = [
    {
      name = "Deploy"
      cmd  = <<EOF
 # The yaml below results in error "error looking up service account default/default: serviceaccount "default" not found"
 # so we create the service accout ahead of time
 kubectl get sa default || kubectl create sa default

 kubectl apply -f https://raw.githubusercontent.com/shadowsocks/shadowsocks-rust/master/k8s/shadowsocks-rust.yaml
 kubectl set image deployment/shadowsocks-rust shadowsocks-rust="${local.parsed["ssserver"].registry_repo}:${local.parsed["ssserver"].pseudo_tag}"
       EOF
    },
    {
      name  = "Ensure it comes up healthy"
      cmd   = <<EOF
 kubectl rollout status deployment/shadowsocks-rust --timeout=120s

 # Note: the shadowsocks-rust-test-connection pod fails due to bad args (gets error "wget: bad port")
 # So we modify the args here and redeploy it before running the "kubectl wait" below
 kubectl get pod shadowsocks-rust-test-connection -o yaml | sed 's/shadowsocks-rust:/shadowsocks-rust/' > tmp.yaml && \
  kubectl delete pod shadowsocks-rust-test-connection --force && kubectl apply -f tmp.yaml && rm -f tmp.yaml

 kubectl wait --for=condition=ready pod --selector app.kubernetes.io/name=shadowsocks-rust
       EOF
      retry = { attempts = 3, delay = "2s", factor = 2 }
    },
  ]

  labels = {
    type = "k8s"
  }
}

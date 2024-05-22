terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "config" { source = "./config" }

module "{{ .ModuleName }}" {
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = var.target_repository
  config            = module.config.config
{{ if .DevVariant }}
  build-dev         = true
{{ end }}
}

module "test" {
  source = "./tests"
  digest = module.{{ .ModuleName }}.image_ref
}

resource "oci_tag" "latest" {
  depends_on = [module.test]
  digest_ref = module.{{ .ModuleName }}.image_ref
  tag        = "latest"
}
{{ if .DevVariant }}
resource "oci_tag" "latest-dev" {
  depends_on = [module.test]
  digest_ref = module.{{ .ModuleName }}.dev_ref
  tag        = "latest-dev"
}
{{ end }}

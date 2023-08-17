module "eleven-zero-twenty-four" {
  source = "../../tflib/publisher"

  name = basename(path.module)

  target_repository = var.target_repository
  config            = file("${path.module}/configs/openjdk-11.0.20.4.apko.yaml")
}

module "version-tags-eleven-zero-twenty-four" {
  source  = "../../tflib/version-tags"
  package = "openjdk-11-jre"
  config  = module.eleven-zero-twenty-four.config
}
module "seventeen-zero-eight-two" {
  source = "../../tflib/publisher"

  name = basename(path.module)

  target_repository = var.target_repository
  config            = file("${path.module}/configs/openjdk-17.0.8.2.apko.yaml")
}

module "version-tags-seventeen-zero-eight-two" {
  source  = "../../tflib/version-tags"
  package = "openjdk-17-jre"
  config  = module.seventeen-zero-eight-two.config
}

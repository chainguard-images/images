output "images" {
  value = {
    apko = module.apko.images
    flux = module.flux.images
    jdk  = module.jdk.images
    k3s  = module.k3s.images
  }
}

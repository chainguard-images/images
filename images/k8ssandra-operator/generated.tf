# DO NOT EDIT - this file is autogenerated by tfgen

output "summary" {
  value = merge(
    {
      basename(path.module) = {
        "ref"    = module.k8ssandra-operator.image_ref
        "config" = module.k8ssandra-operator.config
        "tags"   = ["latest"]
      }
  })
}


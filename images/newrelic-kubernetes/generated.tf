# DO NOT EDIT - this file is autogenerated by tfgen

output "summary" {
  value = merge(
    {
      basename(path.module) = {
        "ref"    = module.newrelic-kubernetes.image_ref
        "config" = module.newrelic-kubernetes.config
        "tags"   = ["latest"]
      }
  })
}


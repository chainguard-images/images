# DO NOT EDIT - this file is autogenerated by tfgen

output "summary" {
  value = merge(
    {
      basename(path.module) = {
        "ref"    = module.melange.image_ref
        "config" = module.melange.config
        "tags"   = ["latest"]
      }
  })
}


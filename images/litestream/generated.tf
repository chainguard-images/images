# DO NOT EDIT - this file is autogenerated by tfgen

output "summary" {
  value = merge(
    {
      basename(path.module) = {
        "ref"    = module.litestream.image_ref
        "config" = module.litestream.config
        "tags"   = ["latest"]
      }
  })
}


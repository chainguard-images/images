# DO NOT EDIT - this file is autogenerated by tfgen

output "summary" {
  value = merge(
    {
      basename(path.module) = {
        "ref"    = module.falcosidekick.image_ref
        "config" = module.falcosidekick.config
        "tags"   = ["latest"]
      }
  })
}


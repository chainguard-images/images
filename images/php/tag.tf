module "tagger" {
  source     = "../../tflib/tagger"
  depends_on = [module.test-versioned, module.test-versioned-dev, module.test-fpm, module.test-fpm-dev]
  tags = merge(
    merge([for k in module.versions.ordered_keys : module.versioned[k].latest_tag_map]...),
    merge([
      # exclude the latest-dev bit, otherwise ends up with tags like `latest-dev-fpm-dev` and `latest-dev-fpm`
      for v in local.versions : merge(
        {
          for t in module.versioned-fpm[v].tag_list : "${t}-fpm" => module.versioned-fpm[v].image_ref
          if t != "latest-dev"
        },
        {
          for t in module.versioned-fpm[v].tag_list : "${t}-fpm-dev" => module.versioned-fpm[v].dev_ref
          if t != "latest-dev"
        }
      )
    ]...)
  )
}

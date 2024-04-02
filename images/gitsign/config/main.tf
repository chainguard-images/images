module "accts" { source = "../../../tflib/accts" }

output "config" {
  value = jsonencode({
    contents = {
      packages = ["busybox", "git", "gitsign", "gitsign-config"]
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/usr/bin/git"
    }
    cmd = "help"
  })
}

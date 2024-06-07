variable "extra_packages" {
  description = "The additional packages to install"
  type        = list(string)
  default     = []
}

# The upstream image also runs as root:
# https://github.com/gravitational/teleport/blob/master/build.assets/charts/Dockerfile-distroless#L1C16-L2C1 
# crane config gcr.io/distroless/cc-debian12 | jq -r '.config User'
# 0
# Here is the discussion for running the Teleport as non-root:
# https://github.com/gravitational/teleport/discussions/11485
module "accts" {
  source = "../../../tflib/accts"
  run-as = 0
}

output "config" {
  value = jsonencode({
    contents = {
      packages = var.extra_packages
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/usr/bin/dumb-init /usr/local/bin/teleport start -c /etc/teleport/teleport.yaml"
    }
  })
}

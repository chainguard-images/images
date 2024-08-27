module "accts" {
  source = "../../../tflib/accts"
  run-as = 0
}

variable "extra_packages" {
  description = "Extra packages to install."
  validation {
    condition     = contains(var.extra_packages, "k3s") || contains(var.extra_packages, "k3s-fips") || contains(var.extra_packages, "k3s-static")
    error_message = "extra_packages must contain either 'k3s' or 'k3s-fips' or 'k3s-static'"
  }
}

output "config" {
  value = jsonencode({
    contents = {
      packages = concat([
        # Optional features
        "fuse-overlayfs",
        "fuse-overlayfs-snapshotter",
      ], var.extra_packages)
    }
    paths = [
      {
        path        = "/etc/rancher"
        type        = "directory"
        permissions = 493 # 0o755
        uid         = module.accts.uid
        gid         = module.accts.gid
        recursive   = true
      },
      {
        path        = "/run"
        type        = "directory"
        permissions = 493 # 0o755
        uid         = 0
        gid         = 0
        recursive   = true
      },
      {
        path        = "/var/run"
        type        = "directory"
        permissions = 493 # 0o755
        uid         = 0
        gid         = 0
        recursive   = true
      },
      {
        path        = "/lib/modules"
        type        = "directory"
        permissions = 493 # 0o755
        uid         = 0
        gid         = 0
        recursive   = true
      },
      {
        path        = "/lib/firmware"
        type        = "directory"
        permissions = 493 # 0o755
        uid         = 0
        gid         = 0
        recursive   = true
      },
    ]
    volumes = [
      "/var/lib/rancher/k3s",
      "/var/lib/kubelet",
      "/var/lib/cni",
      "/var/log",
    ]
    entrypoint = {
      command = "/bin/k3s"
    }
    cmd = "agent"
    environment = {
      # /bin/aux is a "special" path upstream may use to store binaries it
      # wants to override. we currently don't keep any of these, but keep the
      # $PATH override just in case.
      PATH            = "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/bin/aux"
      CRI_CONFIG_PATH = "/var/lib/rancher/k3s/agent/etc/crictl.yaml"
    }
  })
}

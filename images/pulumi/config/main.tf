variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = ["pulumi"]
}

module "accts" {
  source = "../../../tflib/accts"
  name   = "pulumi"
  run-as = 0
}

output "config" {
  value = jsonencode({
    contents = {
      packages = concat([
        # Needed for language support
        "busybox",
        # for Pulumi Go support
        "pulumi-language-go",
        "go",
        # for Pulumi Dotnet support
        "pulumi-language-dotnet",
        "dotnet-7",
        "dotnet-7-runtime",
        "dotnet-7-sdk",
        "aspnet-7-runtime",
        "aspnet-7-targeting-pack",
        # for Pulumi Python support
        "pulumi-language-python",
        "python3",
        "python3-dev",
        "py3-pip",
        # for Pulumi Node.js support
        "pulumi-language-nodejs",
        "nodejs",
        "npm",
        "nghttp2",
        # for Pulumi Java support
        "pulumi-language-java",
        "glibc-locale-en",
        "openjdk-17-jre",
        "openjdk-17-default-jvm",
        "openjdk-17",
        "libstdc++",
        "maven",
        # for Pulumi YAML support
        "pulumi-language-yaml",
        # other miscellaneous
        "git",
        "bash",
        "openssh",
        "openssh-keyscan",
      ], var.extra_packages)
    }
    accounts = module.accts.block
    environment = {
      PATH             = "/usr/sbin:/sbin:/usr/bin:/bin"
      XDG_CONFIG_HOME  = "/tmp/.config"
      XDG_CACHE_HOME   = "/tmp/.cache"
      XDG_CONFIG_CACHE = "/tmp/.cache"
      LANG             = "C.UTF-8"
    }
    entrypoint = {
      command = "/usr/bin/pulumi"
    }
    cmd = "-h"
    paths = [{
      path        = "/home/pulumi-kubernetes-operator/.ssh"
      type        = "directory"
      uid         = 65532
      gid         = 65532
      permissions = 511 // 0o777 (HCL explicitly does not support octal literals)
    }]
  })
}

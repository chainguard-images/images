terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "The additional packages to install."
  default     = ["cassandra", "cassandra-compat", "openjdk-11-default-jvm"]
}

variable "environment" {
  default = {}
}

output "config" {
  value = jsonencode({
    contents = {
      packages = concat(var.extra_packages, [
        "bash",
        "busybox",
      ])
    },
    accounts = {
      groups = [
        {
          groupname = "cassandra",
          gid       = 999,
        },
      ],
      users = [
        {
          username = "cassandra",
          uid      = 999,
        },
      ],
      run-as = 999,
    },
    work-dir = "/",
    entrypoint = {
      command = "/opt/cassandra/bin/cassandra -f",
    },
    environment = merge({
      LANG           = "en_US.UTF-8",
      CASSANDRA_HOME = "/opt/cassandra",
      PATH           = "/usr/sbin:/sbin:/usr/bin:/bin:/opt/cassandra/bin/",
    }, var.environment),
    paths = [
      {
        path        = "/var/lib/cassandra",
        type        = "directory",
        permissions = 511, // 0o777 (HCL explicitly does not support octal literals)
        uid         = 999,
        gid         = 999,
        recursive   = true,
      },
      {
        path        = "/opt/cassandra",
        type        = "directory",
        permissions = 511, // 0o777
        uid         = 999,
        gid         = 999,
        recursive   = true,
      },
      {
        path        = "/var/lib/cassandra",
        type        = "directory",
        permissions = 511, // 0o777
        uid         = 999,
        gid         = 999,
      },
      {
        path        = "/var/log/cassandra",
        type        = "directory",
        permissions = 511, // 0o777
        uid         = 999,
        gid         = 999,
        recursive   = true,
      },
    ],
  })
}

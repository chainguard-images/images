terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "The additional packages to install"
  default = [
    "py3-cassandra-medusa",
    "py3-cassandra-medusa-compat",
  ]
}

variable "environment" {
  default = {}
}

output "config" {
  value = jsonencode({
    contents = {
      packages = var.extra_packages,
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
          gid      = 999,
        },
      ],
      run-as = 999,
    },
    paths = [
      {
        path        = "/home/cassandra",
        type        = "directory",
        uid         = 999,
        gid         = 999,
        permissions = 493, // 0o755 in decimal
        recursive   = true,
      },
    ],
    environment = merge({
      DEBUG_VERSION = "1",
      DEBUG_SLEEP   = "0",
      LC_ALL        = "C.UTF-8",
      LANG          = "C.UTF-8",
      PATH          = "/usr/share/medusa/.venv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
    }, var.environment),
    work-dir = "/home/cassandra/",
    entrypoint = {
      command = "/home/cassandra/docker-entrypoint.sh",
    },
  })
}

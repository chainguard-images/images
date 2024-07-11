module "accts" {
  gid    = 101
  name   = "www-data"
  run-as = 0
  source = "../../../tflib/accts"
  uid    = 101
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["ingress-nginx-controller", "ingress-nginx-controller-compat"]
  description = "The packages to install"
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : var.extra_packages
    },
    "entrypoint" : {
      "command" : "/nginx-ingress-controller"
    },
    "cmd" : "/usr/bin/dumb-init ---",
    "work-dir" : "/etc/nginx",
    "accounts" : module.accts.block,
    "environment" : {
      "LUA_CPATH" : "/usr/lib/lua/5.1/?.so;/usr/lib/lua/?/?.so;/usr/lib/lua/?.so;/usr/lib/lua/?.lua;",
      "LUA_PATH" : "/usr/share/lua/5.1/?.lua;/usr/lib/lua/?.lua;/usr/lib/lua/?.lua;/usr/share/lua/?.lua",
      "PATH" : "$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/luajit/bin"
    },
    "paths" : [
      {
        "path" : "/etc/ingress-controller",
        "type" : "directory",
        "uid" : 101,
        "gid" : 101,
        "permissions" : 493
      },
      {
        "path" : "/etc/ingress-controller/geoip",
        "type" : "directory",
        "uid" : 101,
        "gid" : 101,
        "permissions" : 493,
        "recursive" : true
      },
      {
        "path" : "/etc/ingress-controller/ssl",
        "type" : "directory",
        "uid" : 101,
        "gid" : 101,
        "permissions" : 493,
        "recursive" : true
      },
      {
        "path" : "/etc/ingress-controller/telemetry",
        "type" : "directory",
        "uid" : 101,
        "gid" : 101,
        "permissions" : 493,
        "recursive" : true
      },
      {
        "path" : "/etc/ingress-controller/auth",
        "type" : "directory",
        "uid" : 101,
        "gid" : 101,
        "permissions" : 493,
        "recursive" : true
      },
      {
        "path" : "/usr/local/",
        "type" : "directory",
        "uid" : 101,
        "gid" : 101,
        "permissions" : 493,
        "recursive" : true
      },
      {
        "path" : "/usr/local/",
        "type" : "directory",
        "uid" : 101,
        "gid" : 101,
        "permissions" : 493,
        "recursive" : true
      },
      {
        "path" : "/var/lib/",
        "type" : "directory",
        "uid" : 101,
        "gid" : 101,
        "permissions" : 493,
        "recursive" : true
      },
      {
        "path" : "/var/lib/nginx/",
        "type" : "directory",
        "uid" : 101,
        "gid" : 101,
        "permissions" : 493,
        "recursive" : true
      },
      {
        "path" : "/var/lib/nginx/body",
        "type" : "directory",
        "uid" : 101,
        "gid" : 101,
        "permissions" : 493,
        "recursive" : true
      },
      {
        "path" : "/usr/local/nginx",
        "type" : "directory",
        "uid" : 101,
        "gid" : 101,
        "permissions" : 493,
        "recursive" : true
      },
      {
        "path" : "/run/nginx",
        "type" : "directory",
        "uid" : 101,
        "gid" : 101,
        "permissions" : 493,
        "recursive" : true
      },
      {
        "path" : "/etc/nginx/modules",
        "type" : "directory",
        "uid" : 101,
        "gid" : 101,
        "permissions" : 493,
        "recursive" : true
      },
      {
        "path" : "/etc/nginx",
        "type" : "directory",
        "uid" : 101,
        "gid" : 101,
        "permissions" : 493,
        "recursive" : true
      },
      {
        "path" : "/etc/nginx/geoip",
        "type" : "directory",
        "uid" : 101,
        "gid" : 101,
        "permissions" : 493,
        "recursive" : true
      },
      {
        "path" : "/usr/local/nginx",
        "type" : "directory",
        "uid" : 101,
        "gid" : 101,
        "permissions" : 493,
        "recursive" : true
      },
      {
        "path" : "/opt/modsecurity/",
        "type" : "directory",
        "uid" : 101,
        "gid" : 101,
        "permissions" : 493,
        "recursive" : true
      },
      {
        "path" : "/var/log",
        "type" : "directory",
        "uid" : 101,
        "gid" : 101,
        "permissions" : 493
      },
      {
        "path" : "/tmp/nginx",
        "type" : "directory",
        "uid" : 101,
        "gid" : 101,
        "permissions" : 493,
        "recursive" : true
      }
    ]
  })
}


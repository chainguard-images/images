locals {
  baseline_packages = ["bash", "busybox"]
}

module "accts" {
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["tomcat-11.0-openjdk-17"]
  description = "The additional packages to install (e.g. tomcat-10)."
}

variable "extra_environments" {
  description = "The additional environment variables to set"
  type        = map(string)
  default     = {}
}

output "config" {
  value = jsonencode({
    "contents" : {
      // TODO: remove the need for using hardcoded local.baseline_packages by plumbing
      // these packages through var.extra_packages in all callers of this config module
      "packages" : distinct(concat(local.baseline_packages, var.extra_packages))
    },
    "entrypoint" : {
      "command" : "/usr/local/tomcat/bin/catalina.sh"
    },
    "cmd" : "run",
    "work-dir" : "/usr/local/tomcat",
    "accounts" : module.accts.block,
    "environment" : merge({
      "CATALINA_HOME" : "/usr/local/tomcat",
      "JAVA_HOME" : "/usr/lib/jvm/default-jvm",
      "LD_LIBRARY_PATH" : "/usr/lib/tomcat-native",
      "PATH" : "/usr/local/tomcat/bin:/usr/sbin:/sbin:/usr/bin:/bin"
    }, var.extra_environments)
    "paths" : [
      {
        "path" : "/usr/share/tomcat/conf",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 493,
        "recursive" : true
      },
      {
        "path" : "/usr/share/tomcat/lib",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 493,
        "recursive" : true
      },
      {
        "path" : "/usr/share/tomcat/bin",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 493,
        "recursive" : true
      },
      {
        "path" : "/usr/share/tomcat/logs",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 493,
        "recursive" : true
      },
      {
        "path" : "/usr/share/tomcat/temp",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 493,
        "recursive" : true
      },
      {
        "path" : "/usr/share/tomcat/work",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 493,
        "recursive" : true
      },
      {
        "path" : "/usr/share/tomcat/webapps",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 493,
        "recursive" : true
      },
      {
        "path" : "/usr/share/tomcat/webapps.dist",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 493,
        "recursive" : true
      },
      {
        "path" : "/usr/local/tomcat",
        "type" : "symlink",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 493,
        "source" : "/usr/share/tomcat",
        "recursive" : true
      }
    ]
  })
}


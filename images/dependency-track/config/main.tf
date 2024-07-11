locals {
  baseline_packages = ["busybox", "openjdk-17-default-jvm"]
}

module "accts" {
  gid    = 1000
  name   = "dtrack"
  run-as = 1000
  source = "../../../tflib/accts"
  uid    = 1000
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["dependency-track-bundled"]
  description = "The additional packages to install"
}

output "config" {
  value = jsonencode({
    "contents" : {
      // TODO: remove the need for using hardcoded local.baseline_packages by plumbing
      // these packages through var.extra_packages in all callers of this config module
      "packages" : distinct(concat(local.baseline_packages, var.extra_packages))
    },
    "entrypoint" : {},
    "cmd" : "sh -c \"exec java $${JAVA_OPTIONS} $${EXTRA_JAVA_OPTIONS} --add-opens java.base/java.util.concurrent=ALL-UNNAMED -Dlogback.configurationFile=$${LOGGING_CONFIG_PATH} -DdependencyTrack.logging.level=$${LOGGING_LEVEL} -jar /usr/share/java/dependency-track/dependency-track-bundled.jar -context $${CONTEXT}\"\n",
    "work-dir" : "/usr/share/java/dependency-track",
    "accounts" : module.accts.block,
    "environment" : {
      "CONTEXT" : "/",
      "DEFAULT_TEMPLATES_OVERRIDE_BASE_DIRECTORY" : "/data",
      "DEFAULT_TEMPLATES_OVERRIDE_ENABLED" : "false",
      "EXTRA_JAVA_OPTIONS" : "",
      "JAVA_OPTIONS" : "-XX:+UseParallelGC -XX:MaxRAMPercentage=90.0",
      "LANG" : "C.UTF-8",
      "LOGGING_CONFIG_PATH" : "logback.xml",
      "LOGGING_LEVEL" : "INFO",
      "TZ" : "Etc/UTC"
    },
    "paths" : [
      {
        "path" : "/data",
        "type" : "directory",
        "uid" : 1000,
        "gid" : 1000,
        "permissions" : 493,
        "recursive" : true
      }
    ]
  })
}


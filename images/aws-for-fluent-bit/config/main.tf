module "accts" {
  run-as = 0
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["aws-for-fluent-bit", "aws-for-fluent-bit-compat", "libpq"]
  description = "Additional packages to install."
  type        = list(string)
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : var.extra_packages
    },
    "entrypoint" : {
      "command" : "/fluent-bit/bin/fluent-bit"
    },
    "cmd" : "-e /fluent-bit/firehose.so -e /fluent-bit/cloudwatch.so -e /fluent-bit/kinesis.so -c /fluent-bit/etc/fluent-bit.conf",
    "accounts" : module.accts.block,
    "paths" : [
      {
        "path" : "/var/lib/fluent-bit",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 493
      }
    ]
  })
}


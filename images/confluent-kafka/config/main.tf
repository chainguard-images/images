terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = ["busybox", "confluent-kafka", "openjdk-17-default-jvm"]
}

variable "environment" {
  default = {}
}

module "accts" {
  source = "../../../tflib/accts"
  run-as = 65532
  uid    = 65532
  gid    = 65532
  name   = "nonroot"
}

output "config" {
  value = jsonencode({
    contents = {
      packages = var.extra_packages
    }
    accounts = module.accts.block
    environment = merge({
      "COMPONENT" : "kafka"
      "LANG" : "C.UTF-8"
      "PATH" : "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
      "CUB_CLASSPATH" : "\"/usr/share/java/kafka/*:/usr/share/java/cp-base-new/*:/usr/share/java/zookeeper/*:/usr/share/java/confluent-common-docker/*\""
      "KAFKA_ZOOKEEPER_CONNECT" : ""
      "KAFKA_ADVERTISED_LISTENERS" : ""
      "CLUSTER_ID" : ""
    })
    entrypoint = {
      command = "/etc/confluent/docker/run"
    }
    paths = [{
      path        = "/usr/lib/kafka"
      type        = "directory"
      uid         = module.accts.uid
      gid         = module.accts.gid
      permissions = 511
      recursive   = true
      }, {
      path        = "/var/lib/kafka/data"
      type        = "directory"
      uid         = module.accts.uid
      gid         = module.accts.gid
      permissions = 511
      recursive   = true
      }, {
      path        = "/etc/kafka"
      type        = "directory"
      uid         = module.accts.uid
      gid         = module.accts.gid
      permissions = 511
      recursive   = true
      }, {
      path        = "/etc/kafka/secrets"
      type        = "directory"
      uid         = module.accts.uid
      gid         = module.accts.gid
      permissions = 511
      recursive   = true
      }, {
      path        = "/var/log"
      type        = "directory"
      uid         = module.accts.uid
      gid         = module.accts.gid
      permissions = 511
      recursive   = true
      }, {
      path        = "/var/log/kafka"
      type        = "directory"
      uid         = module.accts.uid
      gid         = module.accts.gid
      permissions = 511
      recursive   = true
      }, {
      path        = "/usr/lib/zookeeper"
      type        = "directory"
      uid         = module.accts.uid
      gid         = module.accts.gid
      permissions = 511
      recursive   = true
      }, {
      path        = "/etc/zookeeper"
      type        = "directory"
      uid         = module.accts.uid
      gid         = module.accts.gid
      permissions = 511
      recursive   = true
      }, {
      path        = "/etc/confluent"
      type        = "directory"
      uid         = module.accts.uid
      gid         = module.accts.gid
      permissions = 511
      recursive   = true
      }, {
      path        = "/var/log/confluent"
      type        = "directory"
      uid         = module.accts.uid
      gid         = module.accts.gid
      permissions = 511
      recursive   = true
    }]
  })
}

variable "extra_packages" {
  description = "The additional packages to install"
}

variable "entrypoint" {
  description = "The entrypoint to use for the image"
}

module "accts" {
  source = "../../../tflib/accts"
}

output "config" {
  value = jsonencode({
    contents = {
      packages = var.extra_packages
    }
    accounts = module.accts.block
    # https://github.com/minio/minio/blob/6440d0fbf3bc89a610f06abbc427336db73f46b4/cmd/object-api-utils.go#L59-L67
    paths = [{
      path        = "/data/.minio.sys"
      type        = "directory"
      uid         = module.accts.block.run-as
      gid         = module.accts.block.run-as
      recursive   = true
      permissions = 511 // 0o777 (HCL explicitly does not support octal literals)
      }, {
      path        = "/data/.minio.sys/tmp"
      type        = "directory"
      uid         = module.accts.block.run-as
      gid         = module.accts.block.run-as
      recursive   = true
      permissions = 511 // 0o777 (HCL explicitly does not support octal literals)
      }, {
      # https://github.com/minio/minio/blob/6440d0fbf3bc89a610f06abbc427336db73f46b4/cmd/prepare-storage.go#L79C23-L79C30
      path        = "/data/.minio.sys/tmp-old"
      type        = "directory"
      uid         = module.accts.block.run-as
      gid         = module.accts.block.run-as
      recursive   = true
      permissions = 511 // 0o777 (HCL explicitly does not support octal literals)
      }, {
      path        = "/data/.minio.sys/tmp/.trash"
      type        = "directory"
      uid         = module.accts.block.run-as
      gid         = module.accts.block.run-as
      recursive   = true
      permissions = 511 // 0o777 (HCL explicitly does not support octal literals)
      }, {
      path        = "/data/.minio.sys/multipart"
      type        = "directory"
      uid         = module.accts.block.run-as
      gid         = module.accts.block.run-as
      recursive   = true
      permissions = 511 // 0o777 (HCL explicitly does not support octal literals)
      }, {
      path        = "/data/.minio.sys/buckets"
      type        = "directory"
      uid         = module.accts.block.run-as
      gid         = module.accts.block.run-as
      recursive   = true
      permissions = 511 // 0o777 (HCL explicitly does not support octal literals)
      }, {
      path        = "/data/.minio.sys/config"
      type        = "directory"
      uid         = module.accts.block.run-as
      gid         = module.accts.block.run-as
      recursive   = true
      permissions = 511 // 0o777 (HCL explicitly does not support octal literals)
    }]
    entrypoint = {
      command = var.entrypoint
    }
  })
}


module "accts" {
  name   = "mongo"
  source = "../../../tflib/accts"
}

output "config" {
  value = jsonencode({
    contents = {
      repositories = ["https://apk.cgr.dev/extra-packages"]
      packages     = ["mongod", "mongo", "procps"]
    },
    entrypoint = {
      command = "/usr/bin/mongod"
    },
    work-dir = "/data",
    accounts = module.accts.block,
    paths = [
      {
        path        = "/data",
        type        = "directory",
        uid         = module.accts.uid
        gid         = module.accts.gid
        permissions = parseint("755", 8)
        recursive   = true
      },
      {
        path        = "/data/db",
        type        = "directory",
        uid         = module.accts.uid
        gid         = module.accts.gid
        permissions = parseint("755", 8)
        recursive   = true
      },
      {
        path        = "/data/db/journal",
        type        = "directory",
        uid         = module.accts.uid
        gid         = module.accts.gid
        permissions = parseint("755", 8)
        recursive   = true
      }
    ]
  })
}


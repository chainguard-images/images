output "mounts" {
  value = [{
    source      = path.module
    destination = "/it/lib"
  }]
}

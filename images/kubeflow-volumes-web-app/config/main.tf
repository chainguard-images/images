variable "extra_packages" {
  type        = list(string)
  description = "Extra packages to install in the image."
  default     = ["kubeflow-volumes-web-app"]
}

module "accts" { source = "../../../tflib/accts" }

output "config" {
  value = jsonencode({
    accounts = module.accts.block,
    entrypoint = {
      command : "/bin/bash -c \"gunicorn -w 3 --bind 0.0.0.0:5000 --chdir /usr/share/kubeflow-volumes-web-app --access-logfile - entrypoint:app\""
    }
  })
}

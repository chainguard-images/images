variable "name" {
  description = "The user / group name to create."
  default     = "nonroot"
}

variable "uid" {
  description = "The UID to give the name."
  default     = 65532
}

variable "gid" {
  description = "The GID to give the name."
  default     = 65532
}

variable "run-as" {
  description = "The UID to run as."
  default     = 65532
}

output "block" {
  value = {
    groups = [{
      groupname = var.name
      gid       = var.gid
    }]
    users = [{
      username = var.name
      uid      = var.uid
      gid      = var.gid
    }]
    run-as = var.run-as
  }
}

output "name" {
  value = var.name
}

output "uid" {
  value = var.uid
}

output "gid" {
  value = var.gid
}

output "run-as" {
  value = var.run-as
}

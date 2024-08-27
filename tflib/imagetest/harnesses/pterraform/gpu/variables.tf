variable "name" {
  default = "it"
}

variable "machine_type" {
  default = "n1-standard-2"
}

variable "image_ref" {
  default = "gcr.io/google_containers/cuda-vector-add:v0.1@sha256:0705cd690bc0abf54c0f0489d82bb846796586e9d087e9a93b5794576a456aea"
}

variable "mounts" {
  description = "List of mounts to be added to the container started by the startup script"
  default     = []
  type = list(object({
    source      = string
    destination = string
  }))
}

variable "envs" {
  description = "List of environment variables to be added to the container started by the startup script"
  default     = []
  type        = list(string)
}

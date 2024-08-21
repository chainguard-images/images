variable "name" {
  default = "it"
}

variable "machine_type" {
  default = "n1-standard-2"
}

variable "image_ref" {
  default = "gcr.io/google_containers/cuda-vector-add:v0.1"
}

terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_exec_test" "generate_otp" {
  digest = var.digest
  script = "docker run --rm -v $PWD/step:/home/step $IMAGE_NAME crypto otp generate --issuer smallstep.com --account name@smallstep.com --qr /home/step/smallstep.png"
}

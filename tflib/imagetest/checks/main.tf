data "imagetest_inventory" "this" {}

resource "imagetest_harness_docker" "this" {
  name      = "cli"
  inventory = data.imagetest_inventory.this

  privileged = false
}

resource "imagetest_feature" "openssl_fips" {
  count = var.check_openssl_fips ? 1 : 0

  name        = "openssl-fips"
  description = "Test OpenSSL FIPS"
  harness     = imagetest_harness_docker.this

  steps = [
    {
      name = "Testing if FIPS module is available"
      cmd  = <<EOT
        set -euxo pipefail
        docker run --rm --entrypoint openssl ${var.image_ref} list -providers  | grep -q 'fips'
      EOT
    },
    {
      name = "Testing if legacy module is unavailable"
      cmd  = <<EOT
        set -euxo pipefail
        ! docker run --rm --entrypoint openssl ${var.image_ref} list -providers | grep -q 'legacy'
      EOT
    },
    {
      name = "Testing if MD5 hashing fails"
      cmd  = <<EOT
        set -euxo pipefail
        ! docker run --rm --entrypoint openssl ${var.image_ref} dgst -md5 /dev/null
      EOT
    },
    {
      name = "Testing if SHA2-512 hashing succeeds"
      cmd  = <<EOT
        set -euxo pipefail
        docker run --rm --entrypoint openssl ${var.image_ref} dgst -sha512 /dev/null
      EOT
    },
  ]

  labels = { type = "container" }
}

resource "imagetest_feature" "md5" {
  count = var.check_openssl_md5 ? 1 : 0

  name        = "md5"
  description = "Test md5"
  harness     = imagetest_harness_docker.this

  steps = [
    {
      name = "Testing if md5 as hash function is available"
      cmd  = <<EOT
        set -euxo pipefail
        docker run --rm --entrypoint openssl ${var.image_ref} dgst -list | grep -q md5
      EOT
    },
    {
      name = "Testing md5 by computing digest"
      cmd  = <<EOT
        set -euxo pipefail
        docker run --rm --entrypoint openssl ${var.image_ref} dgst -md5 /dev/null
      EOT
    },
  ]

  labels = { type = "container" }
}


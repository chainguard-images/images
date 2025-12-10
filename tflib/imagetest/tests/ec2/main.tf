terraform {
  required_providers {
    imagetest = { source = "chainguard-dev/imagetest" }
    aws       = { source = "hashicorp/aws" }
    cloudinit = { source = "hashicorp/cloudinit" }
  }
}

locals {
  tests = [for test in var.tests : merge(test, {
    content = concat(
      test.content != null ? test.content : [],
      var.cwd != "" ? [{ source = var.cwd }] : [],
      [{ source = "${path.module}/../../libs", target = "/imagetest/libs" }],
    )
    # Use per-test timeout if specified, otherwise fall back to module timeout
    timeout = test.timeout != null ? test.timeout : var.timeout
  })]
}

resource "imagetest_tests" "ec2" {
  name   = var.name
  driver = "ec2"

  drivers = {
    ec2 = {
      ami                   = local.resolved_ami
      instance_type         = var.instance_type
      region                = var.aws_region
      vpc_id                = var.vpc_id
      root_volume_size      = var.root_volume_size
      gpus                  = var.gpu ? "all" : ""
      user_data             = local.resolved_user_data
      setup_commands        = var.setup_commands
      ssh_user              = local.resolved_ssh_user
      volume_mounts         = var.volume_mounts
      device_mounts         = var.device_mounts
      env                   = var.env
      instance_profile_name = var.instance_profile_name
    }
  }

  repo    = var.repo
  images  = var.images
  tests   = local.tests
  timeout = var.timeout
}

output "tests" {
  value = imagetest_tests.ec2
}

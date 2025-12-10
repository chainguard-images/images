# Family-based EC2 configuration
#
# Each "family" represents a known AMI + setup combination that the module
# supports "on rails". For custom AMIs, use custom_ami variable instead.
#
# Supported families:
#   - ubuntu: Canonical Ubuntu 24.04 with Docker installed via cloud-init.
#             GPU support available (installs NVIDIA drivers + container toolkit).
#   - chainguard: Purpose-built Chainguard AMI with Docker pre-installed.
#                 Requires TF_VAR_chainguard_ami to be set. No setup needed.

locals {
  # Map EC2/Linux architecture to Debian architecture (used in Ubuntu AMI names)
  arch_to_deb_arch = {
    "x86_64" = "amd64"
    "arm64"  = "arm64"
  }
  deb_arch = local.arch_to_deb_arch[var.architecture]

  # Validate chainguard family has required AMI
  _validate_chainguard_ami = (
    var.family == "chainguard" && var.custom_ami == "" && var.chainguard_ami == ""
    ? tobool("family='chainguard' requires chainguard_ami to be set (via TF_VAR_chainguard_ami)")
    : true
  )

  # Known family configurations
  families = {
    ubuntu = {
      default_ami = length(data.aws_ami.ubuntu) > 0 ? data.aws_ami.ubuntu[0].id : ""
      ssh_user    = "ubuntu"
      user_data   = data.cloudinit_config.ubuntu.rendered
    }
    chainguard = {
      default_ami = var.chainguard_ami
      ssh_user    = "ec2-user"
      user_data   = null # Chainguard AMI comes ready to use
    }
  }

  # Determine if we're using a custom AMI (off-rails)
  using_custom_ami = var.custom_ami != ""

  # Resolve the active configuration
  active_family = local.using_custom_ami ? null : local.families[var.family]

  # Final resolved values (custom_ami overrides family, explicit vars override both)
  resolved_ami       = local.using_custom_ami ? var.custom_ami : local.active_family.default_ami
  resolved_ssh_user  = var.ssh_user != null ? var.ssh_user : (local.using_custom_ami ? "ec2-user" : local.active_family.ssh_user)
  resolved_user_data = var.user_data != null ? var.user_data : (local.using_custom_ami ? null : local.active_family.user_data)
}

# Look up the latest Ubuntu 24.04 AMI from Canonical (only when needed)
data "aws_ami" "ubuntu" {
  count = var.family == "ubuntu" && var.custom_ami == "" ? 1 : 0

  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-${local.deb_arch}-server-*"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }

  filter {
    name   = "architecture"
    values = [var.architecture]
  }
}

# Ubuntu cloud-init configuration
data "cloudinit_config" "ubuntu" {
  gzip          = false
  base64_encode = false

  part {
    content_type = "text/cloud-config"
    content = yamlencode({
      package_update = true
      # GPU instances always need a reboot after driver install to load the kernel module
      power_state = var.gpu ? {
        mode = "reboot"
      } : null
    })
  }

  part {
    content_type = "text/x-shellscript"
    filename     = "install-docker.sh"
    content      = file("${path.module}/scripts/ubuntu/install-docker.sh")
  }

  dynamic "part" {
    for_each = var.gpu ? [1] : []
    content {
      content_type = "text/x-shellscript"
      filename     = "install-nvidia.sh"
      content      = file("${path.module}/scripts/ubuntu/install-nvidia.sh")
    }
  }
}

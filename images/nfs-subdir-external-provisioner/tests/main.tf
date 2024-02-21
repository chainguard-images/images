variable "digest" {
  description = "The image digest to run tests over."
}

# These tests are empty in favor of the package based testing here:
# https://github.com/wolfi-dev/os/pull/13133
# 
# This module is left intact to preserve the behavior of any callers, and
# reduce the downstream impact when and if image tests are added.

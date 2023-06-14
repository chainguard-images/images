locals {
  # Autoload any image specific configs stored in `image.hcl`
  image_vars = read_terragrunt_config(find_in_parent_folders("image.hcl"))

  # Define root locals
  repository = "gcr.io/wolf-chainguard/images"

  # Get the default package_name by stripping the "images/" prefix from the root directory.
  image_path            = trimprefix(get_terragrunt_dir(), "${get_repo_root()}/images/")
  image_path_components = split("/", local.image_path)
  package_name          = local.image_path_components[0]
  tag_suffix            = local.image_path_components[1]

  # Set a default array of test_files to run by globbing all files in the images `tests` directory.
  available_test_files = fileset("${get_terragrunt_dir()}/..", "tests/*.sh")
  test_file_paths      = [for test in local.available_test_files : "${get_terragrunt_dir()}/../${test}"]
}

# Define the shared terraform invocation that all images will use
terraform {
  # Not to be confused with a "module", this just points to the
  # `./tflib/image` terraform that is shared by every image with a
  # `terragrunt.hcl` defined. The "inputs" to the invocation are built in
  # layers, allowing for increasingly specific overrides for each package,
  # without needing to go down the typical copy/paste approach for
  # variables/outputs.
  source = "${get_path_to_repo_root()}//tflib/image"
}

# Define the "root" inputs that apply to all invocations of the above
# "terraform" block. These can all be overridden using the appropriately layered
# ".hcl" file. The order of appearance in the `merge` block dicates the
# precedence.
inputs = merge(
  # These are the default "globals" that apply to all invocations. We be
  # specific about which inputs get passed to prevent anything unwanted from
  # leaking.
  {
    package_name      = local.package_name
    tag_suffix        = local.tag_suffix
    target_repository = "${local.repository}/${local.package_name}"
    test_file_paths   = local.test_file_paths
  },

  # These are any inputs that are defined in the `./image/{image}/image.hcl`
  # file. They are considered as "image" level overrides
  local.image_vars.locals,

  # Finally, merge in any "tag" level overrides that are defined in the tag
  # specific `terragrunt.hcl` file. These are autoloaded in the
  # `./image/{image}/{tag}/terragrunt.hcl` file.
)
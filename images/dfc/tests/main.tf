terraform {
  required_providers {
    imagetest = { source = "chainguard-dev/imagetest" }
    oci       = { source = "chainguard-dev/oci" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    dfc     = string
    dfc-mcp = string
  })
}

variable "check-dev" {
  default     = false
  description = "Whether to check for dev extensions"
}

data "imagetest_inventory" "this" {
}

resource "imagetest_harness_docker" "docker" {
  envs = {
    DFC_IMAGE     = var.digests["dfc"]
    DFC_MCP_IMAGE = var.digests["dfc-mcp"]
  }
  inventory = data.imagetest_inventory.this
  name      = "docker"
}

resource "imagetest_feature" "test" {
  harness = imagetest_harness_docker.docker
  name    = "docker-test"
  steps = [
    {
      name = "test dfc conversion"
      cmd  = <<EOT
        set -ex

        # Basic commands
        docker run --rm $DFC_IMAGE --version
        docker run --rm $DFC_IMAGE --help
EOT
    },
    {
      name = "test dfc-mcp server starts"
      cmd  = <<EOT
        set -ex

        # MCP servers run via stdio - verify it initializes then terminate
        # Capture output and check for successful initialization message
        output=$(timeout 2 docker run --rm $DFC_MCP_IMAGE 2>&1 || true)
        echo "$output"
        echo "$output" | grep -q "MCP server initialization complete"
EOT
    }
  ]
}


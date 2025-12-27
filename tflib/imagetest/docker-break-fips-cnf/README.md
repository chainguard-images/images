# FIPS Break Test Module

This module provides a reusable test for verifying FIPS compliance by intentionally breaking the FIPS configuration and ensuring the application fails appropriately.

## When To Use This Module

Use this module for images that rely on OpenSSL FIPS configuration via `fipsmodule.cnf`. This includes any image that pulls in the `openssl-config-fipshardened` package.

This module should not be used for:
- Applications using Bouncy Castle FIPS (BCFIPS) - these use Java-based FIPS and do not depend on OpenSSL's `fipsmodule.cnf`
- Applications with custom FIPS implementations that don't rely on OpenSSL's configuration file

## How It Works

The test:
1. Starts the container with a broken fipsmodule.cnf where the mac is set to all 0's
2. Runs the application and verifies it panics/errors with expected FIPS message

The test uses the `docker_in_docker` driver.

The test supports regex. This means that if there are regex symbols in your expected output, such as [], you must escape them first.

## Example

```hcl
module "bash_sandbox" {
  source            = "../../../tflib/imagetest/sandboxes/bash/"
  target_repository = var.target_repository
}

module "fips_break_test" {
  source = "../../../tflib/imagetest/fips"

  digest                 = var.digest
  name                   = "myapp-break-openssl"
  entrypoint             = "/usr/local/bin/myapp"
  args                   = "--flag1 --flag2 value1"
  expected_panic_message = "opensslcrypto: FIPS mode requested"
  bash_sandbox_image     = module.bash_sandbox.image_ref
}
``` 

## Variables

- `digest` (required): The image digest to test
- `name` (required): The name of the test harness
- `entrypoint` (optional): Command to run instead of the default entrypoint
- `entrypoint_args` (optional): Args to pass to the entrypoint
- `env_vars` (optional): Environment variables to pass to the image
- `expected_panic_message` (optional): Expected error message. Default: "FIPS"
- `container_name` (optional): Container name. Default: "fips-break-test"
- `bash_sandbox_image` (optional): Custom bash sandbox image. Default: "cgr.dev/chainguard/bash:latest-dev"
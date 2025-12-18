# Java FIPS Break Test Module

This module provides a reusable test for verifying Java FIPS compliance by intentionally breaking the Bouncy Castle FIPS (BC-FIPS) JAR integrity and ensuring the application fails appropriately.

## When To Use This Module

Use this module for images that rely on Bouncy Castle FIPS for Java-based FIPS cryptography. This includes any image that pulls in the `bouncycastle-fips` package and uses BC-FIPS JAR files.

This module should not be used for:
- Applications using OpenSSL FIPS configuration via `fipsmodule.cnf` - use `docker-break-fips-cnf` module instead
- Applications with custom FIPS implementations that don't rely on Bouncy Castle

## How It Works

The test:
1. Starts the container with a corrupted bc-fips.jar by mounting a modified version where the expected hash of `bc-fips.jar` is changed
2. Runs the application and verifies it panics/errors with expected FIPS integrity check failure message
3. The corrupted JAR is mounted over `/usr/share/java/bouncycastle-fips/bc-fips.jar`

The test uses the `docker_in_docker` driver.

The test supports regex for expected error messages. This means that if there are regex symbols in your expected output, such as [], you must escape them first.

## Example

```hcl
module "bash_sandbox" {
  source            = "../../../tflib/imagetest/sandboxes/bash/"
  target_repository = var.target_repository
}

module "bcfips_break_test" {
  source = "../../../tflib/imagetest/docker-break-bcfips"

  digest                 = var.digest
  name                   = "myapp-break-bcfips"
  entrypoint             = "/usr/local/bin/myapp"
  args                   = "--flag1 --flag2 value1"
  expected_panic_message = "FIPS mode requested"
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

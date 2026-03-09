# LocalStack Test Module

Deploys [LocalStack](https://localstack.cloud/) into a k3s-in-docker test harness and creates an AWS credential Secret for downstream tests.

## Usage

```hcl
module "localstack" {
  source      = "../../../tflib/imagetest/tests/localstack/"
  sandbox_ref = module.bash_sandbox.image_ref
  test_repo   = var.test_repository
  services    = ["s3", "sqs"]
}

module "k8s_test" {
  source = "../../../tflib/imagetest/tests/k3s-in-docker/"
  name   = var.image_version
  images = { my-image = var.digest }
  cwd    = path.module

  tests = concat(
    [module.localstack.test],
    [
      {
        name  = "my-test"
        image = module.bash_sandbox.image_ref
        cmd   = "./test.sh"
        envs = {
          LOCALSTACK_ENDPOINT = module.localstack.endpoint
        }
      },
    ],
  )
}
```

## Variables

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `sandbox_ref` | `string` | (required) | Sandbox image ref (must have bash, kubectl, curl) |
| `test_repo` | `string` | (required) | Registry root; LocalStack image pulled from `$test_repo/localstack:latest` |
| `services` | `list(string)` | `["s3"]` | AWS services to enable |
| `namespace` | `string` | `"default"` | Namespace to deploy LocalStack into |
| `name` | `string` | `"setup-localstack"` | Name for the test step |
| `region` | `string` | `"us-east-1"` | AWS region for LocalStack |
| `wait_attempts` | `number` | `30` | Health check retry attempts |
| `wait_delay` | `string` | `"5s"` | Delay between health check retries |

## Outputs

| Output | Description |
|--------|-------------|
| `test` | Test object to include in the k3s-in-docker `tests` array |
| `endpoint` | `http://localstack.<ns>.svc.cluster.local:4566` |
| `namespace` | Namespace LocalStack is deployed in |
| `region` | Configured AWS region |

## Credential Secret

A `localstack-credentials` Secret is created in the LocalStack namespace with:
- `access-key`: `test`
- `secret-key`: `test`

## Files

| File | Purpose |
|------|---------|
| `main.tf` | Module variables, test output, convenience outputs |
| `deployment.yaml` | Deployment + Service manifest template (rendered via `envsubst`) |
| `setup-localstack.sh` | Deploys LocalStack, verifies per-service health, creates credentials |

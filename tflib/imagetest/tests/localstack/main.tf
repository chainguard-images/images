variable "sandbox_ref" {
  description = "Image ref for the test sandbox (must have bash, kubectl, curl)."
  type        = string
}

variable "test_repo" {
  description = "Registry root for test images (e.g. var.test_repository). The localstack image is pulled from $test_repo/localstack:latest."
  type        = string
}

variable "services" {
  description = "List of AWS services to enable in LocalStack (e.g. [\"s3\", \"sqs\", \"cloudwatch\"])."
  type        = list(string)
  default     = ["s3"]
}

variable "namespace" {
  description = "Kubernetes namespace to deploy LocalStack into."
  type        = string
  default     = "default"
}

variable "region" {
  description = "AWS region to configure in LocalStack."
  type        = string
  default     = "us-east-1"
}

variable "wait_attempts" {
  description = "Number of retry attempts when waiting for LocalStack health."
  type        = number
  default     = 30
}

variable "wait_delay" {
  description = "Delay between health check retries (e.g. '5s', '10s')."
  type        = string
  default     = "5s"
}

output "test" {
  description = "Test object to include in the k3s-in-docker tests array."
  value = {
    name    = "setup-localstack"
    image   = var.sandbox_ref
    content = [{ source = path.module }]
    cmd     = "./setup-localstack.sh"
    envs = {
      LOCALSTACK_IMAGE         = "${var.test_repo}/localstack:latest"
      LOCALSTACK_SERVICES      = join(",", var.services)
      LOCALSTACK_NAMESPACE     = var.namespace
      LOCALSTACK_REGION        = var.region
      LOCALSTACK_WAIT_ATTEMPTS = tostring(var.wait_attempts)
      LOCALSTACK_WAIT_DELAY    = var.wait_delay
    }
  }
}

output "endpoint" {
  description = "The in-cluster URL for LocalStack's edge endpoint."
  value       = "http://localstack.${var.namespace}.svc.cluster.local:4566"
}

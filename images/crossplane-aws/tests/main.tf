terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    family         = string
    cloudfront     = string
    cloudwatchlogs = string
    dynamodb       = string
    ec2            = string
    eks            = string
    firehose       = string
    iam            = string
    kms            = string
    lambda         = string
    rds            = string
    s3             = string
    sns            = string
    sqs            = string
  })
}

module "crossplane_harness" {
  source = "../../crossplane/tests/harness/"

  tests_path = path.module

  envs = {
    "AWS_DIGEST"            = var.digests.family
    "CLOUDFRONT_DIGEST"     = var.digests.cloudfront
    "CLOUDWATCHLOGS_DIGEST" = var.digests.cloudwatchlogs
    "DYNAMODB_DIGEST"       = var.digests.dynamodb
    "EC2_DIGEST"            = var.digests.ec2
    "EKS_DIGEST"            = var.digests.eks
    "FIREHOSE_DIGEST"       = var.digests.firehose
    "IAM_DIGEST"            = var.digests.iam
    "KMS_DIGEST"            = var.digests.kms
    "LAMBDA_DIGEST"         = var.digests.lambda
    "RDS_DIGEST"            = var.digests.rds
    "S3_DIGEST"             = var.digests.s3
    "SNS_DIGEST"            = var.digests.sns
    "SQS_DIGEST"            = var.digests.sqs
  }
}

module "helm_crossplane" {
  source = "../../crossplane/tests/install"
}

resource "imagetest_feature" "basic" {
  harness     = module.crossplane_harness.harness
  name        = "Basic"
  description = "Basic functionality of the crossplane-aws images."

  steps = [
    {
      name = "Install crossplane",
      cmd  = module.helm_crossplane.install_cmd
    },
    {
      name = "Basic smoke test that providers install"
      cmd  = "/tests/install.sh"
    },
  ]

  labels = {
    type = "k8s"
  }

  timeouts = {
    # This can take a while since we're working in serial to avoid disk
    # pressure
    create = "15m"
  }
}

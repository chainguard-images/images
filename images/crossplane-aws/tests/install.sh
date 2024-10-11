#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail

declare -A providerDigests=(
  [cloudfront]="${CLOUDFRONT_DIGEST}"
  [cloudwatchlogs]="${CLOUDWATCHLOGS_DIGEST}"
  [dynamodb]="${DYNAMODB_DIGEST}"
  [ec2]="${EC2_DIGEST}"
  [eks]="${EKS_DIGEST}"
  [firehose]="${FIREHOSE_DIGEST}"
  [iam]="${IAM_DIGEST}"
  [kms]="${KMS_DIGEST}"
  [lambda]="${LAMBDA_DIGEST}"
  [rds]="${RDS_DIGEST}"
  [s3]="${S3_DIGEST}"
  [sns]="${SNS_DIGEST}"
  [sqs]="${SQS_DIGEST}"
)

for provider in "${!providerDigests[@]}"; do
  digest="${providerDigests[$provider]}"

  cat <<EOF | kubectl apply -f -
apiVersion: pkg.crossplane.io/v1
kind: Provider
metadata:
  name: provider-aws-${provider}
spec:
  package: ${digest}
  # The providers seem to hardcode their dependency on the upstream
  # upbound-provider-family-azure reference. Since we're using our own, we
  # disable this check.
  skipDependencyResolution: true
  # Delete the revision history to save space
  revisionHistoryLimit: 0
  # We use pseudo_tags for the provider images, so we need to ignore the semver
  # checks.
  ignoreCrossplaneConstraints: true
  # When applicable, use the regcred secret to pull the provider images.
  packagePullSecrets:
  - name: regcred
EOF
done

for provider in "${!providerDigests[@]}"; do
  kubectl wait --for=condition=Installed "provider/provider-aws-${provider}" --timeout=10m
  kubectl wait --for=condition=Healthy "provider/provider-aws-${provider}" --timeout=10m
done

# Update the AWS family provider that was installed by the above providers as a dependency, to use our AWS family provider instead.
cat <<EOF | kubectl apply -f -
apiVersion: pkg.crossplane.io/v1
kind: Provider
metadata:
  name: upbound-provider-family-aws
spec:
  package: ${AWS_DIGEST}
  revisionHistoryLimit: 0
  ignoreCrossplaneConstraints: true
  packagePullSecrets:
  - name: regcred
EOF

kubectl wait --for=condition=Installed provider/upbound-provider-family-aws --timeout=10m
kubectl wait --for=condition=Healthy provider/upbound-provider-family-aws --timeout=10m

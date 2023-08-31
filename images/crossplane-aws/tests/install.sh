#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

cat <<EOF | kubectl apply -f -
apiVersion: pkg.crossplane.io/v1
kind: Provider
metadata:
  name: provider-aws-iam
spec:
  package: ${IAM_DIGEST}
EOF

cat <<EOF | kubectl apply -f -
apiVersion: pkg.crossplane.io/v1
kind: Provider
metadata:
  name: provider-aws-rds
spec:
  package: ${RDS_DIGEST}
EOF

cat <<EOF | kubectl apply -f -
apiVersion: pkg.crossplane.io/v1
kind: Provider
metadata:
  name: provider-aws-s3
spec:
  package: ${S3_DIGEST}
EOF

for provider in iam rds s3; do
  kubectl wait --for=condition=Installed "provider/provider-aws-${provider}" --timeout=1m
  kubectl wait --for=condition=Healthy   "provider/provider-aws-${provider}" --timeout=5m
done

# TODO(jason): These install the upstream upbound AWS provider, not ours.

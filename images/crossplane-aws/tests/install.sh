#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

cat <<EOF | kubectl apply -f -
apiVersion: pkg.crossplane.io/v1
kind: Provider
metadata:
  name: aws
spec:
  package: ${AWS_DIGEST}
EOF

cat <<EOF | kubectl apply -f -
apiVersion: pkg.crossplane.io/v1
kind: Provider
metadata:
  name: iam
spec:
  package: ${IAM_DIGEST}
EOF
cat <<EOF | kubectl apply -f -
apiVersion: pkg.crossplane.io/v1
kind: Provider
metadata:
  name: rds
spec:
  package: ${RDS_DIGEST}
EOF

cat <<EOF | kubectl apply -f -
apiVersion: pkg.crossplane.io/v1
kind: Provider
metadata:
  name: s3
spec:
  package: ${S3_DIGEST}
EOF

for provider in aws iam rds s3; do
  kubectl wait --for=condition=Installed "provider/${provider}" --timeout=1m

  # TODO
  # kubectl wait --for=condition=Healthy "provider/${provider}" --timeout=1m
done

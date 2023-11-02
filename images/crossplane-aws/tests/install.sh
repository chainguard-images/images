#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail

trap "kubectl get providers && kubectl describe providers" EXIT

# If the image is on cgr.dev and we have a cred helper for that available, use
# it to generate creds we can pass to the Crossplane control plane.
# This is necessary when pushing to a private repo, since the Crossplane
# control plane needs to pull the image to get configuration from it.
tmp=$(mktemp -d)
echo "{}" > ${tmp}/config.json
if [ -x "$(command -v docker-credential-cgr)" ]; then
  token=$(echo "cgr.dev" | docker-credential-cgr get)
  user=$(echo $token | jq -r '.Username')
  pass=$(echo $token | jq -r '.Secret')

  DOCKER_CONFIG=${tmp} crane auth login -u ${user} -p ${pass} cgr.dev
  echo "WROTE ${tmp}/config.json"
fi
head -c 100 ${tmp}/config.json
kubectl delete secret regcred -n crossplane-system || true
kubectl create secret generic regcred \
  -n crossplane-system \
  --from-file=.dockerconfigjson=${tmp}/config.json \
  --type=kubernetes.io/dockerconfigjson

cat <<EOF | kubectl apply -f -
apiVersion: pkg.crossplane.io/v1
kind: Provider
metadata:
  name: provider-aws-cloudfront
spec:
  package: ${CLOUDFRONT_DIGEST}
  packagePullSecrets:
  - name: regcred
EOF

cat <<EOF | kubectl apply -f -
apiVersion: pkg.crossplane.io/v1
kind: Provider
metadata:
  name: provider-aws-cloudwatchlogs
spec:
  package: ${CLOUDWATCHLOGS_DIGEST}
  packagePullSecrets:
  - name: regcred
EOF

cat <<EOF | kubectl apply -f -
apiVersion: pkg.crossplane.io/v1
kind: Provider
metadata:
  name: provider-aws-dynamodb
spec:
  package: ${DYNAMODB_DIGEST}
  packagePullSecrets:
  - name: regcred
EOF

cat <<EOF | kubectl apply -f -
apiVersion: pkg.crossplane.io/v1
kind: Provider
metadata:
  name: provider-aws-ec2
spec:
  package: ${EC2_DIGEST}
  packagePullSecrets:
  - name: regcred
EOF

cat <<EOF | kubectl apply -f -
apiVersion: pkg.crossplane.io/v1
kind: Provider
metadata:
  name: provider-aws-eks
spec:
  package: ${EKS_DIGEST}
  packagePullSecrets:
  - name: regcred
EOF

cat <<EOF | kubectl apply -f -
apiVersion: pkg.crossplane.io/v1
kind: Provider
metadata:
  name: provider-aws-firehose
spec:
  package: ${FIREHOSE_DIGEST}
  packagePullSecrets:
  - name: regcred
EOF

cat <<EOF | kubectl apply -f -
apiVersion: pkg.crossplane.io/v1
kind: Provider
metadata:
  name: provider-aws-iam
spec:
  package: ${IAM_DIGEST}
  packagePullSecrets:
  - name: regcred
EOF

cat <<EOF | kubectl apply -f -
apiVersion: pkg.crossplane.io/v1
kind: Provider
metadata:
  name: provider-aws-kms
spec:
  package: ${KMS_DIGEST}
  packagePullSecrets:
  - name: regcred
EOF

cat <<EOF | kubectl apply -f -
apiVersion: pkg.crossplane.io/v1
kind: Provider
metadata:
  name: provider-aws-lambda
spec:
  package: ${LAMBDA_DIGEST}
  packagePullSecrets:
  - name: regcred
EOF

cat <<EOF | kubectl apply -f -
apiVersion: pkg.crossplane.io/v1
kind: Provider
metadata:
  name: provider-aws-rds
spec:
  package: ${RDS_DIGEST}
  packagePullSecrets:
  - name: regcred
EOF

cat <<EOF | kubectl apply -f -
apiVersion: pkg.crossplane.io/v1
kind: Provider
metadata:
  name: provider-aws-s3
spec:
  package: ${S3_DIGEST}
  packagePullSecrets:
  - name: regcred
EOF

cat <<EOF | kubectl apply -f -
apiVersion: pkg.crossplane.io/v1
kind: Provider
metadata:
  name: provider-aws-sns
spec:
  package: ${SNS_DIGEST}
  packagePullSecrets:
  - name: regcred
EOF

cat <<EOF | kubectl apply -f -
apiVersion: pkg.crossplane.io/v1
kind: Provider
metadata:
  name: provider-aws-sqs
spec:
  package: ${SQS_DIGEST}
  packagePullSecrets:
  - name: regcred
EOF

for provider in cloudfront cloudwatchlogs dynamodb ec2 eks firehose iam kms lambda rds s3 sns sqs ; do
  kubectl wait --for=condition=Installed "provider/provider-aws-${provider}" --timeout=3m
  kubectl wait --for=condition=Healthy   "provider/provider-aws-${provider}" --timeout=5m
done

# Update the AWS family provider that was installed by the above providers as a dependency, to use our AWS family provider instead.

cat <<EOF | kubectl apply -f -
apiVersion: pkg.crossplane.io/v1
kind: Provider
metadata:
  name: upbound-provider-family-aws
spec:
  package: ${AWS_DIGEST}
  packagePullSecrets:
  - name: regcred
EOF

kubectl wait --for=condition=Installed provider/upbound-provider-family-aws --timeout=3m
kubectl wait --for=condition=Healthy   provider/upbound-provider-family-aws --timeout=5m

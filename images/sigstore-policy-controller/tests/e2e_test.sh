#!/usr/bin/env bash

set -ex

kubectl create namespace "${TEST_NAMESPACE}"

# Enable enforcement
kubectl label namespace "${TEST_NAMESPACE}" --overwrite policy.sigstore.dev/include=true
sleep 10

# Test with policy enforcement enabled and default deny with no policies.
if kubectl create -n "${TEST_NAMESPACE}" -f unsigned-image.yaml ; then
  echo Failed to block Pod with unsigned image.
  exit 1
fi
if kubectl create -n "${TEST_NAMESPACE}" -f signed-image.yaml ; then
  echo Failed to block Pod with signed image.
  exit 1
fi

kubectl apply -f chainguard-images.yaml
trap "kubectl delete -f chainguard-images.yaml" EXIT
sleep 10 # give the policy time to roll out

# Test with policy enforcement enabled and default deny with chainguard policy.
if kubectl create -n "${TEST_NAMESPACE}" -f unsigned-image.yaml ; then
  echo Failed to block Pod with unsigned image.
  exit 1
fi
if ! kubectl create -n "${TEST_NAMESPACE}" -f signed-image.yaml ; then
  echo Failed to allow Pod with signed image.
  exit 1
fi

# Disable enforcement
kubectl label namespace "${TEST_NAMESPACE}" --overwrite policy.sigstore.dev/include=false

# Test with policy enforcement disabled
if ! kubectl create -n "${TEST_NAMESPACE}" -f unsigned-image.yaml ; then
  echo Failed to allow Pod with unsigned image.
  exit 1
fi
if ! kubectl create -n "${TEST_NAMESPACE}" -f signed-image.yaml ; then
  echo Failed to allow Pod with signed image.
  exit 1
fi
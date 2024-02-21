#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

apk add curl

CONTROLLER_IMAGE=${CONTROLLER_IMAGE:-gcr.io/tekton-releases/github.com/tektoncd/pipeline/cmd/controller:v0.49.0}
ENTRYPOINT_IMAGE=${ENTRYPOINT_IMAGE:-gcr.io/tekton-releases/github.com/tektoncd/pipeline/cmd/entrypoint:v0.49.0}
EVENTS_IMAGE=${EVENTS_IMAGE:-gcr.io/tekton-releases/github.com/tektoncd/pipeline/cmd/events:v0.49.0}
NOP_IMAGE=${NOP_IMAGE:-gcr.io/tekton-releases/github.com/tektoncd/pipeline/cmd/nop:v0.49.0}
RESOLVERS_IMAGE=${RESOLVERS_IMAGE:-gcr.io/tekton-releases/github.com/tektoncd/pipeline/cmd/resolvers:v0.49.0}
SIDECARLOGRESULTS_IMAGE=${SIDECARLOGRESULTS_IMAGE:-gcr.io/tekton-releases/github.com/tektoncd/pipeline/cmd/sidecarlogresults:v0.49.0}
WEBHOOK_IMAGE=${WEBHOOK_IMAGE:-gcr.io/tekton-releases/github.com/tektoncd/pipeline/cmd/webhook:v0.49.0}
WORKINGDIRINIT_IMAGE=${WORKINGDIRINIT_IMAGE:-gcr.io/tekton-releases/github.com/tektoncd/pipeline/cmd/workingdirinit:v0.49.0}

curl -sL https://storage.googleapis.com/tekton-releases/pipeline/latest/release.yaml |
	sed "s|gcr.io/tekton-releases/github.com/tektoncd/pipeline/cmd/controller[a-z0-9:@.]\{1,\}|${CONTROLLER_IMAGE}|g" |
	sed "s|gcr.io/tekton-releases/github.com/tektoncd/pipeline/cmd/entrypoint[a-z0-9:@.]\{1,\}|${ENTRYPOINT_IMAGE}|g" |
	sed "s|gcr.io/tekton-releases/github.com/tektoncd/pipeline/cmd/events[a-z0-9:@.]\{1,\}|${EVENTS_IMAGE}|g" |
	sed "s|gcr.io/tekton-releases/github.com/tektoncd/pipeline/cmd/nop[a-z0-9:@.]\{1,\}|${NOP_IMAGE}|g" |
	sed "s|gcr.io/tekton-releases/github.com/tektoncd/pipeline/cmd/resolvers[a-z0-9:@.]\{1,\}|${RESOLVERS_IMAGE}|g" |
	sed "s|gcr.io/tekton-releases/github.com/tektoncd/pipeline/cmd/sidecarlogresults[a-z0-9:@.]\{1,\}|${SIDECARLOGRESULTS_IMAGE}|g" |
	sed "s|gcr.io/tekton-releases/github.com/tektoncd/pipeline/cmd/webhook[a-z0-9:@.]\{1,\}|${WEBHOOK_IMAGE}|g" |
	sed "s|gcr.io/tekton-releases/github.com/tektoncd/pipeline/cmd/workingdirinit[a-z0-9:@.]\{1,\}|${WORKINGDIRINIT_IMAGE}|g" |
	kubectl apply -f -

CHAINS_IMAGE=${CHAINS_IMAGE:-gcr.io/tekton-releases/github.com/tektoncd/chains/cmd/controller:v0.16.0}

curl -sL https://storage.googleapis.com/tekton-releases/chains/latest/release.yaml |
	sed "s|gcr.io/tekton-releases/github.com/tektoncd/chains/cmd/controller[a-z0-9:@.]\{1,\}|${CHAINS_IMAGE}|g" |
	kubectl apply -f -

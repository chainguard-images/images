cfg?=images/static/configs/wolfi.apko.yaml
TERRAFORM ?= $(shell command -v terraform)

.PHONY: apko-build
apko-build:
	apko build $(cfg) apko.local image.tar \
	--repository-append https://packages.wolfi.dev/os \
	--keyring-append    https://packages.wolfi.dev/os/wolfi-signing.rsa.pub \
	--package-append    wolfi-baselayout \
	--arch              x86_64,aarch64

.PHONY: apko-build-alpine
apko-build-alpine:
	apko build $(cfg) apko.local image.tar \
	--repository-append https://dl-cdn.alpinelinux.org/alpine/edge/main \
	--package-append    ca-certificates-bundle

TF_AUTO_APPROVE ?= 1
TF_VARS :=

ifeq ($(TF_AUTO_APPROVE),1)
TF_VARS += --auto-approve
endif

.PHONY: check-env-tf
check-env-tf:
ifndef TF_VAR_target_repository
	$(error TF_VAR_target_repository is not set)
endif

.PHONY: all
all: check-env-tf init
	$(TERRAFORM) apply $(TF_VARS)

image/%: check-env-tf init
	$(TERRAFORM) apply $(TF_VARS) -target=module.$*

init:
	$(TERRAFORM) init -upgrade

LOCAL_REGISTRY_NAME := k3d.localhost
LOCAL_REGISTRY_PORT := 5005
K3S_IMAGE := cgr.dev/chainguard/k3s:latest@sha256:cb07f771be251367d407175bd6217001ecf1b1d3ce831d1e1a1f28e3cc39025b 

k3d-registry:
	@# Create a local registry managed by k3d only if it doesn't exist
	@if ! k3d registry list | grep -q $(LOCAL_REGISTRY_NAME); then \
		k3d registry create $(LOCAL_REGISTRY_NAME) --port $(LOCAL_REGISTRY_PORT); \
	else \
		echo "Registry $(LOCAL_REGISTRY_NAME) already exists. Skipping creation."; \
	fi

k3d: k3d-registry
	@# Create the k3d cluster only if it doesn't exist
	@if ! k3d cluster list | grep -q 'k3s-default'; then \
		k3d cluster create \
			-i $(K3S_IMAGE) \
			--k3s-arg "--disable=traefik@server:0" \
			--k3s-arg "--disable=metrics-server@server:0" \
			--registry-use k3d-$(LOCAL_REGISTRY_NAME):$(LOCAL_REGISTRY_PORT); \
	else \
		echo "Cluster k3s-default already exists. Skipping creation."; \
	fi

k3d-clean:
	@# Destroy the k3d cluster, but keep the registry around since it can safely persist across clusters
	k3d cluster delete

# Note: this is dependent on using a localhost registry for TF_VAR_target_repository (k3d-registry)
# that is based on the "registry:2" image (the Docker distribution registry project)
.PHONY: what-was-pushed
what-was-pushed:
	@echo && echo "The following images were pushed to the registry:" && echo && \
		REGISTRY_CONTAINER_ID=`docker ps --format json | jq -r 'select(.Image | startswith("registry:")) | .ID'` && \
			docker logs $$REGISTRY_CONTAINER_ID 2>/dev/null | \
				grep '"PUT /v2/.*/manifests/.*' | grep ' 201 ' | grep -v 'sha256:' | \
					sed -r "s|.*\"PUT /v2/(.*)/manifests/([^ ]*).*|- `echo $$TF_VAR_target_repository | cut -d/ -f1`/\1:\2|" | uniq | sort && \
						echo

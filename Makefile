cfg?=images/static/configs/wolfi.apko.yaml
TERRAFORM ?= $(shell which terraform)

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
K3S_IMAGE := cgr.dev/chainguard/k3s:latest@sha256:c13c05d260363fadb5401b48331945ac21ed378ca832d7077f11bf89feb0a791 

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

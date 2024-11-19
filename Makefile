cfg?=images/static/configs/wolfi.apko.yaml
TERRAFORM ?= $(shell command -v terraform)

# These images either do something with Alpine,
# or are somehow incompatible with tfgen (still using tagger etc.)
TFGEN_SKIP ?= busybox,calico,git,graalvm-native,harbor,k3s,kubeflow,kubeflow-katib,maven,powershell,prometheus,static,terraform

# These are the tfgen generators applied to this repo (in order)
TFGEN_GENERATORS ?= Image01Variables,Image02Outputs,Toplevel01Modules,Toplevel02Outputs

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

.PHONY: all
all: init
	$(TERRAFORM) apply $(TF_VARS)

image/%: init
	$(TERRAFORM) apply $(TF_VARS) -target=module.$*

init:
	$(TERRAFORM) init -lockfile=readonly || $(TERRAFORM) init

init-upgrade:
	$(TERRAFORM) init -upgrade
	$(TERRAFORM) providers lock -platform=darwin_arm64 -platform=linux_amd64

LOCAL_REGISTRY_NAME := k3d.localhost
LOCAL_REGISTRY_PORT := 5005
K3S_IMAGE := cgr.dev/chainguard/k3s:latest@sha256:bea538020d58ed6454a64b3dee1ec78a82e967187b1645a13fce3002c2b8aa85

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

# Run the tfgen used in CI check, regenerate all generated.tf files)
.PHONY: tfgen
tfgen:
	(w="$(shell pwd)" && cd ../ && go run ./monopod tfgen "$${w}" --skip=$(TFGEN_SKIP) --generators=$(TFGEN_GENERATORS))

# Run tfgen for just one or more images (e.g. "make tfgen/img1,img2,img3")
tfgen/%:
	(w="$(shell pwd)" && cd ../ && go run ./monopod tfgen "$${w}" --skip=$(TFGEN_SKIP) --generators=$(TFGEN_GENERATORS) --only=$*)

# In some cases the list of images may be too large for Make to handle,
# so do the above but get the list from the environment variable TFGEN_IMAGES
# instead of passing them on the command line
tfgen-env:
	(w="$(shell pwd)" && cd ../ && go run ./monopod tfgen "$${w}" --skip=$(TFGEN_SKIP) --generators=$(TFGEN_GENERATORS) --only=${TFGEN_IMAGES})

# Clean up all generated.tf files created by tfgen
.PHONY: tfgen-clean
tfgen-clean:
	rm -f generated.tf images/**/generated.tf

.PHONY: monopod
monopod:
	(cd monopod && go install .) && which monopod && monopod version

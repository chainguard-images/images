TERRAFORM ?= $(shell command -v terraform)

# Terraform plugin cache directory for faster provider downloads
TF_PLUGIN_CACHE_DIR ?= $(HOME)/.terraform.d/plugin-cache
$(shell mkdir -p $(TF_PLUGIN_CACHE_DIR))
export TF_PLUGIN_CACHE_DIR

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

# Build an image directly with apko (e.g. make apko-build/git)
apko-build/%:
	@set -e; \
	lock="images/$*/locked_config.json"; \
	test -f "$$lock" || { echo "no lock at $$lock"; exit 1; }; \
	for key in $$(jq -r '.imageLocks | keys[]' "$$lock"); do \
		config=$$(mktemp --suffix=.json); \
		jq --arg k "$$key" '.imageLocks[$$k].configs.index | fromjson | .config' "$$lock" > "$$config"; \
		echo "==> apko build $$key -> $*-$$key.tar"; \
		apko build "$$config" "apko.local/$*-$$key:latest" "$*-$$key.tar" --arch x86_64,aarch64; \
		rm -f "$$config"; \
	done

# Images with a locked_config.json, evaluated at Makefile parse time.
IMAGES_WITH_LOCKS := $(notdir $(patsubst %/,%,$(dir $(wildcard images/*/locked_config.json))))

# Build an image with TF providers and locked_config.json (e.g. make image/git)
image/%: | init
	$(TERRAFORM) apply -auto-approve -var "image_name=$*" $(TF_APPLY_ARGS)

# Build every image that has a locked_config.json via terraform, sequentially.
.PHONY: images
images: init
	@set -e; \
	for d in images/*/; do \
		[ -f "$${d}locked_config.json" ] || continue; \
		name=$$(basename "$${d%/}"); \
		echo "==> Building $$name"; \
		$(TERRAFORM) apply -auto-approve -var "image_name=$$name" $(TF_APPLY_ARGS); \
	done

# Build every image in parallel. Use make's native -j to control concurrency.
# Example: make -j 4 images-parallel
.PHONY: images-parallel
images-parallel: $(addprefix image/,$(IMAGES_WITH_LOCKS))

fmt:
	$(TERRAFORM) fmt -check -recursive .

validate:
	$(TERRAFORM) validate

init:
	$(TERRAFORM) init -lockfile=readonly

init-upgrade:
	$(TERRAFORM) init -upgrade
	$(TERRAFORM) providers lock -platform=darwin_arm64 -platform=linux_amd64 -platform=linux_arm64

enable-active-tag-update:
	cp ./tflib/tagger/active_tags_override.tf.disabled ./tflib/tagger/active_tags_override.tf

disable-active-tag-update:
	rm ./tflib/tagger/active_tags_override.tf

LOCAL_REGISTRY_NAME := k3d.localhost
LOCAL_REGISTRY_PORT := 5005
K3S_IMAGE := cgr.dev/chainguard/k3s:latest@sha256:fb8c6e42d917a0693ceddad268458035c0d0afb2a72a09bd74dab331ea9bec5a

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

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

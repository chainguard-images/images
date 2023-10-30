cfg?=images/static/configs/wolfi.apko.yaml

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

.PHONY: init
init:
	terraform init -upgrade

TF_AUTO_APPROVE ?= 1
TF_VARS :=

ifdef TF_EXTRA_REPOSITORIES
TF_VARS += -var=extra_repositories="$(TF_EXTRA_REPOSITORIES)"
endif

ifdef TF_EXTRA_KEYRING
TF_VARS += -var=extra_keyring="$(TF_EXTRA_KEYRING)"
endif

ifdef TF_ARCHS
TF_VARS += -var=archs="$(TF_ARCHS)"
endif

ifneq ($(TF_AUTO_APPROVE),0)
TF_VARS += --auto-approve
endif

ifdef TF_TARGET_REPOSITORY
TF_VARS += -var=target_repository=$(TF_TARGET_REPOSITORY)
else
ifndef TF_VAR_target_repository
$(error One of [TF_TARGET_REPOSITORY, TF_VAR_target_repository] must be defined)
endif
endif

.PHONY: all
all: # makes all images instead of targeting specific modules
	terraform apply $(TF_VARS)

image/%:
	terraform apply $(TF_VARS) -target=module.$*

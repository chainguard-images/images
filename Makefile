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

TF_AUTO_APPROVE ?= 1
TF_VARS :=

ifdef TF_VAR_extra_repositories
TF_VARS += -var=extra_repositories='$(TF_VAR_extra_repositories)'
endif

ifdef TF_VAR_extra_keyring
TF_VARS += -var=extra_keyring='$(TF_VAR_extra_keyring)'
endif

ifdef TF_VAR_archs
TF_VARS += -var=archs='$(TF_VAR_archs)'
endif

ifeq ($(TF_AUTO_APPROVE),1)
TF_VARS += --auto-approve
endif

ifndef TF_VAR_target_repository
$(error TF_VAR_target_repository is not set)
else
TF_VARS += -var=target_repository=$(TF_VAR_target_repository)
endif

.PHONY: all
all: init
	terraform apply $(TF_VARS)

image/%:
	terraform apply $(TF_VARS) -target=module.$*

init:
	terraform init -upgrade

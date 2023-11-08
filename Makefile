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

ifeq ($(TF_AUTO_APPROVE),1)
TF_VARS += --auto-approve
endif

.PHONY: all
all: init
	terraform apply $(TF_VARS)

image/%:
	terraform apply $(TF_VARS) -target=module.$*

init:
	terraform init -upgrade

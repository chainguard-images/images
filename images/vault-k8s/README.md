<!--monopod:start-->
# vault-k8s
| | |
| - | - |
| **Status** | experimental |
| **OCI Reference** | `cgr.dev/chainguard/vault-k8s` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/vault-k8s/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
*[Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

Image with Kubernetes Intergrations for Vault.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/vault-k8s:latest
```

## Using Vault K8s

The Chainguard Vault k8s image contains the [vault-k8s](https://github.com/hashicorp/vault-k8s) binary. The binary contains various
intergrations for Kubernetes and Vault, including the Vault Agent Sidecar Injector.
This is a drop-in replacement for the Hashicorp [vault-k8s image](https://hub.docker.com/r/hashicorp/vault-k8s). 

This image is intended to be used alongside the [Chainguard
Vault](https://github.com/chainguard-images/images/tree/main/images/vault) image. See the [Vault
image docs](https://github.com/chainguard-images/images/tree/main/images/vault#helm-chart-usage) for
information on how to run these images with the [Hashicorp Helm Chart](https://github.com/hashicorp/vault-helm).

You can also run this image standalone e.g:

```shell
$ docker run cgr.dev/chainguard/vault-k8s
Usage: vault-k8s [--version] [--help] <command> [<args>]

Available commands are:
    agent-inject    Vault Agent injector service
    version         Prints the version
```

<!--monopod:start-->
# vault-k8s
| | |
| - | - |
| **Status** | experimental |
| **OCI Reference** | `cgr.dev/chainguard/vault-k8s` |
| **Variants/Tags** | ![](https://storage.googleapis.com/chainguard-images-build-outputs/summary/vault-k8s.svg) |

*[Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

Minimal image with the Vault Kubernetes integration. **EXPERIMENTAL**

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/vault-k8s:latest
```

## Using Vault K8s

The Chainguard Vault k8s image contains the `vault-k8s` binary.
This is a drop-in replacement for the upstream image.
See the [documentation there](https://github.com/hashicorp/vault-k8s) for more detailed usage.

```shell
$ docker run cgr.dev/chainguard/vault-k8s
Usage: vault-k8s [--version] [--help] <command> [<args>]

Available commands are:
    agent-inject    Vault Agent injector service
    version         Prints the version
```

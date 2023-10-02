<!--monopod:start-->
# smarter-device-manager
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/smarter-device-manager` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/smarter-device-manager/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

Smarter Device Manager is a Kubernetes device plugin designed to help manage
host-specific devices and allow them to be utilized by pods. 

It focuses primarily on edge-specific hardware like GPUs, TPUs, FPGAs, and other
peripherals on ARM hardware. Users deploy this tool to ensure that specialized
devices on edge nodes are appropriately allocated to Kubernetes workloads.

## Get It!

The image is available on `cgr.dev`:

bash
```
docker pull cgr.dev/chainguard/smarter-device-manager:latest
```

## Usage

### Manifests
Deploy using one of the example manifests provided in the upstream projects
Gitlab repository: [Smart Device Manager](https://gitlab.com/arm-research/smarter/smarter-device-manager).

> If using one of the manifests from the upstream repository, you'll need to
change the `config` mountPath to `/etc/smarter-device-manager`(in place of /root/config).

### Helm chart

The following helm chart can be used:
[helm chart](https://github.com/gabe565/charts/tree/main/charts/smarter-device-manager).

You'll need to override the image and tag:

```bash
helm repo add gabe565 https://charts.gabe565.com
helm repo update
helm install smart-device-manager gabe565/smarter-device-manager \
 --set image.repository=ttl.sh/mark/smarter-device-manager --set image.tag=latest
```

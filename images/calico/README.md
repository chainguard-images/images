<!--monopod:start-->
# calico

<!--url:start-->
<a href="https://github.com/projectcalico/calico">
<!--logo:start-->
  <img src="https://storage.googleapis.com/chainguard-academy/logos/calico/logo.svg" width="36px" height="36px" />
<!--logo:end-->
</a>
<!--url:end-->

| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/calico` |

* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/calico/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*
---
<!--monopod:end-->

<!--overview:start-->
[Calico](https://projectcalico.docs.tigera.io/) is a networking and security solution that enables Kubernetes workloads and non-Kubernetes/legacy workloads to communicate seamlessly and securely.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/calico:latest
```
<!--getting:end-->

<!--body:start-->
## Installation

There are several ways to install Calico. This document follows the upstream recommended way with the `tigera-operator` ([ref](https://docs.tigera.io/calico/latest/getting-started/kubernetes/quickstart#install-calico)).

There are two CRDs involved that work together to use the correct Chainguard Images:

```yaml
---
# ImageSet
apiVersion: operator.tigera.io/v1
kind: ImageSet
metadata:
  name: calico-v3.26.1
spec:
  images:
    - image: calico/node
      digest: ... # Replace with $(crane digest cgr.dev/chainguard/calico-node:latest)
    - image: calico/cni
      digest: ... # Replace with $(crane digest cgr.dev/chainguard/calico-cni:latest)
    - image: calico/kube-controllers
      digest: ... # Replace with $(crane digest cgr.dev/chainguard/calico-kube-controllers:latest)
    - image: calico/pod2daemon-flexvol
      digest: ... # Replace with $(crane digest cgr.dev/chainguard/calico-pod2daemon-flexvol:latest)
    - image: calico/csi
      digest: ... # Replace with $(crane digest cgr.dev/chainguard/calico-csi:latest)
    - image: calico/typha
      digest: ... # Replace with $(crane digest cgr.dev/chainguard/calico-typha:latest)
    - image: calico/node-driver-registrar
      digest: ... # Replace with $(crane digest cgr.dev/chainguard/calico-node-driver-registrar:latest)
    # This isn't used on Linux, but it needs to have a value containing a valid digest.
    - image: calico/windows-upgrade
      digest: sha256:0000000000000000000000000000000000000000000000000000000000000000

---
# Installation
apiVersion: operator.tigera.io/v1
kind: Installation
metadata:
  name: default
spec:
  variant: Calico
  registry: cgr.dev
  imagePath: chainguard
  imagePrefix: calico-
```

The above combination of `ImageSet` and `Installation` can be used as a drop in replacement for the [upstream documentation](https://docs.tigera.io/calico/latest/getting-started/kubernetes/quickstart#install-calico) step 2 (`custom-resources.yaml`) to correctly rename the Calico images to their `cgr.dev` variants.
<!--body:end-->

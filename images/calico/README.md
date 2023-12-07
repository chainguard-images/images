<!--monopod:start-->
# calico
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

There are several ways you can install Calico onto a Kubernetes cluster. This document follows method recommended in the [official Calico documentation](https://docs.tigera.io/calico/latest/getting-started/kubernetes/quickstart#install-calico) which involves using the Tigera Calico operator. 

After setting up and connecting to the Kubernetes cluster where you want to install Calico, install the Tigera Calico operator and custom resource definitions (CRDs).

```shell
kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.26.4/manifests/tigera-operator.yaml
```

Then apply the following YAML manifest to create two CRDs.

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

The combination of these `ImageSet` and `Installation` CRDs serve as a drop in replacement for [Step 2 of the upstream documentation](https://docs.tigera.io/calico/latest/getting-started/kubernetes/quickstart#install-calico). Together, these correctly rename the Calico images to their `cgr.dev` variants.

After creating the CRDs, you can ensure that the pods are running with a command like the following.

```shell
kubectl get pods -n calico-system
```
<!--body:end-->

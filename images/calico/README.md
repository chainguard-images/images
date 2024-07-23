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
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/calico:latest
```
<!--getting:end-->

<!--body:start-->
## Installation

There are several ways you can install Calico onto a Kubernetes cluster. This document follows method recommended in the [official Calico documentation](https://docs.tigera.io/calico/latest/getting-started/kubernetes/quickstart#install-calico) which involves using the Tigera Calico operator. 

#### Install Tigera Operator

```yaml
helm repo add projectcalico https://projectcalico.docs.tigera.io/charts
helm repo update

helm install calico projectcalico/tigera-operator \
    --namespace tigera-operator \
    --create-namespace \
    --set autoDiscovery.clusterName=foo \
    --set tigeraOperator.registry=cgr.dev \
    --set tigeraOperator.image=chainguard/tigera-operator \
    --set tigeraOperator.version=latest
```

After setting up and connecting to the Kubernetes cluster where you want to install Calico, install the Tigera Calico operator and custom resource definitions (CRDs).

#### Create ImageSet 

> For Calico versions < 3.28, omit `calico/key-cert-provisioner` in the example
> below, as this was only introduced in v3.28.

ImageSet is a CRD provided by the Tigera operator. It is required to define
which images are used for Calico deployments.

Note, we do not pass the registry or image names here, only the image digests.
The registry is passed when creating a Calico cluster.

```yaml
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
    - image: calico/key-cert-provisioner
      digest: ... # Replace with $(crane digest cgr.dev/chainguard/calico-key-cert-provisioner:latest)
    # This isn't used on Linux, but it needs to have a value containing a valid digest.
    - image: calico/windows-upgrade
      digest: sha256:0000000000000000000000000000000000000000000000000000000000000000
```

#### Using different image names

Providing an ImageSet allows you to specify alternative image digests, but it
does not allow you to swap in custom image names. If you wish to use images that
are named differently, you'll need to first re-tag them.

For example, `/some/registry/node-fips:` would need to be re-tagged to
`/some/registry/node:`. The digest would be the same for both image tags.

#### Create Calico installation

Once the ImageSet is completed, specify the image registry and the image prefix
to use.

Our images follow `calico-` naming format, i.e `calico-node`, do we define an
`imagePrefix`.

```yaml
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

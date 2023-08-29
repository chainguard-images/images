<!--monopod:start-->
# tigera-operator
| | |
| - | - |
| **Status** | stable |
| **OCI Reference** | `cgr.dev/chainguard/tigera-operator` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/tigera-operator/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
*[Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

Minimal Project Calico Tigera Operator Image

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/tigera-operator:latest
```

## Usage

This image is a drop-in replacement for the upstream image.
You can run it using the helm chart with:

```shell
helm repo add projectcalico https://projectcalico.docs.tigera.io/charts
helm repo update

helm install calico projectcalico/tigera-operator \
    --namespace tigera-operator \
    --create-namespace \
    --set autoDiscovery.clusterName=foo \
    --set tigeraOperator.registry=cgr.dev \
    --set tigeraOperator.image=chainguard/tigera-operator \
    --set tigeraOperator.version=latest

kubectl wait --namespace tigera-operator --for=condition=ready pod --selector name=tigera-operator --timeout=120s
```

If you're using Chainguard's Calico images, you'll need some extra configuration:

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

This instructs Tigera to use Chainguard's images at `cgr.dev/chainguard/calico-*`.

This will default to pulling images by version tags, which are not available in the public tier.
To specify image digests, use an `ImageSet`:

```yaml
apiVersion: operator.tigera.io/v1
kind: ImageSet
metadata:
  name: calico-${VERSION}
spec:
  images:
    - image: calico/cni
      digest: sha256:abcdefabcdefabcdefabcdefabcdefabcdefabcdefabcdefabcdefabcdefabcd
    - image: calico/node
      digest: sha256:abcdefabcdefabcdefabcdefabcdefabcdefabcdefabcdefabcdefabcdefabcd
    - image: calico/kube-controllers
      digest: sha256:abcdefabcdefabcdefabcdefabcdefabcdefabcdefabcdefabcdefabcdefabcd
    - image: calico/pod2daemon-flexvol
      digest: sha256:abcdefabcdefabcdefabcdefabcdefabcdefabcdefabcdefabcdefabcdefabcd
    - image: calico/csi
      digest: sha256:abcdefabcdefabcdefabcdefabcdefabcdefabcdefabcdefabcdefabcdefabcd
    - image: calico/typha
      digest: sha256:abcdefabcdefabcdefabcdefabcdefabcdefabcdefabcdefabcdefabcdefabcd
    - image: calico/node-driver-registrar
      digest: sha256:abcdefabcdefabcdefabcdefabcdefabcdefabcdefabcdefabcdefabcdefabcd
    # This isn't used on Linux, it just needs to have a value.
    - image: calico/windows-upgrade
      digest: sha256:0000000000000000000000000000000000000000000000000000000000000000
```

You can look up the digest of an image using [`crane digest`](https://github.com/google/go-containerregistry/blob/main/cmd/crane/doc/crane_digest.md):

```sh
$ crane digest cgr.dev/chainguard/calico-cni:latest
sha256:abcdefabcdefabcdefabcdefabcdefabcdefabcdefabcdefabcdefabcdefabcd
```

Each image will have a different digest, so you'll need to specify them all.
Make sure to check that the version of Calico in the image matches the version expected by Tigera.

See these docs for more information:

- https://docs.tigera.io/calico/latest/operations/image-options/alternate-registry#configure-the-operator-to-use-images
- https://docs.tigera.io/calico/latest/reference/installation/api#operator.tigera.io/v1.Installation
- https://docs.tigera.io/calico/latest/reference/installation/api#operator.tigera.io/v1.ImageSet

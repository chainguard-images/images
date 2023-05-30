<!--monopod:start-->
# calico-node
| | |
| - | - |
| **Status** | stable |
| **OCI Reference** | `cgr.dev/chainguard/calico-node` |
| **Variants/Tags** | ![](https://storage.googleapis.com/chainguard-images-build-outputs/summary/calico-node.svg) |

*[Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/calico-node
```

## Using `calico-node`

`calico-node` is part of the [`calico`](https://docs.tigera.io/calico/latest/about/) CNI, since it is rarely (if ever) used independently, the documentation below assumes `calico-node` is being used as part of the greater `calico` application.

The `calico` suite of Chainguard Images are intended to be a drop in-place replacement for the upstream images, and will work with most existing deployments.

For some distributions, `calico` comes pre-installed as the default CNI. For others, it can be installed "manually". Below is a quickstart example of how to install `calico` using Chainguard Images on a `kind` cluster:

```bash
cat > kind-values.yaml <<EOF
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
- role: worker
- role: worker
networking:
  disableDefaultCNI: true
  podSubnet: 192.168.0.0/16
EOF

# Create a kind cluster without a default CNI (to be fulfilled by calico)
kind create cluster --config kind-values.yaml

# Deploy calico using the upstream release manifests, replacing the upstream images with Chainguard Images via sed
curl -sfL https://raw.githubusercontent.com/projectcalico/calico/v3.26.0/manifests/calico.yaml | sed 's/docker.io\/calico\/node:v3.26.0/cgr.dev/chainguard/calico-node:latest/g' | kubectl apply -f -
```

For long lived, more production deployments, replace the appropriate images with the Chainguard Images equivalent in your existing `calico` deployment method. If you don't already have one consider using either the [Tigera Operator]() or the [helm chart]().

<!--monopod:start-->
# kubernetes-csi-external-snapshotter
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/kubernetes-csi-external-snapshotter` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/kubernetes-csi-external-snapshotter/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
 Sidecar container that watches Kubernetes Snapshot CRD objects and triggers CreateSnapshot/DeleteSnapshot against a CSI endpoint.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/kubernetes-csi-external-snapshotter:latest
```
<!--getting:end-->

<!--body:start-->

## Usage

This image collection is a drop-in replacement for the following images:

- `registry.k8s.io/sig-storage/csi-snapshotter`
- `registry.k8s.io/sig-storage/snapshot-controller`
- `registry.k8s.io/sig-storage/snapshot-validation-webhook`

### Snapshotter

To deploy the snapshotter, apply the manifests found in the upstream project [here](https://github.com/kubernetes-csi/external-snapshotter/tree/master/deploy/kubernetes/csi-snapshotter). You'll need to adjust the `image` to use `cgr.dev/chainguard/kubernetes-csi-external-snapshotter` instead. You can do this by extending the existing [kustomization file](https://github.com/kubernetes-csi/external-snapshotter/blob/master/deploy/kubernetes/csi-snapshotter/kustomization.yaml) as follows:

```yaml
# ...
images:
  - name: registry.k8s.io/sig-storage/csi-snapshotter
    newName: cgr.dev/chainguard/kubernetes-csi-external-snapshotter
    digest: <insert image digest>
```

### Snapshot Controller

To deploy the snapshotter, apply the manifests found in the upstream project [here](https://github.com/kubernetes-csi/external-snapshotter/tree/master/deploy/kubernetes/snapshot-controller). You'll need to adjust the `image` to use `cgr.dev/chainguard/kubernetes-csi-external-snapshot-controller` instead. You can do this by extending the existing [kustomization file](https://github.com/kubernetes-csi/external-snapshotter/blob/master/deploy/kubernetes/snapshot-controller/kustomization.yaml) as follows:

```yaml
# ...
images:
  - name: registry.k8s.io/sig-storage/snapshot-controller
    newName: cgr.dev/chainguard/kubernetes-csi-external-snapshot-controller
    digest: <insert image digest>
```

### Validation Webhook

To deploy the webhook, see the [documentation in the upstream project](https://github.com/kubernetes-csi/external-snapshotter/tree/master/deploy/kubernetes/webhook-example#how-to-deploy-the-webhook). You'll just need to replace the container spec's `image` value with `cgr.dev/chainguard/kubernetes-csi-external-snapshot-validation-webhook`.

You can verify that the webhook is working by following [these instructions](https://github.com/kubernetes-csi/external-snapshotter/tree/master/deploy/kubernetes/webhook-example#verify-the-webhook-works) to submit an invalid snapshot definition and see whether it gets rejected.

<!--body:end-->

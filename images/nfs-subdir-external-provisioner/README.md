<!--monopod:start-->
# nfs-subdir-external-provisioner
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/nfs-subdir-external-provisioner` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/nfs-subdir-external-provisioner/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Dynamic sub-dir volume provisioner on a remote NFS server.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/nfs-subdir-external-provisioner:latest
```
<!--getting:end-->

<!--body:start-->
## Testing

The NFS subdir external provisioner is an automatic provisioner for Kubernetes that uses your already configured NFS server, automatically creating Persistent Volumes.

To get more information about the nfs-subdir-external-provisioner, visit the [GitHub repository](https://github.com/kubernetes-sigs/nfs-subdir-external-provisioner).

There is a Helm chart available for the nfs-subdir-external-provisioner. To install it, run:

```
$ helm repo add nfs-subdir-external-provisioner https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner/

$ helm install nfs-subdir-external-provisioner nfs-subdir-external-provisioner/nfs-subdir-external-provisioner \
    --set image.repository=cgr.dev/chainguard/nfs-subdir-external-provisioner \
    --set image.tag=latest \
    --set nfs.server=x.x.x.x \
    --set nfs.path=/exported/path
```
<!--body:end-->

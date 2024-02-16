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

<!--overview:start-->
Minimalist Wolfi-based image for smarter device manager.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/smarter-device-manager:latest
```
<!--getting:end-->

<!--body:start-->

Smarter-device-manager is a Kubernetes tool designed for IoT applications,
enabling containers to securely access host devices like sensors, actuators,
and various hardware interfaces.


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
 --set image.repository=cgr.dev/chainguard/smarter-device-manager --set image.tag=latest
```
<!--body:end-->

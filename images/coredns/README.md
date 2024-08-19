<!--monopod:start-->
# coredns
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/coredns` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/coredns/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
[CoreDNS](https://coredns.io) is a fast and flexible DNS server written in Go
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/coredns:latest
```
<!--getting:end-->

<!--body:start-->
## Using CoreDNS

The Chainguard CoreDNS image is a drop-in replacement for the upstream image.
See the [upstream documentation](https://coredns.io/) for usage information specific to your environment.

Below is a quickstart example using the upstream helm chart:

```bash
helm repo add coredns https://coredns.github.io/helm
helm install coredns coredns/coredns \
	--set image.repository="cgr.dev/chainguard/coredns" \
	--set image.tag="latest" \
	--set isClusterService=false
```
<!--body:end-->

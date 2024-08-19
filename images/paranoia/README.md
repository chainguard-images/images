<!--monopod:start-->
# paranoia
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/paranoia` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/paranoia/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
Minimalist Wolfi-based paranoia image for inspecting certificate authorities in container images
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/paranoia:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

Paranoia can be used to list out the certificates in a container image:

```
docker run --rm cgr.dev/chainguard/paranoia:latest export alpine:latest
```
<!--body:end-->

<!--monopod:start-->
# bincapz
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/bincapz` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/bincapz/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
Enumerate binary capabilities, including malicious behaviors.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/bincapz:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

Inspect the crane image manifest using the crane image:

```
docker run --rm cgr.dev/chainguard/crane:latest manifest cgr.dev/chainguard/crane:latest --platform=linux/amd64
```
<!--body:end-->

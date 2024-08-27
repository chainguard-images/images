<!--monopod:start-->
# netcat
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/netcat` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/netcat/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
Minimal image for Debian port of OpenBSD's netcat.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/netcat:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

```
docker run --rm -ti cgr.dev/chainguard/netcat -zv google.com 443
```

See [here](https://manpages.debian.org/unstable/netcat-openbsd/nc.1.en.html) for more invocation details.
<!--body:end-->

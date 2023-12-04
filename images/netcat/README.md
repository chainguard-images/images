<!--monopod:start-->
# netcat
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/netcat` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/netcat/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimal image for Debian port of OpenBSD's netcat. **EXPERIMENTAL**
<!--overview:end-->

<!--getting:start-->
## Get It!
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

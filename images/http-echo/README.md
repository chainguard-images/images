<!--monopod:start-->
# http-echo
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/http-echo` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/http-echo/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
Minimalist Wolfi-based http-echo image that echos what you start it with.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/http-echo:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

```
CONTAINER=$(docker run -d --rm cgr.dev/chainguard/http-echo:latest -listen=:8080 -text="hello world")
curl localhost:8080
docker kill $CONTAINER
```
<!--body:end-->

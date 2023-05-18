<!--monopod:start-->
# http-echo
| | |
| - | - |
| **Status** | stable |
| **OCI Reference** | `cgr.dev/chainguard/http-echo` |
| **Variants/Tags** | ![](https://storage.googleapis.com/chainguard-images-build-outputs/summary/http-echo.svg) |

*[Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

Minimalist Wolfi-based http-echo image that echos what you start it with.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/http-echo:latest
```

## Usage

```
CONTAINER=$(docker run -d --rm cgr.dev/chainguard/http-echo:latest -listen=:8080 -text="hello world")
curl localhost:8080
docker kill $CONTAINER
```

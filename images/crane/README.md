<!--monopod:start-->
# crane
| | |
| - | - |
| **Status** | stable |
| **OCI Reference** | `cgr.dev/chainguard/crane` |
| **Variants/Tags** | ![](https://storage.googleapis.com/chainguard-images-build-outputs/summary/crane.svg) |

*[Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

Minimalist Wolfi-based crane image for interacting with registries.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/crane:latest
```

## Usage

Inspect the crane image manifest using the crane image:

```
docker run --rm cgr.dev/chainguard/crane:latest manifest cgr.dev/chainguard/crane:latest
```

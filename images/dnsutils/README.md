<!--monopod:start-->
# dnsutils
| | |
| - | - |
| **Status** | stable |
| **OCI Reference** | `cgr.dev/chainguard/dnsutils` |
| **Variants/Tags** | ![](https://storage.googleapis.com/chainguard-images-build-outputs/summary/dnsutils.svg) |

*[Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

Minimalist Wolfi-based image with dns utilities from `bind-tools`, e.g.:

* `dig`
* `nslookup`
* `nsupdate`

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/dnsutils:latest
```

## Usage

Run the `dig` command against `cgr.dev`.

```
docker run --rm cgr.dev/chainguard/dnsutils:latest dig cgr.dev
```

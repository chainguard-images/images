<!--monopod:start-->
# vt
| | |
| - | - |
| **Status** | stable |
| **OCI Reference** | `cgr.dev/chainguard/vt` |
| **Variants/Tags** | ![](https://storage.googleapis.com/chainguard-images-build-outputs/summary/vt.svg) |

*[Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

Minimal image with the Virus Total CLI - `vt-cli`.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/vt:latest
```

This image contains the `vt-cli` tool.
Note that you will need an api key for most operations.
This can be configured with `vt init`, with the `--apikey` flag, or with the `VTCLI_APIKEY` environment variable.

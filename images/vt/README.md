<!--monopod:start-->
# vt
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/vt` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/vt/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
Minimal image with the Virus Total CLI - `vt-cli`.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/vt:latest
```
<!--getting:end-->

<!--body:start-->
This image contains the `vt-cli` tool.
Note that you will need an api key for most operations.
This can be configured with `vt init`, with the `--apikey` flag, or with the `VTCLI_APIKEY` environment variable.
<!--body:end-->

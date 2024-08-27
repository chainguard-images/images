<!--monopod:start-->
# spdx-tools
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/spdx-tools` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/spdx-tools/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
Check SPDX SBOM for validity
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/spdx-tools:latest
```
<!--getting:end-->

<!--body:start-->
This image contains the SPDX tool available from here: https://github.com/spdx/tools-java

Using this tool you can verify the SPDX SBOM for validity:

```
docker run -v $(pwd):/tmp cgr.dev/chainguard/spdx-tools:latest Verify /tmp/sbom.json
```

You can also compare docs, "pretty-print" an SPDX SBOM, and more.
<!--body:end-->

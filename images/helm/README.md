<!--monopod:start-->
# helm
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/helm` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/helm/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

Minimalist Wolfi-based helm images for deploying helm applications to a kubernetes cluster. Includes `dev` variant. **EXPERIMENTAL**

- [Documentation](https://edu.chainguard.dev/chainguard/chainguard-images/reference/helm)
- [Provenance Information](https://edu.chainguard.dev/chainguard/chainguard-images/reference/helm/provenance_info/)

## Image Variants

Our `latest` tags use the most recent build of the [Wolfi helm](https://github.com/wolfi-dev/os/blob/main/helm.yaml) package. The following tagged variants are available without authentication:

- `latest`: This is a distroless image for running helm to install packages to a kubernetes cluster. It does not include `apk-tools` or `bash`, so no shell will be available.
- `latest-dev`: This is a development / builder image that includes Composer, apk-tools, and busybox. This variant allows you to customize your final image with additional Wolfi packages.

### Helm Version
This will automatically pull the image to your local system and execute the command `helm version`:

```shell
docker run --rm  cgr.dev/chainguard/helm version
```

You should see output similar to this:

```
version.BuildInfo{Version:"v3.13.1", GitCommit:"3547a4b5bf5edb5478ce352e18858d8a552a4110", GitTreeState:"dirty", GoVersion:"go1.21.3"}
```

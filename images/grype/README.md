<!--monopod:start-->
# grype
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/grype` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/grype/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
A vulnerability scanner for container images and filesystems
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/grype:latest
```
<!--getting:end-->

<!--body:start-->
- [Documentation](https://edu.chainguard.dev/chainguard/chainguard-images/reference/grype)
- [Provenance Information](https://edu.chainguard.dev/chainguard/chainguard-images/reference/grype/provenance_info/)
<!-- TODO: add Getting Started Guide - [Getting Started Guide](https://edu.chainguard.dev/chainguard/chainguard-images/reference/grype/getting-started-grype/) -->

## Image Variants

Our `latest` tag uses the most recent build of the [Wolfi grype](https://github.com/wolfi-dev/os/blob/main/grype.yaml) package. The following tagged variant is available without authentication:

- `latest`: This is an image for running `grype` commands. It does not include a shell or other applications.

### grype help
This will automatically pull the image to your local system and execute the command `grype help`:

```shell
docker run --rm cgr.dev/chainguard/grype help


A vulnerability scanner for container images, filesystems, and SBOMs.

Supports the following image sources:
    grype yourrepo/yourimage:tag             defaults to using images from a Docker daemon
    grype path/to/yourproject                a Docker tar, OCI tar, OCI directory, SIF container, or generic filesystem directory

You can also explicitly specify the scheme to use:
    grype podman:yourrepo/yourimage:tag          explicitly use the Podman daemon
    grype docker:yourrepo/yourimage:tag          explicitly use the Docker daemon
    grype docker-archive:path/to/yourimage.tar   use a tarball from disk for archives created from "docker save"
    grype oci-archive:path/to/yourimage.tar      use a tarball from disk for OCI archives (from Podman or otherwise)
    grype oci-dir:path/to/yourimage              read directly from a path on disk for OCI layout directories (from Skopeo or otherwise)
    grype singularity:path/to/yourimage.sif      read directly from a Singularity Image Format (SIF) container on disk
    grype dir:path/to/yourproject                read directly from a path on disk (any directory)
    grype sbom:path/to/syft.json                 read Syft JSON from path on disk
    grype registry:yourrepo/yourimage:tag        pull image directly from a registry (no container runtime required)
    grype purl:path/to/purl/file                 read a newline separated file of purls from a path on disk

You can also pipe in Syft JSON directly:
	syft yourimage:tag -o json | grype

Usage:
  grype [command]
```
<!--body:end-->

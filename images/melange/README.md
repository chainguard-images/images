<!--monopod:start-->
# melange
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/melange` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/melange/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Container image for running [melange](https://github.com/chainguard-dev/melange) workflows to build APK packages.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/melange:latest
```
<!--getting:end-->

<!--body:start-->
To build the melange workflow in [examples](tests/minimal.yaml):

```
docker run --privileged -v "$PWD":/work cgr.dev/chainguard/melange build /work/tests/minimal.yaml
```

Output will be in the `packages` directory.

To build the melange package for the host architecture:

```
docker run --privileged -v "$PWD":/work cgr.dev/chainguard/melange build --empty-workspace --arch $(uname -m) /work/tests/minimal.yaml
```

To get a shell, you can use the `-dev` variant, and change the entrypoint:

```
docker run --privileged -v "$PWD":/work -it --entrypoint /bin/sh cgr.dev/chainguard/melange:latest-dev

/ # melange version
...
```
Note that melange uses bubblewrap internally, which requires various Linux capabilities, hence the
use of `--privileged`. Because of this requirement, we recommend this image is used only for local
development and testing.
<!--body:end-->

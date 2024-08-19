<!--monopod:start-->
# mdbook
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/mdbook` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/mdbook/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
Minimal image that contains [mdbook](https://rust-lang.github.io/mdBook/).
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/mdbook:latest
```
<!--getting:end-->

<!--body:start-->
# Usage

Example: build an mdbook project in the `/work` directory

```
docker run --rm \
    -v "${PWD}":/work \
    -w /work \
    cgr.dev/chainguard/mdbook:latest
    init --force --title chainguard-images --ignore git
```
<!--body:end-->

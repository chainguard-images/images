<!--monopod:start-->
# mdbook
| | |
| - | - |
| **Status** | stable |
| **OCI Reference** | `cgr.dev/chainguard/mdbook` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/mdbook/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
*[Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

This is an image that contains mdbook.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/mdbook:latest
```

# Usage

Example: build an mdbook project in the `/work` directory

```
docker run --rm \
    -v "${PWD}":/work \
    -w /work \
    cgr.dev/chainguard/mdbook:latest
    init --force --title chainguard-images --ignore git
```

<!--monopod:start-->
# tesseract
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/tesseract` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/tesseract/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimal image that contains tesseract
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/tesseract:latest
```
<!--getting:end-->

<!--body:start-->
# Usage

tessaract sample Example: OCR a eurotext.png file to .txt

```
docker run --rm \
    -v "${PWD}":/work \
    -w /work \
    cgr.dev/chainguard/tesseract:latest
    eurotext.png -
```
<!--body:end-->

<!--monopod:start-->
# tesseract
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/tesseract` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/tesseract/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

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

tessaract sample Example: OCR an image from a URL to standard output

```
$ docker run --rm \
    -v "${PWD}":/work \
    -w /work \
    cgr.dev/chainguard/tesseract:latest
    https://tesseract-ocr.github.io/tessdoc/images/eurotext.png -
The (quick) [brown] {fox} jumps!
Over the $43,456.78 <lazy> #90 dog
& duck/goose, as 12.5% of E-mail
from aspammer@website.com is spam.
Der ,schnelle” braune Fuchs springt
iiber den faulen Hund. Le renard brun
«rapide» saute par-dessus le chien
paresseux. La volpe marrone rapida
salta sopra il cane pigro. El zorro
marrén rapido salta sobre el perro
perezoso. A raposa marrom ripida
salta sobre o cdo preguigoso.
```
<!--body:end-->

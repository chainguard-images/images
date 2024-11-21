<!--monopod:start-->
# gomplate
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/gomplate` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/gomplate/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimalist Wolfi-based gomplate image for template rendering.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/gomplate:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

Example usage

```
$ docker run --rm cgr.dev/chainguard/gomplate:latest -i 'the answer is: {{ mul 6 7 }}'
the answer is: 42
```

<!--body:end-->